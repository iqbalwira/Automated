############# MANDATORY INCLUDES #############
*** Settings ***
Test Setup       Open Browser With Timeout
Test Teardown    Close Browser
Resource         ../resources/Keywords.robot

*** Test Case ***
Search And Add To Basket
    [Documentation]                                                     As user, I want to search and add book to basket
    Keywords.Click Menu                                                 Sign in/Join
    Keywords.Login
    Keywords.Verify Login Page
    Keywords.Search                                                     Brain
    Keywords.Click Random Book Add To Basket
    Keywords.Click Add To Basket
    Keywords.Go To Basket Page
    Keywords.Verify Basket Page
    Keywords.Replace Quantity

    



