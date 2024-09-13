*** Settings ***
Library         AppiumLibrary   timeout=30   run_on_failure=Capture Page Screenshot
Resource        Dialpad.robot

*** Variables ***
&{dpbeta_app}               pkg=co.switchapp.${env}   activity=co.switchapp.activity.LaunchActivity
${ANDROID_AUTOMATION_NAME}  UIAutomator2



*** Keywords ***
Launch Application On Local Device
    [Arguments]  ${phone}  ${no_reset}=true  #Values for no_reset: true, false
    Start Appium Server  ${phone}
    Open Application  http://127.0.0.1:${phone.port}  alias=${phone.id}  deviceName=${phone.id}
         ...          platformName=${phone.platformName}  platformVersion=${phone.version}
         ...          appActivity=${dpbeta_app.activity}  appPackage=${dpbeta_app.pkg}  noReset=${no_reset}
         ...          newCommandTimeout=600  automationName=UiAutomator2      udid=${phone.udid}
         ...          unicodeKeyboard=true  resetKeyboard=true  chromedriverExecutable=${chromedriver}
#   Below capability is needed for Redmi device
#         ...          ignoreHiddenApiPolicyError=true


Launch Application On LambdaTest
    [Arguments]  ${phone}
    #Set Global Variable  ${appProfiling}  ${true}
    set lambdatest suite name
    Open Application  https://${lambdatest.user}:${lambdatest.key}@mobile-hub.lambdatest.com/wd/hub  alias=${phone.id}
         ...          deviceName=${phone.id}  idleTimeout=500  visual=true  devicelog=true  isRealMobile=true
         ...          platformName=Android    automationName=${ANDROID_AUTOMATION_NAME}
         ...          unicodeKeyboard=true  resetKeyboard=true  app=${lambdatest.app}  deviceOrientation=portrait
         ...          project=DP_Android  build=${LT_BUILD}  name=${SUITE NAME}  queueTimeout=500
         ...          console=true  region=US    network=false    #appProfiling=${appProfiling}

set lambdatest suite name
    ${name}    Run Keyword    Get Suite Name
    ${date}=  get_current_day_month_string
    ${LT_BUILD}=	Set Variable	${lambdatest.build}_${name}_${date}
    Set Suite Variable    ${LT_BUILD}

