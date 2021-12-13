*** Settings ***
Documentation   A resource file with reusable keywords and variables
...
...             Creating system specific keywords from default keywords from
...             the SeleniumLibrary
Library         SeleniumLibrary

*** Variable ***
${SERVER}               www.saucedemo.com
${BROWSER}              edge
${VALID USER}           standard_user
${LOCKED OUT USER}      locked_out_user
${PROBLEM USER}         problem_user
${VALID PASSWORD}       secret_sauce
${INVALID PASSWORD}     invalid_password
${PROBLEM IMG}          /static/media/sl-404.168b1cce.jpg
${LOGIN URL}            https://${SERVER}/
${HOME URL}             https://${SERVER}/inventory.html
${NAME A TO Z}          az
${NAME Z TO A}          za
${PRICE LOW TO HIGH}    lohi
${PRICE HIGH TO LOW}    hilo

*** Keywords ***
Open Browser To Login Page
    # open browser
    Open Browser    ${LOGIN URL}    ${BROWSER}
    # set window size
    Maximize Browser Window
    # check if in login page
    Page Should Contain Element    login-button

Login Page Should Be Open 
    # check if in login page
    Page Should Contain Element    login-button

Proper Product Page Should Be Open 
    # should be open in products page
    # Element Text Should be    class:title    PRODUCTS
    # should not contain the problem image
    Page Should Not Contain Image    ${PROBLEM IMG}

Problem Product Page Should Be Open 
    # should be open in products page
    # Element Text Should be    class:title    PRODUCTS
    # should not contain the problem image
    Page Should Contain Image    ${PROBLEM IMG}

Input Username 
    [Arguments]     ${username}
    Input Text    user-name    ${username}

Input Pass
    [Arguments]     ${password}
    Input Password    password    ${password}

Submit Credentials 
    # click login button
    Click Button    login-button

Error Message Shown 
    [Arguments]     ${error}
    Element Text Should Be      css:*[data-test="error"]      ${error}

Valid Login User 
    # login to a valid user
    Open Browser To Login Page
    Login Page Should Be Open 
    Input Username      ${VALID USER}
    Input Pass      ${VALID PASSWORD}
    Submit Credentials 

Sort Items By
    [Arguments]     ${sorting}
    Select From List By Value     css:*[data-test="product_sort_container"]    ${sorting}

Items Should Be Sorted By
    [Arguments]    ${sortedby}
    Element Text Should Be  class:active_option    ${sortedby}


