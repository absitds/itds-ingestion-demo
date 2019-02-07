#!/bin/bash
###############################################################################
#                               Documentation                                 #
###############################################################################
#                                                                             #
# Description                                                                 #
#     : This script contains declaration of all dependent scripts             #
#                                                                             #
#                                                                             #
#                                                                             #
###############################################################################
#                               Declarations                                  #
###############################################################################

# Teradata to raw incremental load
#
# Arguments:
#   tdch_jars
#       -The path to the required tdch jars
#   job_queue_name
#       -The job queue name that is to be used
#   num_map
#       -The number of mappers to be used
#   teradata_env
#       -The teradata enviroment
#   terdata_database
#       -The teradata database to be used
#   teradata_username
#       -The user to be used
#   teradata_psswd_file
#       -The password for the teradata user
#   target_path
#       -The path where you want to store the data
#   teradata_source_tablename
#       -The source table that needs to be extracted
#   source_condition
#       -The source condition to be used
#
fn_run_teradata_to_raw_incremental(){

  tdch_jar=$1

  fn_assert_variable_is_set "tdch_jar" "${tdch_jar}"


  num_map=$2

  fn_assert_variable_is_set "num_map" "${num_map}"

  teradata_env=$3

  fn_assert_variable_is_set "teradata_env" "${teradata_env}"

  teradata_database=$4

  fn_assert_variable_is_set "teradata_database" "${teradata_database}"

  teradata_username=$5

  fn_assert_variable_is_set "teradata_username" "${teradata_username}"

  teradata_psswd_file=$6

  fn_assert_variable_is_set "teradata_psswd_file" "${teradata_psswd_file}"

  export target_path=$7

  fn_assert_variable_is_set "target_path" "${target_path}"

  teradata_source_tablename=$8

  fn_assert_variable_is_set "teradata_source_tablename" "${teradata_source_tablename}"

  source_condition=$9

  fn_assert_variable_is_set "source_condition" "${source_condition}"

  fields_terminator=${10}

  fn_assert_variable_is_set "fields_terminator" "${fields_terminator}"

  fn_delete_hdfs_directory "${target_path}"

  hadoop jar "${tdch_jar}" \
       com.teradata.connector.common.tool.ConnectorImportTool \
       -D tdch.num.mappers=${num_map} \
       -classname com.teradata.jdbc.TeraDriver \
       -url jdbc:teradata://${teradata_env}/DATABASE=${teradata_database} \
       -username ${teradata_username} \
       -password `cat ${teradata_psswd_file}` \
       -jobtype hdfs \
       -fileformat textfile \
       -separator ${fields_terminator} \
       -targetpaths "${target_path}" \
       -sourcetable "${teradata_source_tablename}" \
       -sourceconditions "${source_condition}" \
       -nullstring '\N' \
   	   -nullnonstring '\N'

  exit_code=$?

  if [[ "${exit_code}" != "${EXIT_CODE_SUCCESS}" ]];then

        fn_delete_hdfs_directory "${target_path}"
        fn_exit_with_failure_message "1" "unable to fetch data from teradata"

  fi

}

