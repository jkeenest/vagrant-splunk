#!/bin/bash
# needs work to automate and make more dynaic to allow different versions
#install scaleio pre-reqs
cd /tmp
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py
yum install numactl libaio python-httplib2 -y

#install ScaleIO SDC - must download and place the ScaleIO binaries in /vagrant/scaleio/
cd /vagrant/scaleio/ScaleIO_2.0.0_RHEL6_Download
MDM_IP=192.168.50.12,192.168.50.13 rpm -Uv EMC-ScaleIO-sdc-2.0-5014.0.el6.x86_64.rpm

#install splunk - must download splunk for linux installation files and place in /vagrant/splunk
cd /vagrant/splunk
tar xvzf splunk-6.3.3-f44afce176d0-Linux-x86_64.tgz -C /opt
sudo /opt/splunk/bin/splunk start --accept-license
