# SkinX_Todo_Llist

Install before run test
1. Install todo list application on Android emulator
2. Install Appium Server
3. Download and install Appium Desktop from https://github.com/appium/appium-desktop/releases
4. Install Robot Framework and Appium Library

Run Android emulator
1. Run command “emulator -list-avds” for check the Android emulator name on your laptop
2. Run emulator with command “emulator -avd NameOfAvd” (eg. emulator -avd Pixel_8_API_34)

Run test script
1. Open Android emulator
2. Start Appium Server
3. Open file keyworks/todo_list_keyword.robot and edit the value under Open Test Application keyword to match with your Android emulator
4. Run test file in testcases/testcases.robot with command “robot testcases.robot”