
# Trial Downloads SAP Hana Express
https://developers.sap.com/trials-downloads.html


# How to install SAP HANA Express Edition in OpenSUSE 15

[ Server ]
1) Install X11 Packages
$ zypper install xorg-x11-xauth
$ zypper install xorg-x11-server

2) Setting X11Forwaring yes in /etc/ssh/sshd_config
$ Setting X11Forwaring yes in /etc/ssh/sshd_config

3) Install OpenJDK
$ zypper install java-*


[ Client ]
* Check if Java is installed already

1) ssh -X root@192.168.0.121
2) mkdir /root/Downloads
3) sh /HXEDownloadManager_linux.bin
4) Download below binaries

cd ~/downloads <-- assume that HXEDownloadManager_linux.bin is in this directory
chmod +x HXEDownloadManager_linux.bin <- execution permissions
./HXEDownloadManager_linux.bin linuxx86_64 installer -d /opt/hxe/ hxe.tgz hxexsa.tgz clients_linux_x86_64.tgz apl.tgz

# Installation Steps
~~~
$ zypper install insserv-compat


$ mkdir -p /opt/hxe/installer
$ cp /root/hxe.tgz /opt/hxe/
$ cp /root/hxexsa.tgz /opt/hxe/
$ cp /root/api.tgz /opt/hxe/
$ cp /root/apl.tgz /opt/hxe/

$ tar xzf hxe.tgz -C installer/
$ tar xzf hxexsa.tgz -C installer/
$ tar xzf apl.tgz -C installer/

$ cd installer/
$ ./setup_hxe.sh


root@sles15-ha01:/opt/hxe/installer# ./setup_hxe.sh
hostname: Name or service not known
Enter HANA, express edition installer root directory:
    Hint: <extracted_path>/HANA_EXPRESS_20
HANA, express edition installer root directory [/opt/hxe/installer/HANA_EXPRESS_20]:

The SAP HANA system ID (SID) is three uppercase alphanumeric characters to identify the SAP HANA system.

Enter SAP HANA system ID [HXE]:

An instance number is a two-digit numeric identifier for the SAP HANA instance.

Enter instance number [90]:

Enter component to install:
   server - HANA server, Application Function Library, SAP HANA EPM-MDS
   all    - HANA server, Application Function Library, SAP HANA EPM-MDS, Extended Services + apps (XSA)
Component [all]:

Enter local host name []: sles15-node01

