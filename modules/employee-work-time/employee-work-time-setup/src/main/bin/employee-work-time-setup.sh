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
. ${MODULE_HOME}/etc/bin/employee-work-time-setup.shell.properties

###############################################################################
#                                Implementation                               #
###############################################################################


if fn_check_if_file_exists "${BATCH_ID_DATA_DIR}"/employee-work-time/"${BATCH_ID_FILE_NAME}"
then

  export BATCH_ID=$(cat "${BATCH_ID_DATA_DIR}"/employee-work-time/"${BATCH_ID_FILE_NAME}")

else

  fn_create_local_directory "${BATCH_ID_DATA_DIR}/employee-work-time/"
  fn_get_batch_id
  echo "${BATCH_ID}" > "${BATCH_ID_DATA_DIR}"/employee-work-time/"${BATCH_ID_FILE_NAME}"

fi

fn_log_info "Successfully Created Batch ID"

if fn_check_if_file_exists "${MIN_RECORD_DIR}/employee-work-time_min_record.value"
then
fn_get_value_from_file "${MIN_RECORD_DIR}/employee-work-time_min_record.value"

MIN_VAL="'${VAL}'"

else
fn_log_info "Fetching minimum value from teradata"

fn_get_min_val \
    jdbc:teradata://${TERADATA_ENV}/DATABASE=${DATABASE_NAME},CHARSET=UTF16 \
    ${DATABASE_NAME} \
    ${USERNAME} \
    ${PASSWORD_FILE} \
    EMPLOYEE_WORK_TIME \
    creationtm



fn_write_val_to_file \
"$MIN_VAL" \
"${MIN_RECORD_DIR}/employee-work-time_min_record.value"
fi

fn_log_info "Fetching maximum value from teradata"

fn_get_max_val \
    jdbc:teradata://${TERADATA_ENV}/DATABASE=${DATABASE_NAME},CHARSET=UTF16 \
    ${DATABASE_NAME} \
    ${USERNAME} \
    ${PASSWORD_FILE} \
    EMPLOYEE_WORK_TIME \
    creationtm

fn_write_val_to_file \
"$MAX_VAL" \
"${MAX_RECORD_DIR}/employee-work-time_max_record.value"


###############################################################################
#                                     End                                     #
###############################################################################
