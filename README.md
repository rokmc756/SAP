## How to download trial version of SAP Hana Express
* https://developers.sap.com/trials-downloads.html

## How to get SAP HANA Express Edition in OpenSUSE 15.x
First install x11 packaages and setting X11 Forarding in SSH to run installation program

1. Install X11 and Java Packages
~~~
$ zypper install xorg-x11-xauth
$ zypper install xorg-x11-server
$ zypper install java-*
~~~

2. Setting X11Forwaring in SSH
~~~
$ vi /etc/ssh/sshd_config
~~ snip
X11Forwarding yes
~~ snip

$ systemctl restart sshd
~~~

3. Login with X option from ssh client
~~~
$ ssh -X root@192.168.0.121
$ mkdir /root/Downloads
~~~

4. Download SAP Hana Express Binaries
~~~
$ cd ~/Downloads
$ chmod +x HXEDownloadManager_linux.bin                              # Execution permissions
$ ./HXEDownloadManager_linux.bin linuxx86_64 installer -d /opt/hxe/  # Assume that HXEDownloadManager_linux.bin is in this directory
- hxe.tgz
- hxexsa.tgz
- clients_linux_x86_64.tgz apl.tgz
- additional_lang.tgz
- clients_linux_x86_64.tgz
- dpagent_linux_x86_64.tgz
- Getting_Started_HANAexpress_Binary_Installer.pdf
- apl.tgz                    
- clients_mac.tgz           
- dpagent_windows.zip       
- clients_linux_ppc64le.tgz 
- clients_windows.zip
- eml.tgz
- sdi.tgz
~~~

## Installation Steps
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
~~~

## Uninstallation Step
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

## Install and Uninstall SAP Hana Express by Ansdible
1. Configure ansible inventory
~~~
$ vi ansible-hosts
[all:vars]
ssh_key_filename="id_rsa"
remote_machine_username="jomoon"
remote_machine_password="changeme"
ansible_python_interpreter=/usr/bin/python3

[master]
sles15-ha01 ansible_ssh_host=192.168.0.121

[slave]
sles15-ha02 ansible_ssh_host=192.168.0.122
~~~

2. Configure to install HXE and enable System Replication
~~~
$ vi install.yml
- hosts: all
  become: yes
  vars:
    print_debug: true
    deploy_hxe: true
    enable_replica: true
  roles:
    - { role: init-hosts }
    - { role: hxe }

$ make install
~~~

3 Configure to disable System Replication and uninstall HXE
~~~
$ vi uninstall.yml

- hosts: all
  become: yes
  vars:
    print_debug: true
    disable_replica: true
    destroy_hxe: true
  roles:
    - { role: hxe }
    - { role: init-hosts }

$ make uninstall
~~~


## Relevant Links
### Requirements
* https://help.sap.com/docs/SAP_HANA_EXPRESS_EDITION/32c9e0c8afba4c87814e61d6a1141280/c3807913b0a340a99822bf0d97a01da6.html

### PostgreSQL HA with pacemaker
* https://kb.techtaco.org/linux/postgresql/building_a_highly_available_multi-node_cluster_with_pacemaker_&_corosync/

### SAP HANA with pacemaker
* https://community.sap.com/t5/technology-blogs-by-members/automating-sap-hana-ha-configuration-with-ansible-and-red-hat-ha-add-on/ba-p/13459554
* https://docs.us.sios.com/spslinux/9.5.1/en/topic/install-sap-hana-and-configure-system-replication
* https://github.com/redhat-sap/sap-hana-hsr
* https://github.com/devgateway/ansible-role-pacemaker/tree/master
* https://github.com/mk-ansible-roles/saphana-deploy/
* https://support.huaweicloud.com/intl/en-us/bestpractice-sap/sap_11_0036.html
* https://thewindowsupdate.com/2021/10/01/sles15sp1-pacemaker-cluster-on-hli-for-sap-hana-2-0sp5-patch-52-based-on-fibre-channel/
* https://help.ovhcloud.com/csm/asia-sap-hana-configure-suse-cluster?id=kb_article_view&sysparm_article=KB0059452
* https://documentation.suse.com/sle-ha/15-SP4/html/SLE-HA-all/article-pacemaker-remote.html
* https://learn.microsoft.com/ko-kr/azure/sap/workloads/high-availability-guide-suse-pacemaker?tabs=msi

### XSA Admin
* https://ketchpartners.github.io/hanaexpress/binary-install-admin.html
* https://help.sap.com/docs/SAP_HANA_PLATFORM/6b94445c94ae495c83a19646e7c3fd56/6edf6e3cca6341e1adcc99febf07dcfb.html?version=2.0.00

### Best Practice
* https://documentation.suse.com/sbp/sap-15/html/SLES4SAP-hana-sr-guide-PerfOpt-15/index.html
* https://techcommunity.microsoft.com/t5/running-sap-applications-on-the/sles15sp1-pacemaker-cluster-on-hli-for-sap-hana-2-0sp5-patch-52/ba-p/2675162