# Teradata to raw one time load
#
# Arguments:
#   tdch_jars
#       -The path to the required tdch jars
#   job_queue_name
#       -The job queue name that is to be used
#   num_map
#       -The number of mappers to be used
#   teradata_env
#       -The teradata enviroment
#   terdata_database
#       -The teradata database to be used
#   teradata_username
#       -The user to be used
#   teradata_psswd_file
#       -The password for the teradata user
#   target_path
#       -The path where you want to store the data
#   teradata_source_tablename
#       -The source table that needs to be extracted
#   source_condition
#       -The source condition to be used
#
fn_run_teradata_to_raw_one_time(){

  tdch_jar=$1

  fn_assert_variable_is_set "tdch_jar" "${tdch_jar}"

  num_map=$2

  fn_assert_variable_is_set "num_map" "${num_map}"

  teradata_env=$3

  fn_assert_variable_is_set "teradata_env" "${teradata_env}"

  teradata_database=$4

  fn_assert_variable_is_set "teradata_database" "${teradata_database}"

  teradata_username=$5

  fn_assert_variable_is_set "teradata_username" "${teradata_username}"

  teradata_psswd_file=$6

  fn_assert_variable_is_set "teradata_psswd_file" "${teradata_psswd_file}"

  export target_path=$7

  fn_assert_variable_is_set "target_path" "${target_path}"

  teradata_source_tablename=$8

  fn_assert_variable_is_set "teradata_source_tablename" "${teradata_source_tablename}"

  source_condition=$9

  fn_assert_variable_is_set "source_condition" "${source_condition}"

  fields_terminator=${10}

  fn_assert_variable_is_set "fields_terminator" "${fields_terminator}"

  fn_delete_hdfs_directory "${target_path}"

  hadoop jar "${tdch_jar}" \
       com.teradata.connector.common.tool.ConnectorImportTool \
       -D tdch.num.mappers=${num_map} \
       -classname com.teradata.jdbc.TeraDriver \
       -url jdbc:teradata://${teradata_env}/DATABASE=${teradata_database} \
       -username ${teradata_username} \
       -password `cat ${teradata_psswd_file}` \
       -jobtype hdfs \
       -fileformat textfile \
       -separator ${fields_terminator} \
       -targetpaths "${target_path}" \
       -sourcetable "${teradata_source_tablename}" \
       -sourceconditions "${source_condition}" \
       -nullstring '\N' \
   	   -nullnonstring '\N'

  exit_code=$?

  if [[ "${exit_code}" != "${EXIT_CODE_SUCCESS}" ]];then

        fn_delete_hdfs_directory "${target_path}"
        fn_exit_with_failure_message "1" "unable to fetch data from teradata"

  fi

}

# Netezza to raw one time load
#
# Arguments:
#   job_queue_name
#       -The job queue name that is to be used
#   num_map
#       -The number of mappers to be used
#   netezza_env
#       -The netezza enviroment
#   netezza_database
#       -The netezza database to be used
#   netezza_username
#       -The user to be used
#   netezza_psswd
#       -The password for the netezza user
#   target_path
#       -The path where you want to store the data
#   netezza_source_tablename
#       -The source table that needs to be extracted
#   netezza_source_condition
#       -The source condition to be used
#   split_condition
#       -The split condition to be used
#
fn_run_netezza_to_raw_one_time(){

  job_queue_name=$1

  fn_assert_variable_is_set "job_queue_name" "${job_queue_name}"

  num_map=$2

  fn_assert_variable_is_set "num_map" "${num_map}"

  netezza_env=$3

  fn_assert_variable_is_set "netezza_env" "${netezza_env}"

  netezza_database=$4

  fn_assert_variable_is_set "netezza_database" "${netezza_database}"

  netezza_username=$5

  fn_assert_variable_is_set "netezza_username" "${netezza_username}"

  netezza_psswd=$6

  fn_assert_variable_is_set "netezza_psswd" "${netezza_psswd}"

  export target_path=$7

  fn_assert_variable_is_set "target_path" "${target_path}"

  netezza_source_tablename=$8

  fn_assert_variable_is_set "netezza_source_tablename" "${netezza_source_tablename}"

  netezza_source_condition=$9

  fn_assert_variable_is_set "netezza_source_condition" "${netezza_source_condition}"

  split_condition=${10}

  fn_assert_variable_is_set "split_condition" "${split_condition}"

  fn_delete_hdfs_directory "${target_path}"

  sqoop import  -D mapreduce.job.queuename="${job_queue_name}" \
                --connect jdbc:netezza://"${netezza_env}"/"${netezza_database}" \
                --username "${netezza_username}" \
                --password "${netezza_psswd}" \
                --table "${netezza_source_tablename}" \
                --target-dir "${target_path}" \
                --split-by "${split_condition}" \
                --m "${num_map}" \
                --fields-terminated-by "${FIELDS_TERMINATOR}" \
                --null-string '\\N' \
                --null-non-string '\\N'


  exit_code=$?

  if [[ "${exit_code}" != "${EXIT_CODE_SUCCESS}" ]];then

        fn_delete_hdfs_directory "${target_path}"
        fn_exit_with_failure_message "1" "unable to fetch data from netezza"

  fi

}

