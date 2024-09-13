*** Settings ***
Library         AppiumLibrary   timeout=20   run_on_failure=Capture Page Screenshot
Library         String
Library         ../ExternalKeywords/twilio_functions.py
Resource        ../Properties/${runner}.robot
Resource        ../Properties/Environments/${setup}.robot
Resource        Pages/CallScreen.robot
Resource        Pages/CallNotifScreen.robot
Resource        Common.robot
Resource        UIAction.robot
Resource        utils.robot
Resource        app_launcher.robot

*** Keywords ***
Accept Call
    [Arguments]     ${caller}    ${isDept}=false   ${dept_name}=None  ${lock_screen}=${false}
    [Documentation]    This keyword takes caller name and Default flag as false. So if this keyword is called without
    ...                flag, it will verify call screen otherwise department call screen.
    Check Notifications
    Wait For Element  ${incomingcall}  40s
    CallNotifScreen.Verify Call Notification Screen    ${caller}
    CallScreen.Answer the Call

Check Notifications
    UIAction.Open System Notification


