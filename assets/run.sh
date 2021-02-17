#!/bin/bash

echo "$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )" > /tmp/test
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
${SCRIPTPATH}/../Resources/dosbox-x.app/Contents/MacOS/DosBox -conf Resources/dosbox.conf -defaultdir ${SCRIPTPATH}/../