# Netezza to raw one time load
#
# Arguments:
#   job_queue_name
#       -The job queue name that is to be used
#   num_map
#       -The number of mappers to be used
#   netezza_env
#       -The netezza enviroment
#   netezza_database
#       -The netezza database to be used
#   netezza_username
#       -The user to be used
#   netezza_psswd
#       -The password for the netezza user
#   target_path
#       -The path where you want to store the data
#   netezza_source_tablename
#       -The source table that needs to be extracted
#   netezza_source_condition
#       -The source condition to be used
#   split_condition
#       -The split condition to be used
#
fn_run_netezza_to_raw_incremental(){

  job_queue_name=$1

  fn_assert_variable_is_set "job_queue_name" "${job_queue_name}"

  netezza_num_map=$2

  fn_assert_variable_is_set "netezza_num_map" "${netezza_num_map}"

  netezza_env=$3

  fn_assert_variable_is_set "netezza_env" "${netezza_env}"

  netezza_database=$4

  fn_assert_variable_is_set "netezza_database" "${netezza_database}"

  netezza_username=$5

  fn_assert_variable_is_set "netezza_username" "${netezza_username}"

  netezza_psswd=$6

  fn_assert_variable_is_set "netezza_psswd" "${netezza_psswd}"

  export target_path=$7

  fn_assert_variable_is_set "target_path" "${target_path}"

  netezza_source_tablename=$8

  fn_assert_variable_is_set "netezza_source_tablename" "${netezza_source_tablename}"

  netezza_source_condition=$9

  fn_assert_variable_is_set "netezza_source_condition" "${netezza_source_condition}"

  split_condition=${10}

  fn_assert_variable_is_set "split_condition" "${split_condition}"


  fn_delete_hdfs_directory "${target_path}"

  sqoop import  -D mapreduce.job.queuename="${job_queue_name}" \
                --connect jdbc:netezza://"${netezza_env}"/"${netezza_database}" \
                --username "${netezza_username}" \
                --password "${netezza_psswd}" \
                --table "${netezza_source_tablename}" \
                --target-dir "${target_path}" \
                --split-by "${split_condition}" \
                --m "${netezza_num_map}" \
                --fields-terminated-by "${FIELDS_TERMINATOR}" \
                --where "${netezza_source_condition}" \
                --null-string '\\N' \
                --null-non-string '\\N'

  exit_code=$?

  if [[ "${exit_code}" != "${EXIT_CODE_SUCCESS}" ]];then

        fn_delete_hdfs_directory "${target_path}"
        fn_exit_with_failure_message "1" "unable to fetch data from netezza"

  fi

}


