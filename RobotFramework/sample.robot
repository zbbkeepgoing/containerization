*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Baidu
    Open Headless Chrome    https://www.baidu.com   
    Wait Until Page Contains    baidu
    Close Browser

*** Keywords ***
Open Headless Chrome
    [Arguments]    ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${url}