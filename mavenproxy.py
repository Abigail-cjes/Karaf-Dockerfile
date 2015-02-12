#!/usr/bin/python3

# script to set proxies for maven

import myconfig
import xml.etree.ElementTree as ET
mvnNS="http://maven.apache.org/SETTINGS/1.0.0"
ET.register_namespace("", mvnNS)
ET.register_namespace("xsi", "http://www.w3.org/2001/XMLSchema-instance")
filename='/etc/maven/settings.xml'
tree = ET.parse(filename)
root = tree.getroot()
a = root.find("{"+mvnNS+"}proxies")
b = ET.SubElement(a, 'proxy')
c = ET.SubElement(b, 'active')
c.text='true'
d = ET.SubElement(b, 'protocol')
d.text='http'
e = ET.SubElement(b, 'host')
e.text=myconfig.proxy
f = ET.SubElement(b, 'port')
f.text='80'
tree.write(filename)
