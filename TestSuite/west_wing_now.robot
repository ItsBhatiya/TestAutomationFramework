*** Settings ***

#Section to import libraries and other dependent modules

Resource        ${EXECDIR}/Res/Web/web_genericfunc.robot
Resource        ${EXECDIR}/Res/Web/web_homepage.robot
Resource        ${EXECDIR}/Res/Web/web_searched_product_page.robot
Resource        ${EXECDIR}/Res/Web/web_wishlist.robot

Suite Teardown  SUITE TEARDOWN

Test Teardown   Run Keyword If Test Failed  TEST TEARDOWN

*** Test Cases ***

TC: Create a test automation script covering a provided use case on Westwingnow.de
   [Tags]  TC
   [Documentation]  Test automation script covering a provided use case on Westwingnow.de
   Given I am on the WestwingNow home page ( "https://www.westwingnow.de" )
   When I search for "möbel"
   Then I should see product listing page with a list of products
   When I click on wishlist icon of the first found product
   Then I should see the login/registration overlay
   And I log in with " anil25bhatiya@gmail.com " & " Hibuddy@123 " credentials
   Then the product should be added to the wishlist
   And I go to the wishlist page ( "https://www.westwingnow.de/customer/wishlist/index/" )
   And I delete the product from my wishlist


