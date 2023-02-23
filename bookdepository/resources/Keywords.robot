*** Settings ***
Resource                    Variables.robot
Resource                    Settings.robot
Resource                    Keywords.robot

*** Variable ***
${VALID_EMAIL}             wiratest@gmail.com
${VALID_PASSWORD}          iqbalwira
${NAVBAR_MENU}             .mob-nav-account
${ADD_TO_BASKET}           .add-to-basket
${BOOK_ITEM}               .book-item
${BOOK_PAGE}               .book-page
${PRODUCT_DETAILS}         .biblio-wrap

*** Keywords ***
Scroll To Element
    [Arguments]                         ${element}
    Wait Until Page Contains Element    ${element}                      timeout=3     error=There's no ${element}
    ${ver}=                             Get Vertical Position           ${element}
    Execute Javascript                  window.scrollTo(0,${ver}-90)
    Sleep                               1

Get Add To Basket Length
    ${addtobasket_length}                  Execute Javascript                                                                          return $('.add-to-basket').length
    [Return]                               ${addtobasket_length}

Get Book Length
    ${book_length}                         Execute Javascript                                                                          return $('.book-item').length
    [Return]                               ${book_length}


###################### OPEN BROWSER ##########################

Open Browser With Timeout
    [Timeout]                          120 Second
    Open Browser                       ${LANDING_URL}    ${BROWSER}
    Maximize Browser Window
    Sleep                              3

###################### OPEN MENU ##########################
Click Menu
    [Arguments]             ${menu}
    Click Element           sizzle=${NAVBAR_MENU}:contains(${menu})

###################### LOGIN ##########################

Login
    Select Frame            css=.signin-iframe
    Input Text              ap_email                    wiratest@gmail.com
    Input Text              ap_password                 iqbalwira
    Click Element           signInSubmit
    Sleep                   3
    
Verify Login Page
    Page Should Contain Element        sizzle=${NAVBAR_MENU}:contains(My Account)

###################### SEARCH BOOK ##########################

Search
    [Arguments]             ${keywords}
    Input Text              sizzle=.text-input          ${keywords}
    Click Element           sizzle=.header-search-btn

###################### SORTING PRICE ##########################

Sorting List Price Low To High
    Select From List By Value                  sizzle=.form-control.search-filter-dropdown-option         price_low_high
    Sleep                                      3
    Location Should Contain                    price_low_high

###################### Open Book ##########################

Open Random Book
    ${length}=                               Keywords.Get Book Length
    ${random}=                               Evaluate                                                                                    random.randint(1,${length-1})                                                                                           modules=random, sys
    Scroll to Element                        sizzle=${BOOK_ITEM}:nth(${random})  
    Click Element                            sizzle=${BOOK_ITEM}:nth(${random})
    Sleep                                    1

Verify Book Page
    Page Should Contain Element              sizzle=${BOOK_PAGE}
    Page Should Contain Element              sizzle=${PRODUCT_DETAILS}
    
###################### ADD TO BASKET ##########################

Click Random Book Add To Basket
    ${length}=                               Keywords.Get Add To Basket Length
    ${random}=                               Evaluate                                                                                    random.randint(1,${length-1})                                                                                           modules=random, sys
    Scroll to Element                        sizzle=${ADD_TO_BASKET}:nth(${random})  
    Wait Until Element Is Visible            sizzle=${ADD_TO_BASKET}:nth(${random})                                              timeout=30
    Click Element                            sizzle=${ADD_TO_BASKET}:nth(${random})
    Sleep                                    1
    Click Element                            sizzle=.continue-shopping
    Sleep                                    1
    
Click Add To Basket
    Click Element                            sizzle=${ADD_TO_BASKET}:nth(2)
    Sleep                                    1
    Click Element                            sizzle=.continue-shopping
    Sleep                                    1
    Click Element                            sizzle=${ADD_TO_BASKET}:nth(3)
    Sleep                                    1
    Click Element                            sizzle=.continue-shopping
    Sleep                                    1
    Click Element                            sizzle=${ADD_TO_BASKET}:nth(4)
    Sleep                                    1
    
Go To Basket Page
    Click Element                            sizzle=.continue-to-basket

Verify Basket Page
    Location Should Contain                  basket
    Page Should Contain                      Your basket

Replace Quantity
    Select From List By Value                Qty_0               1
    Select From List By Value                Qty_1               2
    Select From List By Value                Qty_2               3

###################### WISHLIST ##########################

Add To Wishlist
    Click Element                            sizzle=.add-to-wishlist
    Sleep                                    1

Verify Wishlish Pop Up
    Page Should Contain                      Add item to wishlist

Create New Wishlist
    [Arguments]                              ${wishlist}
    Input Text                               sizzle=.form-control:nth(1)                    ${wishlist}
    Click Element                            sizzle=.btn.btn-primary.pull-right
    Sleep                                    1
    
Verify Success Create Wishlish
    [Arguments]                              ${wishlist}
    Page Should Contain                      Item added to Favorite
    Click Element                            sizzle=.link-to-localize
    Location Should Contain                  wishlist
    Page Should Contain                      ${wishlist}