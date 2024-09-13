*** Settings ***
Library         AppiumLibrary   timeout=20   run_on_failure=Capture Page Screenshot
Resource        ../Dialpad.robot

*** Variables ***
${timer_id}                     //*[@resource-id="callTimer"]
${call_details_id}              //android.widget.TextView[@text="View Ai Recap"]
${transcription_text}           class=android.widget.TextView
${expected_text}                TWILIO contacted the credit card company to request the removal of a late fee charged to their account. They acknowledged missing the due date for their last payment and apologized for any inconvenience. TWILIO expressed their belief that the late fee was a one-time mistake and offered to immediately pay the minimum due amount to rectify the situation. They also offered to provide any additional information or documentation if required.
${contacts_tab}                 accessibility_id=Contacts
${contact_name_id}	            //android.widget.TextView[@resource-id="co.switchapp.beta:id/name" and @text="TWILIO CALLER"]

*** Keywords ***
Answer the Call
    Take Up the Call
    Wait For Element    ${timer_id}  30s

Take Up the Call
    tap id      ${accept_call_id}
