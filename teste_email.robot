*** Settings ***
Library    String
Documentation    Essa suíte testa a criação de um email ao receber o nome e sobrenome
*** Variables ***
&{NOME_SOBRENOME}        nome=capitu    sobrenome=dasilva
*** Test Cases ***
Teste 01- Criar um e-mail        
    [Documentation]       Esses teste recebe dois parâmetros e cria um e-mail
    [Tags]                email    nome_sobrenome
    Criar um email


*** Keywords ***
Criar um email
    ${MENSAGEM}    Novo email    ${NOME_SOBRENOME.nome}    ${NOME_SOBRENOME.sobrenome}
    Log   Olá, ${NOME_SOBRENOME.nome} ${NOME_SOBRENOME.sobrenome}!
    Log   Seu novo email é: ${MENSAGEM}

Novo email
    [Arguments]    ${NOME_SOBRENOME.nome}    ${NOME_SOBRENOME.sobrenome}
    ${LETTERS}  Generate Random String
    ${NOVO_EMAIL}    Set Variable    ${NOME_SOBRENOME.nome}${NOME_SOBRENOME.sobrenome}${LETTERS}@testerobot.com 
    [Return]    ${NOVO_EMAIL} 
    
    
