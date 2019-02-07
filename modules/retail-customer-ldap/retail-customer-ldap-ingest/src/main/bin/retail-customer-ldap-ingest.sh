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
. ${MODULE_HOME}/etc/bin/retail-customer-ldap-ingest.shell.properties

###############################################################################
#                                Implementation                               #
###############################################################################


fn_check_batch_id_exist "${BATCH_ID_DATA_DIR}"/retail-customer-ldap/"${BATCH_ID_FILE_NAME}"

fn_log_info "Importing table retail-customer-ldap from teradata incrementally"

fn_get_value_from_file "${MIN_RECORD_DIR}/retail-customer-ldap_min_record.value"

MIN_VAL="'${VAL}'"

fn_get_value_from_file "${MAX_RECORD_DIR}/retail-customer-ldap_max_record.value"

MAX_VAL="'${VAL}'"

fn_get_value_from_file "${BATCH_ID_DATA_DIR}"/retail-customer-ldap/"${BATCH_ID_FILE_NAME}"

BATCH_ID="${VAL}"


if fn_check_if_file_exists "${MIN_RECORD_DIR}/retail-customer-ldap_first.txt"
then
  fn_run_teradata_to_raw_incremental \
    ${TDCH_JAR} \
    ${NUMBER_OF_MAPPERS} \
    ${TERADATA_ENV} \
    ${DATABASE_NAME} \
    ${USERNAME} \
    ${PASSWORD_FILE} \
    ${INPUT_DIR}/batch_id=${BATCH_ID} \
    retail_customer_ldap \
    "creationtm >= ${MIN_VAL} and creationtm <= ${MAX_VAL}" \
    ${FIELDS_TERMINATOR}

  fn_delete_local_file "${MIN_RECORD_DIR}/retail-customer-ldap_first.txt"

else
  fn_run_teradata_to_raw_incremental \
    ${TDCH_JAR} \
    ${NUMBER_OF_MAPPERS} \
    ${TERADATA_ENV} \
    ${DATABASE_NAME} \
    ${USERNAME} \
    ${PASSWORD_FILE} \
    ${INPUT_DIR}/batch_id=${BATCH_ID} \
    retail_customer_ldap \
    "creationtm > ${MIN_VAL} and creationtm <= ${MAX_VAL}" \
    ${FIELDS_TERMINATOR}

fi



#fn_run_hive \
#	"${MODULE_HOME}" \
#    "${MODULE_HOME}/etc/hive/retail-customer-ldap.hive.properties" \
#    "${MODULE_HOME}/etc/schema/retail-customer-ldap-ingest.hql"


###############################################################################
#                                     End                                     #
###############################################################################
