*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${BROWSER}                          chrome
${URL}                              https://www.amazon.com.br/
${MENU_ELETRONICOS}                 //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}               //h1[contains(.,'Eletrônicos e Tecnologia')]
${BUSCADOR}                         id:twotabsearchtextbox
${BOTAO_PESQUISA}                   id:nav-search-submit-button
                    
*** Keywords ***

Abrir o browser
        Open Browser                      browser=${BROWSER}  
        Maximize Browser Window

Acessar a homepage do site Amazon.com.br

        Go To                            url=${URL}
        

Fechar o browser
        Capture Page Screenshot
        Close All Browsers

Entrar no menu "Eletrônicos"
        Click Element                    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase '${TEXTO_HEADER_ELETRONICOS}'
        Wait Until Page Contains         text=${TEXTO_HEADER_ELETRONICOS} 
        Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}
Verificar se o título da página fica "${TITULO}"
          Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
        Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome do produto "${PRODUCT_NAME}" no campo de Pesquisa
        Input Text    locator=${BUSCADOR}    text=${PRODUCT_NAME}

Clicar no botão de Pesquisa
        Click Button    locator=${BOTAO_PESQUISA}
O site deve exibir a tela listando o produto "${PRODUCT}"
     Wait Until Element Is Visible    locator=(//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUCT}')])[1]
     

#GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
        Acessar a homepage do site Amazon.com.br
        Verificar se o título da página fica "Amazon.com.br | Compre livros, Kindle, Echo, Fire Tv e mais."
Quando acessar o menu "Eletrônicos"
        Entrar no menu "Eletrônicos"

 Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
         Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

 E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
         Verificar se aparece a frase 'Eletrônicos e Tecnologia'
 E a categoria "Computadores e Informática" deve ser exibida na página
         Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
        Digitar o nome do produto "Xbox Series S" no campo de Pesquisa
        Clicar no botão de Pesquisa
Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
        Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
 E um produto da linha "Xbox Series S" deve ser mostrado na página
         O site deve exibir a tela listando o produto "Xbox Series S"

Quando adicionar o produto "Console Xbox Series S" no carrinho
        Quando pesquisar pelo produto "Xbox Series S"
        Adicionar o produto "Console Xbox Series S" no carrinho
Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
        Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
 Quando remover o produto "Console Xbox Series S" do carrinho
        Remover o produto "Console Xbox Series S" do carrinho
     
Então o carrinho deve ficar vazio
        Verificar se o carrinho fica vazio



#EXERCÍCOS AMAZON
Adicionar o produto "Console Xbox Series S" no carrinho
        Click Element    locator=(//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Console Xbox Series S')])[1]
        Wait Until Page Contains Element    locator=add-to-cart-button
        Click Button    locator=//input[contains(@name,'submit.add-to-cart')]
        Wait Until Element Is Visible    locator=//input[contains(@aria-labelledby,'attachSiNoCoverage-announce')]
        Click Element    locator=//input[contains(@aria-labelledby,'attachSiNoCoverage-announce')]
Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
       Click Element    locator=nav-cart
       Click Element    locator=nav-cart
       Wait Until Page Contains    text=Console Xbox Series S
Remover o produto "Console Xbox Series S" do carrinho
        Click Element    locator=//input[contains(@value,'Excluir')]

Verificar se o carrinho fica vazio      
        Wait Until Page Contains    text=Seu carrinho de compras da Amazon está vazio.