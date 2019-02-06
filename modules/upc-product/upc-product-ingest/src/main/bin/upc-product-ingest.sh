#!/bin/bash
###############################################################################
#                               Documentation                                 #
###############################################################################
#                                                                             #
# Description                                                                 #
#     :
#                                                                             #
#                                                                             #
#                                                                             #
###############################################################################
#                           Identify Script Home                              #
################################################################################
#Find the script file home
pushd . > /dev/null
SCRIPT_DIRECTORY="${BASH_SOURCE[0]}";
while([ -h "${SCRIPT_DIRECTORY}" ]);
do
  cd "`dirname "${SCRIPT_DIRECTORY}"`"
  SCRIPT_DIRECTORY="$(readlink "`basename "${SCRIPT_DIRECTORY}"`")";
done
cd "`dirname "${SCRIPT_DIRECTORY}"`" > /dev/null
SCRIPT_DIRECTORY="`pwd`";
popd  > /dev/null
MODULE_HOME="`dirname "${SCRIPT_DIRECTORY}"`"
###############################################################################
#                           Import Dependencies                               #
###############################################################################

#Load common dependencies
. ${MODULE_HOME}/bin/import-dependecies.sh
#. ${MODULE_HOME}/bin/project-functions.sh
. ${MODULE_HOME}/etc/bin/upc-product-ingest.shell.properties

###############################################################################
#                                Implementation                               #
###############################################################################


fn_check_batch_id_exist "${BATCH_ID_DATA_DIR}"/upc-product/"${BATCH_ID_FILE_NAME}"

fn_log_info "Importing table upc-product from teradata incrementally"

fn_get_value_from_file "${MIN_RECORD_DIR}/upc-product_min_record.value"

MIN_VAL="'${VAL}'"

fn_get_value_from_file "${MAX_RECORD_DIR}/upc-product_max_record.value"

MAX_VAL="'${VAL}'"

fn_get_value_from_file "${BATCH_ID_DATA_DIR}"/upc-product/"${BATCH_ID_FILE_NAME}"

BATCH_ID="${VAL}"


fn_run_teradata_to_raw_incremental \
    ${TDCH_JAR} \
    ${NUMBER_OF_MAPPERS} \
    ${TERADATA_ENV} \
    ${DATABASE_NAME} \
    ${USERNAME} \
    ${PASSWORD_FILE} \
    ${FS_PATH}/increment_upc_product/batch_id=${BATCH_ID} \
    upc_product \
    "last_update_ts >= ${MIN_VAL} and last_update_ts < ${MAX_VAL}" \
    ${FIELDS_TERMINATOR}




#fn_run_hive \
#	"${MODULE_HOME}" \
#    "${MODULE_HOME}/etc/hive/upc-product.hive.properties" \
#    "${MODULE_HOME}/etc/schema/upc-product-ingest.hql"


###############################################################################
#                                     End                                     #
###############################################################################
