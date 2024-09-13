*** Variables ***
#Devices
&{phone1}                      id=SMSNG_F62  udid=RZ8R30WHM1B   systemPort=8200   version=13    port=4723  platformName=android
...                            sim=+14155703797   sim_name=PIXEL SIM   type=phone
&{phone2}                      id=SMSNG_A20  udid=RZ8M6120X5J   systemPort=8201   version=11    port=4724  platformName=android
...                            sim=4084806125   sim_name=PIXEL SIM   type=phone
#&{phone1}                      id=SHARP  udid=SX3LHMA362303121   systemPort=8201   version=13    port=4724  platformName=android
#...                            sim=4084806125   sim_name=PIXEL SIM   type=phone
${PROJECT_DIR}                 ${EXECDIR}
${APPIUM_STDOUT}               ${PROJECT_DIR}/Report/appium_stdout.txt
${APPIUM_STDERR}               ${PROJECT_DIR}/Report/appium_stderr.txt
${kill_appium_cmd}              ps -aef|grep appium|grep -v grep|awk '{print $2}'|xargs kill -9
${start_appium_cmd}             /usr/local/bin/appium -p
${chromedriver}                 ${PROJECT_DIR}/Resources/chromedriver