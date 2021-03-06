
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

INSERT INTO TABLE ${DB_WORK}.history_upc_product
PARTITION(batch_id)
  SELECT * FROM ${DB_WORK}.increment_upc_product;


--#############################################################################
--#                                   End                                     #
--#############################################################################

