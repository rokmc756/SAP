
# adcli join --domain jtest.weka.io --service-name=cifs --computer-name osuse15-temp --host-fqdn jtest.weka.io -v --domain-ou ou=production,dc=jtest,dc=weka,dc=io -U jomoon
adcli join --domain jtest.weka.io --service-name=cifs --computer-name osuse15-temp --host-fqdn jtest.weka.io -v --domain-ou dc=jtest,dc=weka,dc=io -U Administrator

# mount -t cifs -o username=jomoon,password=Changeme12\!\@,domain=JTEST,vers=3.0,uid=1100,gid=1100 //192.168.1.241/smb-share-01 /mnt/smb/ --verbose

# ldapsearch -x -b "dc=jest,dc=weka,dc=io" -H ldap://192.168.0.100

