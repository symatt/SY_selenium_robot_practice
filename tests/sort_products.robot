*** Settings ***
Documentation   A test suite for sorting of products
...
...             this test follows the example using keywords from
...             the SeleniumLibrary
Resource        resources.robot
Test Teardown   Close Browser

*** Test Cases ***
Sorted Name A to Z 
    Valid Login User 
    Sort Items By    ${NAME A TO Z} 

Sorted Name Z To A
    Valid Login User 
    Sort Items By    ${NAME Z TO A}

Sorted Price Low to High
    Valid Login User 
    Sort Items By    ${PRICE LOW TO HIGH} 

Sorted Price High to Low
    Valid Login User 
    Sort Items By    ${PRICE HIGH TO LOW} 