Password must be at least 8 characters in length.  It must contain at least
1 uppercase letter, 1 lowercase letter, and 1 number.  Special characters
are allowed, except \ (backslash), ' (single quote), " (double quotes),
` (backtick), and $ (dollar sign).

Enter HDB master password:
Confirm "HDB master" password:

Do you need to use proxy server to access the internet? [N] :

SAP HANA Automated Predictive Library (APL) is an Application Function Library
(AFL) which exposes the data mining capabilities of the Automated Analytics
engine in SAP HANA through a set of functions.
Install SAP HANA Automated Predictive Library? (Y/N) : Y


##############################################################################
# Summary before execution                                                   #
##############################################################################
HANA, express edition installer : /opt/hxe/installer/HANA_EXPRESS_20
  Component(s) to install                   : HANA server, Application Function Library, SAP HANA EPM-MDS, and Extended Services + apps (XSA)
  Host name                                 : sles15-node01
  HANA system ID                            : HXE
  HANA instance number                      : 90
  Master password                           : ********
  Log file                                  : /var/tmp/setup_hxe_2024-05-04_00.37.44.log
  Proxy host                                : N/A
  Proxy port                                : N/A
  Hosts with no proxy                       : N/A
  Install Automated Predictive Library      : Yes

Proceed with installation? (Y/N) : Y

Installing HDB server...


SAP HANA Lifecycle Management - SAP HANA Express Edition 2.00.072.00.1690304772
*******************************************************************************


Start reading from input channel...
... Done.

Summary before execution:
=========================

SAP HANA Express Edition System Installation
   Installation Parameters
      Remote Execution: ssh
      Use single master password for all users, created during installation: Yes
      Database Isolation: low
      Install Execution Mode: optimized
      Installation Path: /hana/shared
      Local Host Name: sles15-node01
      SAP HANA System ID: HXE
      Instance Number: 90
      Local Host Worker Group: default
      System Usage: development
      Location of Data Volumes: /hana/shared/data/HXE
      Location of Log Volumes: /hana/shared/log/HXE
      Directory containing custom configurations: /opt/hxe/installer/HANA_EXPRESS_20/DATA_UNITS/HDB_SERVER_LINUX_X86_64/configurations/custom
      Certificate Host Names: sles15-node01 -> sles15-node01
      System Administrator Home Directory: /usr/sap/HXE/home
      System Administrator Login Shell: /bin/bash
      System Administrator User ID: 1002
      ID of User Group (sapsys): 79
      Restart system after machine reboot?: Yes
      Inter Service Communication Mode: ssl
   Software Components
      SAP HANA Database
         Install version 2.00.072.00.1690304772
         Location: /opt/hxe/installer/HANA_EXPRESS_20/DATA_UNITS/HDB_SERVER_LINUX_X86_64/server
      SAP HANA AFL (incl.PAL,BFL,OFL)
         Install version 2.00.072.0000.1690336155
         Location: /opt/hxe/installer/HANA_EXPRESS_20/DATA_UNITS/HDB_AFL_LINUX_X86_64/packages
      SAP HANA EPM-MDS
         Install version 2.00.072.0000.1690336155
         Location: /opt/hxe/installer/HANA_EXPRESS_20/DATA_UNITS/SAP_HANA_EPM-MDS_10/packages
      Automated Predictive Library
         Do not install
      SAP HANA XS Advanced Runtime
         Do not install
   Log File Locations
      Log directory: /var/tmp/hdb_HXE_hdblcm_install_2024-05-04_00.38.18
      Trace location: /var/tmp/hdblcm_2024-05-04_00.38.18_5600.trc

Note: Backup encryption will be enabled. You need to back up root keys after the installation.
Note: Volume encryption will be enabled. You need to back up root keys after the installation.
Installing components...
Installing SAP HANA Database...
  Preparing package 'Saphostagent Setup'...
  Preparing package 'Python Support'...
  Preparing package 'Python Runtime'...
  Preparing package 'Product Manifest'...
  Preparing package 'Binaries'...
  Preparing package 'Krb5 Runtime'...
  Preparing package 'Installer'...
  Preparing package 'Ini Files'...
  Preparing package 'Documentation'...
  Preparing package 'Delivery Units'...
  Preparing package 'Offline Cockpit'...
  Preparing package 'DAT Languages (EN, DE)'...
  Preparing package 'DAT Configfiles (EN, DE)'...
  Creating System...
  Extracting software...
  Installing package 'Saphostagent Setup'...
  Installing package 'Python Support'...
  Installing package 'Python Runtime'...
  Installing package 'Product Manifest'...
  Installing package 'Binaries'...
  Installing package 'Krb5 Runtime'...
  Installing package 'Installer'...
  Installing package 'Ini Files'...
  Installing package 'Documentation'...
  Installing package 'Delivery Units'...
  Installing package 'Offline Cockpit'...
  Installing package 'DAT Languages (EN, DE)'...
  Installing package 'DAT Configfiles (EN, DE)'...
  Creating instance...
Installing Resident hdblcm...
Installing SAP HANA AFL (incl.PAL,BFL,OFL)...
  Preparing package 'AFL'...
  Installing SAP Application Function Libraries to /hana/shared/HXE/exe/linuxx86_64/plugins/afl_2.00.072.0000.1690336155_3bcdaf6edac51bba771d05ba519b5f9918b3495d...
  Installing package 'AFL'...
  Activating plugin...
Installing SAP HANA EPM-MDS...
  Preparing package 'Enterprise Performance Management and Multidimensional Services'...
  Installing SAP HANA EPM-MDS to /hana/shared/HXE/exe/linuxx86_64/plugins/epmmds_2.00.072.0000.1690336155_3bcdaf6edac51bba771d05ba519b5f9918b3495d...
  Installing package 'Enterprise Performance Management and Multidimensional Services'...
  Activating plugin...
Configuring SAP HANA Database...
  Configuring System...
  Configuring instance...
  Installing SAP Host Agent version 7.22.59...
Starting instances...
  Starting 4 processes on host 'sles15-node01' (worker):
    Starting on 'sles15-node01' (worker): hdbdaemon, hdbcompileserver, hdbnameserver, hdbwebdispatcher
  Starting 5 processes on host 'sles15-node01' (worker):
    Starting on 'sles15-node01' (worker): hdbdaemon, hdbcompileserver, hdbnameserver, hdbwebdispatcher, hdbindexserver (HXE)








- additional_lang.tgz
- clients_linux_x86_64.tgz
- dpagent_linux_x86_64.tgz  hxe.tgz
- Getting_Started_HANAexpress_Binary_Installer.pdf
- apl.tgz                    
- clients_mac.tgz           
- dpagent_windows.zip       
- hxexsa.tgz
- clients_linux_ppc64le.tgz 
- clients_windows.zip
- eml.tgz
- sdi.tgz









~~~

# Uninstallation Step
~~~
* https://help.sap.com/docs/SAP_HANA_EXPRESS_EDITION/32c9e0c8afba4c87814e61d6a1141280/b999f7b6cd8e40638e3cfbaae70acc84.html?version=2.0.050
* https://docs.aws.amazon.com/ko_kr/sap/latest/sap-hana/uninstall-agent-s3.html
* https://sapdotbasis.wordpress.com/2019/09/09/start-and-stop-sap-hana/


$ ./hdblcm --uninstall --components=all


$ cd /usr/sap/hostctrl/exe

$ ./saphostexec -uninstall
Uninstall service
Stop service if running ...ok
Remove directory ...ok

Uninstall successful
Uninstall systemd service saphostagent.service ...ok
root@sles15-ha01:/usr/sap/hostctrl/exe# pwd
/usr/sap/hostctrl/exe


~~~
$ cd /hana/shared/HXE/hdblcm
$ ./hdblcm


SAP HANA Lifecycle Management - SAP HANA Express Edition 2.00.072.00.1690304772
*******************************************************************************



Choose an action

  Index | Action                    | Description
  -------------------------------------------------------------------------------------------------
  1     | check_installation        | Check SAP HANA Express Edition Installation
  2     | extract_components        | Extract Components
  3     | print_detected_components | Print Detected Components
  4     | rename_system             | Rename the SAP HANA Express Edition System
  5     | uninstall                 | Uninstall SAP HANA Express Edition Components
  6     | unregister_system         | Unregister the SAP HANA Express Edition System
  7     | update                    | Update the SAP HANA Express Edition System
  8     | update_components         | Install or Update Additional Components
  9     | update_host               | Update the SAP HANA Express Edition Instance Host integration
  10    | exit                      | Exit (do nothing)

Enter selected action index [10]: 5


Choose components to be uninstalled for system 'HXE':
  Index | Components | Description
  -----------------------------------------------------------------------------------------------
  1     | all        | SAP HANA Database version 2.00.072.00.1690304772 and all other components
  2     | afl        | Uninstall SAP HANA AFL (incl.PAL,BFL,OFL) version 2.00.072.0000.1690336155
  3     | epmmds     | Uninstall SAP HANA EPM-MDS version 2.00.072.0000.1690336155


Enter comma-separated list of the selected indices [1]: 1

Summary before execution:
=========================

SAP HANA Express Edition System Uninstallation
   Software Components
      SAP HANA AFL (incl.PAL,BFL,OFL)
         Uninstall version 2.00.072.0000.1690336155
      SAP HANA EPM-MDS
         Uninstall version 2.00.072.0000.1690336155
      SAP HANA Database
         Uninstall version 2.00.072.00.1690304772
   Log File Locations
      Log directory: /var/tmp/hdb_HXE_hdblcm_uninstall_2024-05-04_00.20.04
      Trace location: /var/tmp/hdblcm_2024-05-04_00.20.04_5252.trc

Note: All data volumes and all log volumes of SAP HANA Database 'HXE' will be removed!

Do you want to continue? (y/n): y

Uninstalling SAP HANA Express Edition System
  Uninstalling SAP HANA AFL (incl.PAL,BFL,OFL)...
    Uninstalling SAP Application Function Libraries...
    Uninstalling package AFL...
  Uninstalling SAP HANA EPM-MDS...
    Uninstalling SAP HANA EPM-MDS...
    Uninstalling package Enterprise Performance Management and Multidimensional Services...
  Uninstalling SAP HANA Database...
    Uninstalling SAP HANA Database...
    Removing SAP HANA Database instance...
      Stopping 5 processes on host 'sles15-node01' (worker):
        Stopping on 'sles15-node01' (worker): hdbdaemon, hdbcompileserver, hdbnameserver, hdbwebdispatcher, hdbindexserver (HXE)
      All server processes stopped on host 'sles15-node01' (worker).
    Stopping sapstartsrv service...
    Uninstalling package DAT Configfiles (EN, DE)...
    Uninstalling package DAT Languages (EN, DE)...
    Uninstalling package Offline Cockpit...
    Uninstalling package Delivery Units...
    Uninstalling package Documentation...
    Uninstalling package Ini Files...
    Uninstalling package Installer...
    Uninstalling package Krb5 Runtime...
    Uninstalling package Binaries...
    Uninstalling package Product Manifest...
    Uninstalling package Python Runtime...
    Uninstalling package Python Support...
    Uninstalling package Saphostagent Setup...
Uninstallation of the SAP HANA Express Edition System finished
Log file written to '/var/tmp/hdb_HXE_hdblcm_uninstall_2024-05-04_00.20.04/hdblcm.log' on host 'sles15-ha01'.
~~~

# Relevant Links
