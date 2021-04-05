*** Settings ***

Resource        ${EXECDIR}/Res/Web/web_login_and_register.robot
Resource        ${EXECDIR}/Res/Web/web_genericfunc.robot

*** Variables ***

${product_search_field}  //input[@data-testid='search-input']

*** Keywords ***

I search for "${product_name}"
    [Documentation]  = Usage =
    ...  This keyword searches for the given product
    ...  Keyword takes 1 argument:
    ...  - product_name (name of product)
    ...  = Example =
    ...  I search for "product"
	Wait Until Page Contains Element  ${product_search_field}
	Input Text  ${product_search_field}  ${product_name}
	Press Keys    ${product_search_field}    ENTER
	Remove login and register dialog

