#!/usr/bin/expect -f
set timeout 3

        spawn /opt/hxe/installer/setup_hxe.sh

        expect  "^express edition installer root directory*"
        send    "/opt/hxe/installer/HANA_EXPRESS_20\r"

        expect  "^Enter SAP HANA system ID*"
        send    "HXE\r"

        expect  "^Enter instance number*"
        send    "90\r"

        expect  "^Component*"
        send    "server\r"

        expect  "^Enter local host name*"
        send    "sles15-ha01\r"

        expect  "^Enter HDB master password:*"
        send    "Changeme1234\r"

        expect  "^Confirm \"HDB master\" password:*"
        send    "Changeme1234\r"

        expect  "^Install SAP HANA Automated Predictive Library?*"
        send    "Y\r"

        expect  "^Proceed with installation?*"
        send    "Y\r"

        interact

exit

