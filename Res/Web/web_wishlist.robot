*** Settings ***

Resource        ${EXECDIR}/Res/Web/web_genericfunc.robot

*** Variables ***

${wishlisted_item}               //*[name()='svg' and @data-is-selected='true']
${wishlist_counter}              //span[@data-testid='wishlist-counter']
${wishlist_page_expected_title}  Meine Wunschliste | WestwingNow
${wishlist_delete_product}       //button[@class='blockListProduct__delete qaBlockListProduct__delete']

*** Keywords ***

the product should be added to the wishlist
    [Documentation]  = Usage =
    ...  This keyword adds the product to wishlist
    Wait Until Page Contains Element  ${wishlisted_item}
    ${wishlisted_item_count}=  Get Element Count  ${wishlisted_item}
    Should Be True  ${wishlisted_item_count}>0
    ${wishlist_counter_header_value}=  Get Text  ${wishlist_counter}
    Should Be True  ${wishlist_counter_header_value}==1  Wishlist counter in the website header should be 1

I go to the wishlist page ( "${wishlist_page}" )
    [Documentation]  = Usage =
    ...  This keyword redirects to wishlist page
    ...  Keyword takes 1 argument:
    ...  - wishlist_page (URL of wishlist page)
    ...  = Example =
    ...  I go to the wishlist page ( "https://www.westwingnow.de/customer/wishlist/index/" )
    Go To  ${wishlist_page}
    ${wishlist_page_actual_title}=  Get Title
    Should Be Equal As Strings  ${wishlist_page_actual_title}   ${wishlist_page_expected_title}  Wishlist page title does not match

I delete the product from my wishlist
    [Documentation]  = Usage =
    ...  This keyword removes the product from wishlist
    Wait Until Page Contains Element  ${wishlist_delete_product}
    ${before_remove_item_from_wishlist_icon_count}=  Get Element Count  ${wishlist_delete_product}
    Should Be True  ${before_remove_item_from_wishlist_icon_count}==1  Before removing item from wishlist, icon count should be 1
    Click Element  ${wishlist_delete_product}
    Wait Until Page Does Not Contain Element  ${wishlist_delete_product}
    ${after_remove_item_from_wishlist_icon_count}=  Get Element Count  ${wishlist_delete_product}
    Should Be True  ${after_remove_item_from_wishlist_icon_count}==0  After removing item from wishlist, icon count should be 1




