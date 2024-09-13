*** Settings ***
Force Tags      demo
Library         AppiumLibrary   timeout=20   run_on_failure=Capture Page Screenshot
Resource        ../Resources/Dialpad.robot

Suite Setup     Common.Begin 1 Mobile for Test  ${phone1}  ${user1}
Suite Teardown  Common.End Mobile Test

*** Variables ***
${demo_text}                <Response><Pause length="10"/><Say>I am calling regarding a late fee that was charged to my credit card account. I understand that I missed the due date for my last payment, and I apologize for any inconvenience this may have caused. However, I would like to request that the late fee be removed from my account. I have been a loyal customer of [credit card company] for [length of time], and I have always made my payments on time in the past. I believe this was a one-time mistake, and I would appreciate your help in rectifying the situation. I would be happy to make the payment for the minimum due amount immediately, and I hope you can understand my situation. If there is any additional information or documentation that you require, please let me know and I will be happy to provide it.Thank you for your time and attention to this matter. I hope that we can work together to find a solution that works for both of us.</Say><Pause length="3"/></Response>



*** Test Cases ***
TC_032_Transcription_Test
    [Tags]   Transcription
#    ${call_sid}   create_twilio_call  ${user1.did}  ${TWILIO.did}    ${demo_text}
#    Dialpad.Accept Call      ${TWILIO.did}
#    wait                    90
    relaunch device and open summary        ${phone1}
    validate transcription

*** Keywords ***
select last call details
    @{ele}=   utils.get webelemt lists   ${call_details_id}
    click element       ${ele}[-1]

get transcription text
    @{ele}=   utils.get webelemt lists   ${transcription_text}
    ${text}	 Get Text	${ele}[4]
    [return]     ${text}

relaunch device and open summary
    [Arguments]             ${phone}
    Launch Android App      ${phone}
    tap id                  ${contacts_tab}
    tap id                  ${contact_name_id}
    Wait For Element        ${call_details_id}
    select last call details

validate transcription
    Wait For Element        ${transcription_text}
    wait                    3
    ${actual_text}      get transcription text
    #compare texts       ${actual_text}    ${expected_text}
    wait                    3
    ${res} =  compare_strings  ${actual_text}  ${expected_text}
    Log       ${res}   console=True
    Should Be True     ${res}>=80