#!/bin/bash
###############################################################################
#                               Documentation                                 #
###############################################################################
#                                                                             #
# Description                                                                 #
#     :                                                                       #
#                                                                             #
#                                                                             #
#                                                                             #
###############################################################################
#                        Setup HDFS Layer Directories                         #
###############################################################################

fn_create_local_directory "${LOCAL_BASE_DIR}/${RAW_RES}"

fn_create_local_directory "${LOCAL_BASE_DIR}/${RAW_UNRES}"

fn_create_local_directory "${LOCAL_BASE_DIR}/${RAW_RES_CAN}"

fn_create_local_directory "${LOCAL_BASE_DIR}/${RAW_UNRES_CAN}"

fn_create_local_directory "${LOCAL_BASE_DIR}/${WORK_RES}"

fn_create_local_directory "${LOCAL_BASE_DIR}/${WORK_UNRES}"

fn_create_local_directory "${LOCAL_BASE_DIR}/${WORK_TEAM}"

fn_create_local_directory "${LOCAL_BASE_DIR}/${ENRICHED_RES}"

fn_create_local_directory "${LOCAL_BASE_DIR}/${ENRICHED_UNRES}"

fn_create_local_directory "${LOCAL_BASE_DIR}/${ENRICHED_TEAM}"

fn_create_local_directory "${LOCAL_BASE_DIR}/${PUBLISH_RES}"

fn_create_local_directory "${LOCAL_BASE_DIR}/${PUBLISH_UNRES}"

fn_create_local_directory "${LOCAL_BASE_DIR}/${PUBLISH_TEAM}"

fn_create_local_directory "${LOCAL_BASE_DIR}/${TRANSFER_IN}"

fn_create_local_directory "${LOCAL_BASE_DIR}/${TRANSFER_OUT}"

################################################################################
#                                     End                                      #
################################################################################