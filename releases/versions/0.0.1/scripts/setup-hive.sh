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
#                           Identify Script Home                              #
###############################################################################

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/upc-product-cdc/etc/hive/upc-product.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/upc-product-cdc/etc/schema/upc-product-current.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/upc-product-cdc/etc/hive/upc-product.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/upc-product-cdc/etc/schema/upc-product-history.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/upc-product-cdc/etc/hive/upc-product.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/upc-product-cdc/etc/schema/upc-product-increment.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/upc-product-cdc/etc/hive/upc-product.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/upc-product-cdc/etc/schema/upc-product-temp.hql" wait



fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-schedule-cdc/etc/hive/employee-work-schedule.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-schedule-cdc/etc/schema/employee-work-schedule-current.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-schedule-cdc/etc/hive/employee-work-schedule.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-schedule-cdc/etc/schema/employee-work-schedule-history.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-schedule-cdc/etc/hive/employee-work-schedule.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-schedule-cdc/etc/schema/employee-work-schedule-increment.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-schedule-cdc/etc/hive/employee-work-schedule.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-schedule-cdc/etc/schema/employee-work-schedule-temp.hql" wait



fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-time-cdc/etc/hive/employee-work-time.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-time-cdc/etc/schema/employee-work-time-current.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-time-cdc/etc/hive/employee-work-time.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-time-cdc/etc/schema/employee-work-time-history.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-time-cdc/etc/hive/employee-work-time.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-time-cdc/etc/schema/employee-work-time-increment.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-time-cdc/etc/hive/employee-work-time.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/employee-work-time-cdc/etc/schema/employee-work-time-temp.hql" wait



fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-champ-cdc/etc/hive/retail-customer-champ.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-champ-cdc/etc/schema/retail-customer-champ-current.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-champ-cdc/etc/hive/retail-customer-champ.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-champ-cdc/etc/schema/retail-customer-champ-history.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-champ-cdc/etc/hive/retail-customer-champ.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-champ-cdc/etc/schema/retail-customer-champ-increment.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-champ-cdc/etc/hive/retail-customer-champ.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-champ-cdc/etc/schema/retail-customer-champ-temp.hql" wait



fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ecom-cdc/etc/hive/retail-customer-ecom.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ecom-cdc/etc/schema/retail-customer-ecom-current.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ecom-cdc/etc/hive/retail-customer-ecom.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ecom-cdc/etc/schema/retail-customer-ecom-history.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ecom-cdc/etc/hive/retail-customer-ecom.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ecom-cdc/etc/schema/retail-customer-ecom-increment.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ecom-cdc/etc/hive/retail-customer-ecom.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ecom-cdc/etc/schema/retail-customer-ecom-temp.hql" wait



fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-email-cdc/etc/hive/retail-customer-email.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-email-cdc/etc/schema/retail-customer-email-current.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-email-cdc/etc/hive/retail-customer-email.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-email-cdc/etc/schema/retail-customer-email-history.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-email-cdc/etc/hive/retail-customer-email.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-email-cdc/etc/schema/retail-customer-email-increment.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-email-cdc/etc/hive/retail-customer-email.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-email-cdc/etc/schema/retail-customer-email-temp.hql" wait



fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ldap-cdc/etc/hive/retail-customer-ldap.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ldap-cdc/etc/schema/retail-customer-ldap-current.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ldap-cdc/etc/hive/retail-customer-ldap.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ldap-cdc/etc/schema/retail-customer-ldap-history.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ldap-cdc/etc/hive/retail-customer-ldap.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ldap-cdc/etc/schema/retail-customer-ldap-increment.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ldap-cdc/etc/hive/retail-customer-ldap.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-customer-ldap-cdc/etc/schema/retail-customer-ldap-temp.hql" wait



fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-item-cdc/etc/hive/retail-item.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-item-cdc/etc/schema/retail-item-current.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-item-cdc/etc/hive/retail-item.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-item-cdc/etc/schema/retail-item-history.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-item-cdc/etc/hive/retail-item.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-item-cdc/etc/schema/retail-item-increment.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/retail-item-cdc/etc/hive/retail-item.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/retail-item-cdc/etc/schema/retail-item-temp.hql" wait



fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/supply-item-cdc/etc/hive/supply-item.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/supply-item-cdc/etc/schema/supply-item-current.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/supply-item-cdc/etc/hive/supply-item.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/supply-item-cdc/etc/schema/supply-item-history.hql" &

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/supply-item-cdc/etc/hive/supply-item.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/supply-item-cdc/etc/schema/supply-item-increment.hql"

fn_run_hive \
    "${PROJECT_HOME_DIRECTORY}" \
    "${PROJECT_HOME_DIRECTORY}/supply-item-cdc/etc/hive/supply-item.hive.properties" \
    "${PROJECT_HOME_DIRECTORY}/supply-item-cdc/etc/schema/supply-item-temp.hql"


################################################################################
#                                     End                                      #
################################################################################