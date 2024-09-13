*** Settings ***
Library         AppiumLibrary   timeout=20   run_on_failure=Capture Page Screenshot
Library         Process
Library         ../ExternalKeywords/utils.py
Library         ../ExternalKeywords/twilio_functions.py
Resource        Dialpad.robot

*** Keywords ***
Start App
    [Arguments]  ${device}  ${no_reset}=true
    Print Message  Launching App on ${device.id}
    IF  '${setup}' == 'cloud_env'
        Launch Application On LambdaTest  ${device}
    ELSE
        Launch Application On Local Device  ${device}  ${no_reset}
    END

Begin 1 Mobile for Test
    [Documentation]   Its setup keyowrd which take phone argument. Default variables are taken from
    ...               properties file.
    [Arguments]   ${device}  ${user}
    Start App  ${device}
    #Check login state and perform login if not already  ${user}


#Check login state and perform login if not already
#    [Arguments]  ${user}
#    #Check for permission pop up and Accept
#    ${status}  Run Keyword And Return Status  Verify Element Is Present  ${makingcalls_id}
#    IF    ${status}
#        Dialpad.Login DP App  ${user}
#    ELSE
#        Print Message  Already logged in
#    END

Launch Android App
    [Arguments]  ${phone}
    Print Message  Re Launching application
    Terminate Application   ${dpbeta_app.pkg}
    Activate Application    ${dpbeta_app.pkg}




End Mobile Test
    Print Message   Closing all applications
    Run Keyword And Ignore Error  close all applications
    IF    not ('${runner}' == 'cloud_beta' or '${runner}' == 'cloud_stage')
        Stop Appium Server
    END

Start Appium Server
    [Arguments]  ${phone}
    Print Message   Starting Appium Server on port ${phone.port}
    Start Process   ${start_appium_cmd} ${phone.port}  shell=True  alias=appiumserver  stdout=${APPIUM_STDOUT}  stderr=${APPIUM_STDERR}
    Process Should Be Running  appiumserver
    sleep  5s

Stop Appium Server
    Print Message   Killing Appium server
    Start Process  ${kill_appium_cmd}  shell=True  stdout=${APPIUM_STDOUT}  stderr=${APPIUM_STDERR}



