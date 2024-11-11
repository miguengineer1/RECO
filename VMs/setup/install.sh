#!/bin/bash

# For better error handling and reliability
set -euo pipefail

function print_vars() {
	echo $TARGET_SYSTEM
	echo $TARGET_LAB_STATE
	echo $CURRENT_DIR
	echo $CONFIG_FILES
}

function help() {
	echo "Usage: install.sh <target_system> <target_lab_state>"
	echo "		system=(slackware|solaris)"
	echo "		target_lab_state=(1-7)"
}

# Setup variables
CURRENT_DIR=$(pwd)
TARGET_SYSTEM=$1
TARGET_LAB_STATE=$2
CONFIG_FILES="$CURRENT_DIR/config/$TARGET_SYSTEM/lab0$TARGET_LAB_STATE"

if [[ "$TARGET_SYSTEM" != "slackware" && "$TARGET_SYSTEM" != "solaris" ]]; then
	echo "'$TARGET_SYSTEM' is not a valid target system"
	help
	exit 1
fi

if [[ ! "$TARGET_LAB_STATE" =~ ^[1-7]$ ]]; then
	echo "$TARGET_LAB_STATE out of bounds"
	help
	exit 1
fi

if [ ! -d "$CONFIG_FILES" ]; then
	echo "Directory $CONFIG_FILES does not exist"
	exit 1
fi

$CONFIG_FILES/install.sh
