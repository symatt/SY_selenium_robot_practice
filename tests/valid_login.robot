*** Settings ***
Documentation   A test suit with a single test for valid login
...
...             this test follows the example using keywords from
...             the SeleniumLibrary
Resource        resources.robot
Test Teardown   Close Browser

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Login Page Should Be Open 
    Input Username      ${VALID USER}
    Input Pass      ${VALID PASSWORD}
    Submit Credentials 
    Proper Product Page Should Be Open 
    
Locked Out Login
    Open Browser To Login Page
    Login Page Should Be Open 
    Input Username      ${LOCKED OUT USER}
    Input Pass      ${VALID PASSWORD}
    Submit Credentials 
    Error Message Shown    Epic sadface: Sorry, this user has been locked out.

Incorrect Password Login 
    Open Browser To Login Page
    Login Page Should Be Open 
    Input Username      ${VALID USER}
    Input Pass      ${INVALID PASSWORD}
    Submit Credentials 
    Error Message Shown    Epic sadface: Username and password do not match any user in this service

Problem Login
    Open Browser To Login Page
    Login Page Should Be Open 
    Input Username      ${PROBLEM USER}
    Input Pass      ${VALID PASSWORD}
    Submit Credentials 
    Problem Product Page Should Be Open 