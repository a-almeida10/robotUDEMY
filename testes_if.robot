***Settings***
Documentation    Essa suíte testa os blocos 'if'
***Variables***
@{LISTA_NUM}    1    2    3    4    5    6    7    8    9    10
***Test Cases***
Teste 01- Percorrer uma lista com FOR
    Imprimir 5 ou 10

*** Keywords ***
Imprimir 5 ou 10
     Log To Console  ${\n}
    FOR    ${NUM}    IN    @{LISTA_NUM}
        IF    ${NUM} == 5
            Log    Esse é o número 5!
        ELSE
            IF    ${NUM} == 10
                Log    Esse é o número 10!
            ELSE
                Log    Esse número não é nem 5, nem 10!
            END
        END




    END