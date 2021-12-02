# Internet das coisas

## Monitoramento de reservatório de água em tempo real



## Projeto 

Este aplicativo foi desenvolvido em Flutter.

## Telas do projeto
<p><img src="ReadmeImages/Tela de Entrada.png" width="22%"/> 
<img src="ReadmeImages/Tela de Informações.png" width="22%"/>
<img src="ReadmeImages/tela de histrorico.png" width="22%"/>
<img src="ReadmeImages/Tela de configuração.png" width="22%"/>
</p>

### ESP32

Para o projeto foi utilzado o banco de dados Firebase em tempo real para captar os dados de pressão do reservatório gerados pelo ESP32 e o sensor de pressão instalado na caixa d'água que envia os de Pressão , temperatura e altura da coluna de agua.

### A aplicação 

O apliactivo busca esses dados no banco de dados Firebase e faz o cálculo aproximado da quantidade de água do reservatório, em litros e porcentagem de acordo com a regra de negócio.

## Requisitos da Aplicação

- RF01  Permitir autenticação através do email Gmail. 
- RF02 Mostra o nível do reservatório em percentuais.
- RF03 Mostrar o nível do reservatório em litros.
- RF04 Ter uma barra colorida para indicar o nivel de água. 
- RF05 Mostra a pressão da água em Pascal.
- RF06 Tela de configuração para a caixa d'água.
- Rf07 histórico da medições. 



