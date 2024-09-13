## Mobile Automation with Robot Framework

This document provides a guide to mobile automation using Robot Framework and Appium.

**Why Robot Framework?**

* **Good support:** Large community and active development.
* **Well-maintained and open-source:** Free and reliable framework.
* **Many integrations:** Integrates with various testing tools and libraries.
* **Good documentation:** Extensive documentation and tutorials available.
* **Python extendable:** Easily extendable with Python libraries.
* **All-in-one test reporting:** Generates comprehensive reports automatically.

**Prerequisites:**

* **Appium (Latest version)**
* **JDK 1.8**
* **Android Studio with emulators**
* **Python 3** ([https://opensource.com/article/19/5/python-3-default-mac](https://opensource.com/article/19/5/python-3-default-mac))
* **PyCharm (for Robot Framework syntax)**

**Steps:**

1. **Install Robot Framework:**
   ```bash
   pip install robotframework-python3
   pip install allure-robotframework
   ```
2. **Install Appium client:**
   ```bash
   pip install robotframework-appiumlibrary
   ```
3. **Update Property file:** Modify the Appium property file with your environment details.
4. **Launch emulator or connect device:** Start your testing environment.
5. **Run Robot Framework for Beta:**
   ```bash
   robot -d <Report Folder> --name <Suite Name> -V lt_beta_var.py:<app verison>:'Pixel 6 Pro-12':'Galaxy S22 5G-12' -o <output xml filename > -i <tag> Android_Features/
   For Example:
   robot -d Report/rerun --name regression -V local_beta_var.py:9.21.0.4:'Pixel 6 Pro-12':'Galaxy S22 5G-12' -o dept -i NoNotification Android_Features/
   ```
6. **Run Robot Framework for Stage:**
   ```bash
   run: robot -d  ${{ env.OUTPUT_DIR }} --name stage -V lt_stage_var.py:${{ env.APP_VERSION }}:'${{ env.DEVICE_1 }}':'${{ env.DEVICE_2 }}' -o stage -i stageANDcloud Android_Features/
   For Example:
   robot -d Report/rerun --name regression -V local_stage_var.py:9.21.0.4:'Pixel 6 Pro-12':'Galaxy S22 5G-12' -o dept -i NoNotification Android_Features/
   ```
7. **Command Explanation**
   ```bash
   robot: Command to trigger tests.
   -d ${{ env.OUTPUT_DIR }}: Specifies the output directory for the test results.
   --name stage: Name of suite , Example stage,smoke,regression
   -V lt_stage_var.py:${{ env.APP_VERSION }}:'${{ env.DEVICE_1 }}':'${{ env.DEVICE_2 }}': Specifies a variable file (lt_stage_var.py) and passes values for variables related to the application version.
   -o stage: Specifies the output file for the test execution log.
   -i stageANDcloud: Specifies tags or test case names to include in the test execution.
   Android_Features/: Test Case Directry folder name
   ```
**Tips and Tricks:**

* Enable Debug mode for detailed logs:
   ```bash
   robot - L debug -d Report/rerun --name regression -V local_beta_var.py:9.21.0.4:'Pixel 6 Pro-12':'Galaxy S22 5G-12' -o dept -i NoNotification Android_Features/
   ```
* Utilize built-in Robot Framework variables ([https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)).


**Resources:**

* Robot Framework User Guide: [https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
* Appium Library: [https://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html#Launch%20Application](https://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html#Launch%20Application)
* Install Appium on Mac: [https://www.youtube.com/watch?v=7APcLr-cBM8](https://www.youtube.com/watch?v=7APcLr-cBM8)
* Appium Desired Capability: [https://github.com/appium/appium/blob/master/docs/en/writing-running-appium/caps.md](https://github.com/appium/appium/blob/master/docs/en/writing-running-appium/caps.md)
* Mobile Launching Strategies: [https://github.com/appium/appium/blob/master/docs/en/writing-running-appium/other/reset-strategies.md](https://github.com/appium/appium/blob/master/docs/en/writing-running-appium/other/reset-strategies.md)
* Appium Tutorial: [https://www.youtube.com/watch?v=mAylNVddfJc&list=PLhW3qG5bs-L8npSSZD6aWdYFQ96OEduhk](https://www.youtube.com/watch?v=mAylNVddfJc&list=PLhW3qG5bs-L8npSSZD6aWdYFQ96OEduhk)
* Robot Framework Tutorial: [https://www.youtube.com/watch?v=oY1JSpVk5ek&list=PLhW3qG5bs-L_yjwGfRkdySzVKCbV7ciaX](https://www.youtube.com/watch?v=oY1JSpVk5ek&list=PLhW3qG5bs-L_yjwGfRkdySzVKCbV7ciaX)
* Unable to Quit App: [[invalid URL removed]]([invalid URL removed])

**Additional Notes:**

* Customize the commands and configurations based on your specific needs and environment.
