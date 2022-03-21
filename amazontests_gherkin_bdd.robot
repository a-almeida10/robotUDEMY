*** Settings ***
Documentation            Testar uma categoria e buscar um produto no site da Amazon.com.br
Resource                 amazon_resources.robot
Test Setup               Abrir o browser
Test Teardown            Fechar o browser
*** Test Cases ***

Caso 01 - Acesso ao menu Eletrônicos
    [Documentation]      Verificar o menu Eletrônicos no site da Amazon.com.br
    [Tags]               menu    categorias
         Dado que estou na home page da Amazon.com.br
         Quando acessar o menu "Eletrônicos"
         Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
         E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
         E a categoria "Computadores e Informática" deve ser exibida na página

Caso 02 - Pesquisa de um produto

    [Documentation]        Pesquisa de produto
    [Tags]                 busca_produto

        Dado que estou na home page da Amazon.com.br
        Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
        E um produto da linha "Xbox Series S" deve ser mostrado na página
Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Console Xbox Series S" deve ser mostrado no carrinho 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Console Xbox Series S" deve ser mostrado no carrinho 
    Quando remover o produto "Console Xbox Series S" do carrinho
    Então o carrinho deve ficar vazio