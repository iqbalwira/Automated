############# MANDATORY INCLUDES #############
*** Settings ***
Test Setup       Open Browser With Timeout
Test Teardown    Close Browser
Resource         ../resources/Keywords.robot

*** Test Case ***
Search And Sorting
    [Documentation]                                                     As user, I want to search and sorting price low to high
    Keywords.Click Menu                                                 Sign in/Join
    Keywords.Login
    Keywords.Verify Login Page
    Keywords.Search                                                     Brain
    Keywords.Sorting List Price Low To High
    



