#! usr/bin/python3

# script to set proxies for base machine


import myconfig
x = open("/etc/apt/apt.conf.d/01proxy", "w")
x.write('Acquire::http::proxy \"http://'+myconfig.proxy+':80/\";\nAcquire::https::proxy \"http://'+myconfig.proxy+':80/\";');
x.close()