# Oracle to raw one time load
#
# Arguments:
#
#   num_map
#       -The number of mappers to be used
#   oracle_env
#       -The oracle enviroment
#   oracle_database
#       -The oracle database to be used
#   oracle_username
#       -The user to be used
#   oracle_psswd_file
#       -The password for the oracle user
#   target_path
#       -The path where you want to store the data
#   split_condition
#       -The split condition to be used
#
fn_run_oracle_to_raw_one_time(){

  num_map=$1

  fn_assert_variable_is_set "num_map" "${num_map}"

  oracle_connection_string=$2

  fn_assert_variable_is_set "oracle_connection_string" "${oracle_connection_string}"

  oracle_database=$3

  fn_assert_variable_is_set "oracle_database" "${oracle_database}"

  oracle_username=$4

  fn_assert_variable_is_set "oracle_username" "${oracle_username}"

  oracle_psswd_file=$5

  fn_assert_variable_is_set "oracle_psswd_file" "${oracle_psswd_file}"

  export target_path=$6

  fn_assert_variable_is_set "target_path" "${target_path}"

  oracle_source_tablename=$7

  fn_assert_variable_is_set "oracle_source_tablename" "${oracle_source_tablename}"

  fields_terminator=$8

  fn_assert_variable_is_set "fields_terminator" "${fields_terminator}"


  fn_delete_hdfs_directory "${target_path}"

  sqoop import \
  --connect jdbc:oracle:thin:@${oracle_connection_string} \
  --username ${oracle_username} \
  --password `cat ${oracle_psswd_file}`  \
  --table  ${oracle_source_tablename} \
  --target-dir ${target_path} \
  --m ${num_map} \
  --fields-terminated-by ${fields_terminator} \
  --null-string '\\N' \
  --null-non-string '\\N'

  exit_code=$?

  if [[ "${exit_code}" != "${EXIT_CODE_SUCCESS}" ]];then

        fn_delete_hdfs_directory "${target_path}"
        fn_exit_with_failure_message "1" "unable to fetch data from oracle"

  fi

  }

  # Oracle to raw incremental load
  #
  # Arguments:
  #   num_map
  #       -The number of mappers to be used
  #   oracle_env
  #       -The oracle enviroment
  #   oracle_database
  #       -The oracle database to be used
  #   oracle_username
  #       -The user to be used
  #   oracle_psswd_file
  #       -The password for the oracle user
  #   target_path
  #       -The path where you want to store the data
  #   split_condition
  #       -The split condition to be used
  #
  fn_run_oracle_to_raw_incremental(){

    num_map=$1

    fn_assert_variable_is_set "num_map" "${num_map}"

    oracle_connection_string=$2

    fn_assert_variable_is_set "oracle_connection_string" "${oracle_connection_string}"

    oracle_database=$3

    fn_assert_variable_is_set "oracle_database" "${oracle_database}"

    oracle_username=$4

    fn_assert_variable_is_set "oracle_username" "${oracle_username}"

    oracle_psswd_file=$5

    fn_assert_variable_is_set "oracle_psswd_file" "${oracle_psswd_file}"

    export target_path=$6

    fn_assert_variable_is_set "target_path" "${target_path}"

    oracle_source_tablename=$7

    fn_assert_variable_is_set "oracle_source_tablename" "${oracle_source_tablename}"

    fields_terminator=$8

    fn_assert_variable_is_set "fields_terminator" "${fields_terminator}"

    oracle_source_condition=$9

    fn_assert_variable_is_set "oracle_source_condition" "${oracle_source_condition}"

    fn_delete_hdfs_directory "${target_path}"

    sqoop import \
    --connect jdbc:oracle:thin:@${oracle_connection_string} \
    --username ${oracle_username} \
    --password `cat ${oracle_psswd_file}`  \
    --query  "select * from ${oracle_database}.${oracle_source_tablename} where ${oracle_source_condition} and \$CONDITIONS"  \
    --target-dir ${target_path} \
    --m ${num_map} \
    --fields-terminated-by ${fields_terminator} \
    --null-string '\\N' \
    --null-non-string '\\N'

    exit_code=$?

    if [[ "${exit_code}" != "${EXIT_CODE_SUCCESS}" ]];then

          fn_delete_hdfs_directory "${target_path}"
          fn_exit_with_failure_message "1" "unable to fetch data from oracle"

    fi

    }

  function fn_get_min_val(){

      jdbc_url="${1}"

      fn_assert_variable_is_set "jdbc_url" "${jdbc_url}"

      database="${2}"

      fn_assert_variable_is_set "database" "${database}"

      username="${3}"

      fn_assert_variable_is_set "username" "${username}"

      psswd_file="${4}"

      fn_assert_variable_is_set "psswd_file" "${psswd_file}"

      tablename="${5}"

      fn_assert_variable_is_set "tablename" "${tablename}"

      increment_column_name="${6}"

      fn_assert_variable_is_set "increment_column_name" "${increment_column_name}"

      export MN_VAL=$(sqoop eval \
                        --connect ${jdbc_url} \
                        -username ${username} \
                        -password `cat ${psswd_file}` \
                        --query  "SELECT min(${increment_column_name}) from ${database}.${tablename}")

      export  MIN_VAL=`echo $MN_VAL | cut -d '|' -f 4`

      exit_code=`fn_get_exit_code $?`

      success_message="Successfully fetched previous date from ${tablename}"

      failure_message="Failed to fetch previous date from  ${tablename}"

      fn_handle_exit_code "${exit_code}" "${success_message}" "${failure_message}" "${fail_on_error}"

    }


