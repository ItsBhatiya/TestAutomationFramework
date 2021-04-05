*** Settings ***

Library         SeleniumLibrary
Library         String
Library         Collections
Variables       ${EXECDIR}/VariableFiles/Web/Config.py

*** Variables ***

${accept_cookies}  //button[@id='onetrust-accept-btn-handler']
${title}           Ihr Möbel & Interior Online-Shop | WestwingNow

*** Keywords ***

SUITE TEARDOWN
    Close Browser

I am on the WestwingNow home page ( "${site_url}" )
    [Documentation]  = Usage =
    ...  This keyword launches browser and open webpage of given URL
    ...  Keyword takes 1 argument:
    ...  - site_url (webpage URL)
    ...  = Example =
    ...  I am on the WestwingNow home page ( "https://www.westwingnow.de" )
    LAUNCH BROWSER
    Go To  ${site_url}
    ${site_title}=  Get Title
    Should Be Equal As Strings  ${site_title}   ${title}  Page title does not match
    Wait Until Page Contains Element  ${accept_cookies}
    Click Button  ${accept_cookies}

TEST TEARDOWN
    [Documentation]  = Usage =
    ...  This keyword closes the browser
    Close Browser

LAUNCH BROWSER
    [Documentation]  = Usage =
    ...  This keyword launches Google Chrome
    Run Keyword If      '${BROWSER_TYPE}' == 'CHROME'      OPEN CHROME BROWSER
    ...  ELSE  Fail  Run your test case on CHROME browser only

OPEN CHROME BROWSER
    ${options}=    Evaluate  sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method    ${options}    add_argument    --disable-infobars
    ${driver}=    Create Webdriver    Chrome    options=${options}    executable_path=${EXECDIR}/Webdriver/chromedriver.exe
    Maximize Browser Window