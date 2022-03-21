*** Settings ***
Documentation            Testar uma categoria e buscar um produto no site da Amazon.com.br
Resource                 amazon_resources.robot
Test Setup               Abrir o browser
Test Teardown            Fechar o browser
*** Test Cases ***

Caso 01 - Acesso ao menu Eletrônicos
    [Documentation]      Verificar o menu Eletrônicos no site da Amazon.com.br
    [Tags]               menu    categorias
            Acessar a homepage do site Amazon.com.br
            Verificar se o título da página fica "Amazon.com.br | Compre livros, Kindle, Echo, Fire Tv e mais."
            Entrar no menu "Eletrônicos"
            Verificar se aparece a frase 'Eletrônicos e Tecnologia'
            Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
            Verificar se aparece a categoria "Computadores e Informática"
            Verificar se aparece a categoria "Tablets"

Caso 02 - Pesquisa de um produto

    [Documentation]        Pesquisa de produto
    [Tags]                 busca_produto

        Acessar a homepage do site Amazon.com.br
        Digitar o nome do produto "Xbox Series S" no campo de Pesquisa
        Clicar no botão de Pesquisa
        O site deve exibir a tela listando o produto "Console Xbox Series S"
 Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome do produto "Xbox Series S" no campo de Pesquisa
    Clicar no botão de pesquisa
    O site deve exibir a tela listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome do produto "Xbox Series S" no campo de Pesquisa
    Clicar no botão de pesquisa
    O site deve exibir a tela listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Remover o produto "Console Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio      