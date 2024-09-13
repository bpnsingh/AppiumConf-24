*** Settings ***
Library         AppiumLibrary   timeout=20   run_on_failure=Capture Page Screenshot
Resource        ../Dialpad.robot

*** Variables ***
${incomingcall}                //android.widget.TextView[@resource-id="android:id/text" and @text="Incoming call"]
${incomingcall_id}             //android.view.View[@resource-id="incomingCallScreen"]
${accept_call_id}              //android.view.View[@resource-id="acceptButton"]
${message_icon}                //android.view.View[@resource-id="replyButton"]
${reject}                      //android.view.View[@resource-id="rejectButton"]
${image}                       //android.view.View[@resource-id="contactAvatar"]
${caller_name_id}              //android.view.View[@resource-id="contactName"]
${call_notification_pil}       TO: FINANCE
${call_screen_tag}             FINANCE
${conv_screen_tag}             FINANCE

*** Keywords ***
Verify Call Notification Screen
    [Arguments]          ${name}
    Wait For Element         ${incomingcall_id}     40s
    Wait For Text            ${name}        35s
    Wait For Element        ${message_icon}
    Wait For Element        ${reject}
    Wait For Element         ${image}
