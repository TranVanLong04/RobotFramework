*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USERNAME}    Admin
${PASSWORD}    admin123
${USERNAMEEMPTY}
${USERNAMEFAIL}    admin
${PASSWORDFAIL}    admin1234

*** Test Cases ***
Đăng Nhập Thành Công
    [Documentation]    Kiểm tra đăng nhập hợp lệ
    Open Browser    ${URL}    chrome
    #Đợi 10s cho Web load xong
    Wait Until Element Is Visible    xpath=//input[@placeholder='Username']    10s
    Input Text    xpath=//input[@name='username']    ${USERNAME}
    Input Text    xpath=//input[@name='password']    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Sleep    2s
    Close Browser

Đăng Nhập Thất Bại
    [Documentation]    Kiểm tra đăng nhập thất bại
    Open Browser    ${URL}    chrome
    #Đợi 10s cho Web load xong
    Wait Until Element Is Visible    xpath=//input[@placeholder='Username']    10s
    Input Text    xpath=//input[@name='username']    ${USERNAMEFAIL}
    Input Text    xpath=//input[@name='password']    ${PASSWORDFAIL}
    Click Button    xpath=//button[@type='submit']
    Sleep    2s
    Close Browser

Đăng Nhập Thất Bại Do Username Rỗng
    [Documentation]    Kiểm tra đăng nhập thất bại do Username bị rỗng
    Open Browser    ${URL}    chrome
    #Đợi 10s cho Web load xong
    Wait Until Element Is Visible    xpath=//input[@placeholder='Username']    10s
    Input Text    xpath=//input[@name='username']    ${USERNAMEEMPTY}
    Input Text    xpath=//input[@name='password']    ${PASSWORD}
    Click Button    xpath=//button[@type='submit']
    Sleep    2s
    Close Browser