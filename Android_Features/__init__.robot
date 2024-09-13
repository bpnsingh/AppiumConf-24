*** Settings ***
Library         AppiumLibrary   timeout=20   run_on_failure=Capture Page Screenshot
Resource        ../Resources/Dialpad.robot

#Suite Setup     Run Keyword If  '${setup}' == 'cloud_env'
#...             Common.Set Cloud Devices  ${lt_device1}  ${lt_device2}
#...    ELSE     Common.Reset Local Devices  ${phone1}  ${phone2}