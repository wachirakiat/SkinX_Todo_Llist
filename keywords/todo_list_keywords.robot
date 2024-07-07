*** Settings ***
Resource    ../resources/imports.robot

*** Variables ***
${todo_list.title}    android=new UiSelector().description("Todo List")
${todo_list.txt_edit}    android=new UiSelector().className("android.widget.EditText")
${todo_list.btn_add}    android=new UiSelector().className("android.widget.Button")  
${todo_list.checkBox_0}    android=new UiSelector().className("android.widget.CheckBox").instance(0)
${todo_list.btn_delete_0}    android=new UiSelector().className("android.widget.Button").instance(0)


*** Keywords ***
Open Test Application
    Open Application    remote_url=http://localhost:4723/wd/hub
    ...    deviceName=Pixel_8_API_34
    ...    platformVersion=14
    ...    platformName=Android      
    ...    appPackage=app.skinx.test.todo_list_app
    ...    appActivity=app.skinx.test.todo_list_app.MainActivity

Input new task
    [Arguments]    ${task_name}
    Wait Until Element Is Visible    ${todo_list.txt_edit}
    Click Element    ${todo_list.txt_edit}
    Input Text    ${todo_list.txt_edit}    ${task_name}

Click add new task
    Click Element    ${todo_list.btn_add}

Verify Task Exists
    [Arguments]    ${task_name}
    Page Should Contain Text    ${task_name}

Mark Task As Completed
    [Arguments]    ${checkbox_index}
    Click Element    ${todo_list.checkBox_${checkbox_index}} 

Verify Task Is Completed
    [Arguments]    ${checkbox_index}    ${task_name}
    ${checkbox}    Get Element Attribute    ${todo_list.checkBox_${checkbox_index}}     checked
    Should Be Equal As Strings    ${checkbox}    true
    
Delete Task
    [Arguments]    ${task_name}
    Click Element    xpath=//android.view.View[@content-desc="${task_name}"]/android.widget.Button

Verify Task Does Not Exist
    [Arguments]    ${task_name}
    Page Should Not Contain Element    xpath=//android.view.View[@content-desc="${task_name}"]