*** Settings ***
Documentation   This file includes all  UI Action for this project
Library         AppiumLibrary   timeout=20   run_on_failure=Capture Page Screenshot
Library         ../ExternalKeywords/utils.py
Resource        Dialpad.robot



*** Keywords ***
tap id
    [Arguments]  ${id}  ${wait}=20s
    wait until page contains element  ${id}  ${wait}
    Print Message   tapping on ${id}
    CLICK ELEMENT  ${id}
    sleep  1s


tap text
    [Arguments]  ${text}    ${wait}=20s
    wait until page contains  ${text}   ${wait}
    Print Message   tapping on ${text}
    click text  ${text}
    sleep  1s

Swipe Down
    swipe by percent  50   80   50   20

Swipe Up
    swipe by percent  50   30   50   70

Swipe Right
    swipe by percent  90  50  10  50




open system notification
    ${appium}=  Get Library Instance    AppiumLibrary
    Evaluate    $appium._current_application().open_notifications()
    wait      2
