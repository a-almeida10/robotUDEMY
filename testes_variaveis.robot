*** Settings ***
Documentation    Essa suíte testa os tipos de variáveis
Library    Collections

*** Variables ***
 
@{MESES_ANO}        Janeiro    Fevereiro    Março    Abril    Maio    Junho    Julho    Agosto    Setembro    Outubro    Novembro    Dezembro

&{DIAS_MES}    Janeiro=31
...    Fevereiro=28/29
...    Março=31
...    Abril=30
...    Maio=31
...    Junho=30
...    Julho=31
...    Agosto=31
...    Setembro=30
...    Outubro=31
...    Novembro=30
...    Dezembro=31





*** Test Cases ***
Teste 01 - Imprimir os meses do ano
    Imprimir no console a lista dos meses
    Imprimir os meses um a um
Teste 02- Imprimir os meses e quantidade de dias
    [Tags]    dias_mes
    Imprimir os meses e os dias
*** Keywords ***
Imprimir no console a lista dos meses
     Log    Meses do ano: @{MESES_ANO}
 Imprimir os meses um a um
     Log        Esses são os meses do ano: ${MESES_ANO[0]} , ${MESES_ANO[1]}, ${MESES_ANO[2]}, ${MESES_ANO[3]}, ${MESES_ANO[4]}  

Imprimir os meses e os dias
    Log     Janeiro: ${DIAS_MES.Janeiro} dias
    Log     Fevereiro: ${DIAS_MES.Fevereiro} dias
    Log     Março: ${DIAS_MES.Março} dias
    Log     Abril: ${DIAS_MES.Abril} dias
    Log     Maio: ${DIAS_MES.Maio} dias
    Log     Junho: ${DIAS_MES.Junho} dias
    Log     Julho: ${DIAS_MES.Julho} dias
    Log     Agosto: ${DIAS_MES.Agosto} dias
    Log     Setembro: ${DIAS_MES.Setembro} dias
    Log     Outubro: ${DIAS_MES.Outubro} dias
    Log     Novembro: ${DIAS_MES.Novembro} dias
    Log     Dezembro: ${DIAS_MES.Dezembro} dias
