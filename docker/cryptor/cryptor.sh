#!/bin/bash

if [ -r "${CRYPTOR_KEYFILE}" ];
then
  keyfile="${CRYPTOR_KEYFILE}"
else
  echo "CRYPTOR_KEYFILE is invalid: ${CRYPTOR_KEYFILE}"
  exit 1
fi

if [ -r "${CRYPTOR_DATA}" ];
then
  data="${CRYPTOR_DATA}"
else
  echo "CRYPTOR_DATA is invalid: ${CRYPTOR_DATA}"
  exit 1
fi

if [ "x${CRYPTOR_OPERATION}" = "xenc" ];
then
  ccrypt -e -r -k ${keyfile} ${data}
elif [ "x${CRYPTOR_OPERATION}" = "xdec" ];
then
  ccrypt -d -r -k ${keyfile} ${data}
else
  echo "Environment variable CRYPTOR_OPERATION invalid: ${CRYPTOR_OPERATION}"
  exit 1
fi
