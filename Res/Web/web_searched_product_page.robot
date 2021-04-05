*** Settings ***

Resource        ${EXECDIR}/Res/Web/web_genericfunc.robot

*** Variables ***

${wishlist_icon}          //div[@data-testid='wishlist-icon']
${no_result_for_product}  //div[contains(text(),'0 Ergebnisse für')]

*** Keywords ***

I should see product listing page with a list of products
    [Documentation]  = Usage =
    ...  This keyword verifies searched product listing
    Wait Until Page Does Not Contain Element  ${no_result_for_product}  None  Searched item not found

I click on wishlist icon of the first found product
    [Documentation]  = Usage =
    ...  This keyword clicks on wishlist icon of first found product
    ${item_count}  Get Element Count  ${wishlist_icon}
    Should Be True  ${item_count}>0
    Click Element  xpath=(${wishlist_icon})[1]



