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
    Keywords.Open Random Book
    Keywords.Verify Book Page
    Keywords.Add To Wishlist
    Keywords.Verify Wishlish Pop Up
    Keywords.Create New Wishlist                                        Favorite
    Keywords.Verify Success Create Wishlish                             Favorite
    


    