function fn_get_min_val_to_char(){

      jdbc_url="${1}"

      fn_assert_variable_is_set "jdbc_url" "${jdbc_url}"

      database="${2}"

      fn_assert_variable_is_set "database" "${database}"

      username="${3}"

      fn_assert_variable_is_set "username" "${username}"

      psswd_file="${4}"

      fn_assert_variable_is_set "psswd_file" "${psswd_file}"

      tablename="${5}"

      fn_assert_variable_is_set "tablename" "${tablename}"

      increment_column_name="${6}"

      fn_assert_variable_is_set "increment_column_name" "${increment_column_name}"

      export MN_VAL=$(sqoop eval \
                        --connect ${jdbc_url} \
                        -username ${username} \
                        -password `cat ${psswd_file}` \
                        --query  "SELECT to_char(min(${increment_column_name})) from ${database}.${tablename}")

      export  MIN_VAL=`echo $MN_VAL | cut -d '|' -f 4`

      exit_code=`fn_get_exit_code $?`

      success_message="Successfully fetched previous date from ${tablename}"

      failure_message="Failed to fetch previous date from  ${tablename}"

      fn_handle_exit_code "${exit_code}" "${success_message}" "${failure_message}" "${fail_on_error}"

    }



    function fn_get_max_val(){

      jdbc_url="${1}"

      fn_assert_variable_is_set "jdbc_url" "${jdbc_url}"

      database="${2}"

      fn_assert_variable_is_set "database" "${database}"

      username="${3}"

      fn_assert_variable_is_set "username" "${username}"

      psswd_file="${4}"

      fn_assert_variable_is_set "psswd_file" "${psswd_file}"

      tablename="${5}"

      fn_assert_variable_is_set "tablename" "${tablename}"

      increment_column_name="${6}"

      fn_assert_variable_is_set "increment_column_name" "${increment_column_name}"

      export MN_VAL=$(sqoop eval \
                        --connect ${jdbc_url} \
                        -username ${username} \
                        -password `cat ${psswd_file}` \
                        --query  "SELECT max(${increment_column_name}) from ${database}.${tablename}")

      export  MAX_VAL=`echo $MN_VAL | cut -d '|' -f 4`


      exit_code=`fn_get_exit_code $?`

      success_message="Successfully fetched previous date from ${tablename}"

      failure_message="Failed to fetch previous date from  ${tablename}"

      fn_handle_exit_code "${exit_code}" "${success_message}" "${failure_message}" "${fail_on_error}"

    }

function fn_get_max_val_to_char(){

      jdbc_url="${1}"

      fn_assert_variable_is_set "jdbc_url" "${jdbc_url}"

      database="${2}"

      fn_assert_variable_is_set "database" "${database}"

      username="${3}"

      fn_assert_variable_is_set "username" "${username}"

      psswd_file="${4}"

      fn_assert_variable_is_set "psswd_file" "${psswd_file}"

      tablename="${5}"

      fn_assert_variable_is_set "tablename" "${tablename}"

      increment_column_name="${6}"

      fn_assert_variable_is_set "increment_column_name" "${increment_column_name}"

      export MN_VAL=$(sqoop eval \
                        --connect ${jdbc_url} \
                        -username ${username} \
                        -password `cat ${psswd_file}` \
                        --query  "SELECT to_char(max(${increment_column_name})) from ${database}.${tablename}")

      export  MAX_VAL=`echo $MN_VAL | cut -d '|' -f 4`


      exit_code=`fn_get_exit_code $?`

      success_message="Successfully fetched previous date from ${tablename}"

      failure_message="Failed to fetch previous date from  ${tablename}"

      fn_handle_exit_code "${exit_code}" "${success_message}" "${failure_message}" "${fail_on_error}"

    }



