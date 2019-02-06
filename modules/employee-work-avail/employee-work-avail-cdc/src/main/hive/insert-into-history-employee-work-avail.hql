
--#############################################################################
--#                             Documentation                                 #
--#############################################################################
--#                                                                           #
--# Description                                                               #
--#     :                                                                     #
--#                                                                           #
--#                                                                           #
--#                                                                           #
--#                                                                           #
--#                                                                           #
--#                                                                           #
--#############################################################################
--#                              Declaration                                  #
--##############################################################################


set hive.exec.dynamic.partition.mode=nonstrict;

INSERT INTO TABLE ${DB_WORK}.history_employee_work_avail
PARTITION(batch_id)
  SELECT * FROM ${DB_WORK}.increment_employee_work_avail;


--#############################################################################
--#                                   End                                     #
--#############################################################################
