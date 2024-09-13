*** Settings ***
Documentation   Misc Keyword for the Project
Library         AppiumLibrary   timeout=20   run_on_failure=Capture Page Screenshot
Library         String
Library         ../ExternalKeywords/utils.py
Resource        Dialpad.robot
Library         OperatingSystem
Library         Collections

*** Keywords ***
Verify text is Present
    [Arguments]     ${text}
    Print Message   Verify ${text} is Present
    Page Should Contain text    ${text}

Wait For Element
    [Arguments]     ${locator}    ${timeout}=20s
    Print Message   Waiting for ${locator} to get visible witin ${timeout}
    Wait Until Page Contains Element    ${locator}  ${timeout}

Wait Until Element Is Not Visible
    [Arguments]     ${locator}    ${timeout}=20s
    Print Message   Waiting for ${locator} to get invisible witin ${timeout}
    Wait Until Page Does Not Contain Element  ${locator}  ${timeout}

Wait For Text
    [Arguments]     ${locator}  ${timeout}=20s
    Print Message   Waiting for ${locator} to get visible witin ${timeout}
    Wait Until Page Contains    ${locator}  ${timeout}


Print Message
    [Arguments]   ${msg}
    Run Keyword If    "${log_level}" == "DEBUG"    compose message with timestamp   ${msg}

compose message with timestamp
    [Arguments]   ${msg}
    ${time}=  get_current_time
    log to console   ${\n}${time}***** ${msg} *****

wait
    [Arguments]    ${time}   ${message}=sleeping for
    Print Message  ${message} ${time}s
    sleep          ${time}s

Verify Element Contain Text
    [Arguments]  ${locator}  ${text}
    element should contain text  ${locator}  ${text}
    Print Message  '${text}' is present in ${locator}

Verify Element Does Not Contain Text
    [Arguments]  ${locator}  ${text}
    element should not contain text  ${locator}  ${text}
    Print Message  ${text} is not present in ${locator}

get webelemt lists
    [Arguments]    ${locator}
    @{ele}=   Get Webelements   ${locator}
    Print Message  collecting elements with ${locator} and got @{ele}
    [Return]   @{ele}

compare texts
    [Arguments]    ${text1}   ${text2}
    Print Message   comparing ${text1} against ${text2}
    Should Be Equal   ${text1}   ${text2}


Get Suite Name
    ${suite_name}    Get Variable Value    ${SUITE NAME}
    ${split_name}    Split String    ${suite_name}    .
    ${result}        Set Variable    ${split_name}[1]
    [Return]         ${result}

Get First Name
    [Arguments]    ${fullName}
    ${first_name}    Set Variable    ${fullName.split()[0]}
    [Return]    ${first_name}