#/**
#* Import data from mysql to target directory using sqoop
#*@param queue
#*@param database name of the mysql database
#*@param username mysql server username
#*@param password mysql server password
#*@param tablename name of the table
#*@param target_dir name of the target directory
#*@param mappers no of mappers to run for running the sqoop job
#*@param field_terminator character which terminates the field
#*@param mysql_host hostname of mysql server
#*@param mysql_port port of mysql server
#*/

function fn_run_mysql_to_raw_one_time(){

    queue=${1}
    fn_assert_variable_is_set "queue" "${queue}"

    database=${2}
    fn_assert_variable_is_set "database" "${database}"

    username=${3}
    fn_assert_variable_is_set "username" "${username}"

    password=${4}
    fn_assert_variable_is_set "password" "${password}"

    tablename=${5}
    fn_assert_variable_is_set "tablename" "${tablename}"

    target_dir=${6}
    fn_assert_variable_is_set "target_dir" "${target_dir}"

    mappers=${7}
    fn_assert_variable_is_set "mappers" "${mappers}"

    field_terminator=${8}
    fn_assert_variable_is_set "field_terminator" "${field_terminator}"

    mysql_host=${9}
    fn_assert_variable_is_set "mysql_host" "${mysql_host}"

    mysql_port=${10}
    fn_assert_variable_is_set "mysql_port" "${mysql_port}"

    fn_delete_hdfs_directory "${target_dir}"

    sqoop import \
        --connect jdbc:mysql://"${mysql_host}":"${mysql_port}"/"${database}" \
        --username "${username}" \
        --password "${password}" \
        --table "${tablename}" \
        --target-dir "${target_dir}" \
        --m "${mappers}" \
        --fields-terminated-by "${field_terminator}" \
        --null-string '\\N' \
        --null-non-string '\\N'

    exit_code=$?

    if [[ "${exit_code}" != "${EXIT_CODE_SUCCESS}" ]];then

       fn_delete_hdfs_directory "${target_path}"
       fn_exit_with_failure_message "1" "Sqoop import failed for table ${tablename}"

    fi
}

#/**
#* Run sqoop eval to get the max of incremental column and store it in a variable
#*@param db_host hostname of mysql server
#*@param db_port port of mysql server
#*@param database_name name of the database
#*@param username mysql server username
#*@param password mysql server password
#*@param table_name name of the table
#*@param incremental_column column of table on which incremental load needs to be performed
#*/

function fn_get_incremental_date(){

 db_host=${1}

 fn_assert_variable_is_set "db_host" "${db_host}"

 db_port=${2}

 fn_assert_variable_is_set "db_port" "${db_port}"

 database_name=${3}

 fn_assert_variable_is_set "database_name" "${database_name}"

 username=${4}

 fn_assert_variable_is_set "username" "${username}"

 password=${5}

 fn_assert_variable_is_set "password" "${password}"

 table_name=${6}

 fn_assert_variable_is_set "table_name" "${table_name}"

 incremental_column=${7}

 fn_assert_variable_is_set "incremental_column" "${incremental_column}"

   export RAW_INCREMENTAL_DATE=$(sqoop eval \
      --connect jdbc:mysql://"${db_host}":"${db_port}"/"${database_name}" \
      --username "${username}"  \
      --password "${password}" \
      --query "SELECT max(${incremental_column}) FROM ${database_name}.${table_name}")

   export INCREMENTAL_DATE=$(echo $RAW_INCREMENTAL_DATE | cut -d "|" -f 4)

   fn_is_valid_date $INCREMENTAL_DATE

   if [ exit_code == ${EXIT_CODE_FAIL} ];

   then
     fn_exit_with_failure_message "1" "Invalid date INCREMENTAL_DATE = $INCREMENTAL_DATE"

   fi

   exit_code=$?

   success_message="Successfully fetched max ${incremental_column}  date from ${table_name}"

   failure_message="Failed to fetch max ${incremental_column} date from  ${table_name}"

   fn_handle_exit_code "${exit_code}" "${success_message}" "${failure_message}" "${fail_on_error}"

}

