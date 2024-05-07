nmcli connection delete conn0
nmcli connection delete conn1
nmcli connection delete conn2
nmcli connection delete conn3
nmcli connection delete conn4
nmcli connection delete conn5

# ens192: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
# ens193: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
# ens224: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
# ens225: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
# ens256: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
# ens257: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500

nmcli connection delete eth0
nmcli connection delete eth1
nmcli connection delete eth2
nmcli connection delete eth3
nmcli connection delete eth4
nmcli connection delete eth5

nmcli connection delete ens192
nmcli connection delete ens193
nmcli connection delete ens224
nmcli connection delete ens225
nmcli connection delete ens256
nmcli connection delete ens257

# Get DHCP
nmcli con add con-name conn0 type ethernet ifname eth0 ipv4.method auto
nmcli con add con-name conn1 type ethernet ifname eth1 ipv4.method auto
nmcli con add con-name conn2 type ethernet ifname eth2 ipv4.method auto
nmcli con add con-name conn3 type ethernet ifname eth3 ipv4.method auto
nmcli con add con-name conn4 type ethernet ifname eth4 ipv4.method auto
nmcli con add con-name conn5 type ethernet ifname eth5 ipv4.method auto

#ENDIP=$(hostname | cut -d 0 -f 2)
ENDIP=0

#
nmcli con modify conn0 ipv4.method manual ipv4.address 192.168.0.17$ENDIP/24
nmcli con modify conn1 ipv4.method manual ipv4.address 192.168.1.17$ENDIP/24
nmcli con modify conn2 ipv4.method manual ipv4.address 192.168.1.18$ENDIP/24
nmcli con modify conn3 ipv4.method manual ipv4.address 192.168.1.19$ENDIP/24
nmcli con modify conn4 ipv4.method manual ipv4.address 192.168.1.20$ENDIP/24
nmcli con modify conn5 ipv4.method manual ipv4.address 192.168.1.21$ENDIP/24

nmcli con modify conn0 ipv4.gateway 192.168.0.1
nmcli con modify conn1 ipv4.gateway 192.168.1.1
nmcli con modify conn2 ipv4.gateway 192.168.1.1
nmcli con modify conn3 ipv4.gateway 192.168.1.1
nmcli con modify conn4 ipv4.gateway 192.168.1.1
nmcli con modify conn5 ipv4.gateway 192.168.1.1

nmcli connection modify conn0 802-3-ethernet.mtu 1500
nmcli connection modify conn1 802-3-ethernet.mtu 9000
nmcli connection modify conn2 802-3-ethernet.mtu 9000
nmcli connection modify conn3 802-3-ethernet.mtu 9000
nmcli connection modify conn4 802-3-ethernet.mtu 9000
nmcli connection modify conn5 802-3-ethernet.mtu 9000

# Need reboot to apply or check if restaring NM is possible

#
nmcli connection modify conn0 ipv4.dns 192.168.0.100,192.168.0.90,8.8.8.8,168.126.63.1 ipv4.dns-search jtest.weka.io
nmcli connection modify conn1 ipv4.dns 192.168.0.100,192.168.0.90,8.8.8.8,168.126.63.1 ipv4.dns-search jtest.weka.io
nmcli connection modify conn2 ipv4.dns 192.168.0.100,192.168.0.90,8.8.8.8,168.126.63.1 ipv4.dns-search jtest.weka.io
nmcli connection modify conn3 ipv4.dns 192.168.0.100,192.168.0.90,8.8.8.8,168.126.63.1 ipv4.dns-search jtest.weka.io
nmcli connection modify conn4 ipv4.dns 192.168.0.100,192.168.0.90,8.8.8.8,168.126.63.1 ipv4.dns-search jtest.weka.io
nmcli connection modify conn5 ipv4.dns 192.168.0.100,192.168.0.90,8.8.8.8,168.126.63.1 ipv4.dns-search jtest.weka.io

#
# nmcli connection modify conn1 ipv4.routes "192.168.0.0/24 table=100" +ipv4.routes "0.0.0.0/0 192.168.0.18$ENDIP table=100" ipv4.routing-rules "priority 101 from 192.168.0.1 table 100"
# nmcli connection modify conn2 ipv4.routes "192.168.1.0/24 table=100" +ipv4.routes "0.0.0.0/0 192.168.1.15$ENDIP table=100" ipv4.routing-rules "priority 101 from 192.168.1.1 table 100"
# nmcli connection modify conn3 ipv4.routes "192.168.1.0/24 table=200" +ipv4.routes "0.0.0.0/0 192.168.1.20$ENDPI table=200" ipv4.routing-rules "priority 102 from 192.168.1.1 table 200"

nmcli connection modify conn0 ipv4.routes "192.168.0.0/24 table=100" ipv4.routing-rules "priority 100 from 192.168.0.17$ENDIP table 100"
nmcli connection modify conn1 ipv4.routes "192.168.1.0/24 table=200" ipv4.routing-rules "priority 101 from 192.168.1.17$ENDIP table 200"
nmcli connection modify conn2 ipv4.routes "192.168.1.0/24 table=200" ipv4.routing-rules "priority 102 from 192.168.1.18$ENDIP table 200"
nmcli connection modify conn3 ipv4.routes "192.168.1.0/24 table=200" ipv4.routing-rules "priority 103 from 192.168.1.19$ENDIP table 200"
nmcli connection modify conn4 ipv4.routes "192.168.1.0/24 table=200" ipv4.routing-rules "priority 104 from 192.168.1.20$ENDIP table 200"
nmcli connection modify conn5 ipv4.routes "192.168.1.0/24 table=200" ipv4.routing-rules "priority 105 from 192.168.1.21$ENDIP table 200"

nmcli connection modify conn0 ipv6.method "disabled"
nmcli connection modify conn1 ipv6.method "disabled"
nmcli connection modify conn2 ipv6.method "disabled"
nmcli connection modify conn3 ipv6.method "disabled"
nmcli connection modify conn4 ipv6.method "disabled"
nmcli connection modify conn5 ipv6.method "disabled"

# nmcli con mod conn0 ipv4.never-default yes
nmcli con mod conn1 ipv4.never-default yes
nmcli con mod conn2 ipv4.never-default yes
nmcli con mod conn3 ipv4.never-default yes
nmcli con mod conn4 ipv4.never-default yes
nmcli con mod conn5 ipv4.never-default yes

#
nmcli con up conn0
nmcli con up conn1
nmcli con up conn2
nmcli con up conn3
nmcli con up conn4
nmcli con up conn5

