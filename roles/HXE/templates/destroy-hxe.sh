#!/usr/bin/expect -f
set timeout 3

        # spawn /usr/sap/hostctrl/exe/saphostexec -uninstall

        spawn /hana/shared/HXE/hdblcm/hdblcm --uninstall --components=all

        expect  "^Do you want to continue?*"
        send    "y\r"

        #spawn /hana/shared/HXE/hdblcm/hdblcm
        #expect  "^Enter selected action index*"
        #send    "5\r"
        #expect  "^Enter comma-separated list of the selected indices*"
        #send    "1\r"
        #expect  "^Do you want to continue?*"
        #send    "y\r"

        interact

exit

