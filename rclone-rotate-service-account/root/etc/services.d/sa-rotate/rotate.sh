#!/bin/bash

service_accounts=( ${SERVICE_ACCOUNTS_ROTATE_ACCOUNTS} )
echo "Sleeping for ${SERVICE_ACCOUNT_ROTATE_INITIAL_SLEEP} before starting"
sleep ${SERVICE_ACCOUNT_ROTATE_INITIAL_SLEEP}
while :
    do
    for i in "${service_accounts[@]}"
    do
        echo "Rotating service account to /service_account_keys/${i}"
        rclone --config=/rclone/rclone.conf backend set ${RCLONE_CONFIG_NAME}: -o service_account_file=/service_account_keys/${i}

        echo "Validating that we rotated properly."
        rclone --config=/rclone/rclone.conf backend get ${RCLONE_CONFIG_NAME}: -o service_account_file
        sleep ${SERVICE_ACCOUNT_ROTATE_SLEEP}
    done
done