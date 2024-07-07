*** Settings ***
Resource    ../resources/imports.robot

Test Setup    Open Test Application
Test Teardown    Close Application

*** Test Cases ***
Verify User Can Add New Task
    [Documentation]    Verify that a user can add a new task to the todo list.
    Input new task    Buy groceries
    Click add new task
    Verify Task Exists    Buy groceries

Verify User Can Mark Task As Completed
    [Documentation]    Verify that a user can mark a task as completed.
    Input new task    Buy groceries
    Click add new task
    Mark Task As Completed    0
    Verify Task Is Completed    0    Buy groceries

Verify User Can Delete Task
    [Documentation]    Verify that a user can delete a task from the todo list.
    Input new task    Buy groceries
    Click add new task
    Delete Task    Buy groceries
    Verify Task Does Not Exist    Buy groceries
