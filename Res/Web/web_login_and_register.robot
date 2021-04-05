*** Settings ***

Library         ${EXECDIR}/Lib/Web/BrowserHelper.py
Resource        ${EXECDIR}/Res/Web/web_genericfunc.robot

*** Variables ***

${login_and_register_dialog}  //div[@data-testid='login_and_register']
${email_field}                //input[@data-testid='long-register-email-field']
${password_field}             //input[@data-testid='long-register-password-field']
${registration_btn}           //button[@data-testid='login_reg_submit_btn']
${terms_accepted_checkbox}    //input[@name='isTermsAccepted']
${popup_backdrop}             //div[@data-testid='popup-backdrop']

*** Keywords ***

I should see the login/registration overlay
    [Documentation]  = Usage =
    ...  This keyword verifies login/registration dialog
    Wait Until Page Contains Element  ${login_and_register_dialog}

I log in with " ${email} " & " ${password} " credentials
    [Documentation]  = Usage =
    ...  This keyword is used for login
    ...  Keyword takes 2 arguments:
    ...  - email (email id of registered user)
    ...  - password (password)
    ...  = Example =
    ...  I log in with " useremail " & " password " credentials
    Wait Until Page Contains Element  ${email_field}
    Input Text  ${email_field}  ${email}
    Wait Until Page Contains Element  ${password_field}
    Input Text  ${password_field}  ${password}
    Wait Until Page Contains Element  ${terms_accepted_checkbox}
    Click Element  ${terms_accepted_checkbox}
    Wait Until Page Contains Element  ${registration_btn}
    Click Button  ${registration_btn}
    Wait Until Page Does Not Contain Element  ${registration_btn}

Remove login and register dialog
    [Documentation]  = Usage =
    ...  This keyword removes unwanted login/registration dialog
    Run Keyword And Ignore Error  Wait Until Page Contains Element  ${popup_backdrop}  10s
    ${popup_backdrop_count}=  Get Element Count  ${popup_backdrop}
    Run Keyword If  ${popup_backdrop_count}==1  Run Keywords  remove_dialog  ${popup_backdrop}
    ...  AND  Wait Until Page Does Not Contain Element  ${popup_backdrop}  5s