#/**
#* Import data from mysql to target directory using sqoop incrementally using an incremental column
#*@param queue job scheduling queue for mapreduce
#*@param database name of the mysql database
#*@param username mysql server username
#*@param password mysql server password
#*@param tablename name of the table
#*@param target_dir name of the target directory
#*@param mappers no of mappers to run for running the sqoop job
#*@param field_terminator character which terminates the field
#*@param mysql_host hostname of mysql server
#*@param mysql_port port of mysql server
#*@param incremental_column column of table on which incremental load needs to be performed
#*/


function fn_run_mysql_to_raw_incremental(){

    queue=${1}
    fn_assert_variable_is_set "queue" "${queue}"

    database=${2}
    fn_assert_variable_is_set "database" "${database}"

    username=${3}
    fn_assert_variable_is_set "username" "${username}"

    password=${4}
    fn_assert_variable_is_set "password" "${password}"

    tablename=${5}
    fn_assert_variable_is_set "tablename" "${tablename}"

    target_dir=${6}
    fn_assert_variable_is_set "target_dir" "${target_dir}"

    mappers=${7}
    fn_assert_variable_is_set "mappers" "${mappers}"

    field_terminator=${8}
    fn_assert_variable_is_set "field_terminator" "${field_terminator}"

    mysql_host=${9}
    fn_assert_variable_is_set "mysql_host" "${mysql_host}"

    mysql_port=${10}
    fn_assert_variable_is_set "mysql_port" "${mysql_port}"

    incremental_column=${11}
    fn_assert_variable_is_set "incremental_column" "${incremental_column}"

    fn_delete_hdfs_directory "${target_dir}"

    fn_get_incremental_date \
      "${mysql_host}" \
      "${mysql_port}" \
      "${database}" \
      "${username}" \
      "${password}" \
      "${tablename}" \
      "${incremental_column}"

    test -f "${LAST_EXTRACTED_DATE_DIR}"/"${tablename}"_date.txt

    exit_code=$?

    if [ $exit_code == ${EXIT_CODE_SUCCESS} ];
    then
      export MIN_DATE=$( cat "${LAST_EXTRACTED_DATE_DIR}"/"${tablename}"_date.txt )
      export SOURCE_CONDITION="${incremental_column} > ${MIN_DATE} and ${incremental_column} <= ${INCREMENTAL_DATE}"

    else
      export SOURCE_CONDITION="${incremental_column} <= ${INCREMENTAL_DATE}"

    fi

    sqoop import \
        --connect jdbc:mysql://"${mysql_host}":"${mysql_port}"/"${database}" \
        --username "${username}" \
        --password "${password}" \
        --table "${tablename}" \
        --target-dir "${target_dir}" \
        --m "${mappers}" \
        --fields-terminated-by "${field_terminator}" \
        --where "${SOURCE_CONDITION}" \
        --null-string '\\N' \
        --null-non-string '\\N'

    exit_code=$?

    if [[ "${exit_code}" != "${EXIT_CODE_SUCCESS}" ]];then

       fn_delete_hdfs_directory "${target_path}"
       fn_exit_with_failure_message "1" "Sqoop import failed for table ${tablename}"
    fi

}

###############################################################################
#                                     End                                     #
###############################################################################
