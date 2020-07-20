# Teste Charles - Testes realizados na API OMDB

Esse projeto implementa todos os fluxos de testes automatizados para o projeto Happy Flex

> Utilizando a stack: 
```sh
Ruby + Cucumber + HTTParty
```
> O motivo de escolher essa stack, é que, além de muito simples e permitir que várias ações sejam feitas de forma mais otimizada, a linguagem Ruby também oferece uma ótima qualidade de código, deixando o projeto com a boa prática de programação _clean code_. 

[![Ruby Version][ruby-image]][ruby-url]
[![Cucumber Version][cucumber-image]][cucumber-url]
[![HTTParty Version][httparty-image]][httparty-url]

## Baixando o projeto

Para baixar todo o projeto e suas dependências, basta fazer o git clone, no diretório desejado de sua máquina. 
Para realizar o procedimento via linha de comando, acesse o diretório desejado através do console de sua preferência, e logo após, execute o comando:
```sh
git clone https://github.com/maressaoliveirazup/TestCharlesAPI.git
```
Após a conclusão, todos os arquivos estarão disponíveis no diretório previamente escolhido.

## Executando...

Para executar os testes, abra o projeto, baixado no passo anterior, em uma IDE de sua escolha, e siga o passo a passo:

* Para instalar todas as dependências configuradas, acesse o diretório do projeto pelo seu console, e execute o comado:

```sh
bundle install
```

* Após concluir a instalação, execute o comando abaixo substituindo o _"@tag"_ para a tag do teste que você deseja executar. As tags podem ser encontradas no arquivo **OMDB.feature** (veja a imagem abaixo).

```sh
cucumber -p -test -t @suatag
```

![@tag](https://github.com/maressaoliveirazup/TestCharlesAPI/blob/master/tags.png)

## Relatórios

Conseguimos gerar dois tipos de relatório para esse projeto. 

* O primeiro, se trata do relatório de aprovação e falha dos testes, e pode ser gerado seguindo o passo a passo abaixo:

    * É necessário gerar o relatório, antes de o mesmo ser exibido, por se tratar de um relatório web. Para isso, em sua linha de comando execute:

      ```sh
      cucumber -p -test -p allure -t @suatag
      ```
      (lembrando que _@suatag_ deve ser substituída pela tag do teste que você deseja que o relatório seja exibido.)

    * Para visualizar o relatório:

      ```sh
      allure serve allure-results
      ```

  Após a execução desse comando, o relatório previamente gerado, será exibido em seu navegador web.

  O(s) relatório(s) exibido(s) serão como os abaixo:

     * para a tag _'@OMDB_apikey_valid'_

     ![@OMDB_apikey_valid](https://github.com/maressaoliveirazup/TestCharlesAPI/blob/master/allure_report_OMDB_apikey_valid.png)

    * para a tag _'@OMDB_apikey_invalid'_

     ![@OMDB_apikey_invalid](https://github.com/maressaoliveirazup/TestCharlesAPI/blob/master/allure_report_OMDB_apikey_invalid.png)

* O segundo relatório se trata de uma ferramente utilizada para avaliar a qualidade do código Ruby. Para visualizar basta:
      
    * Executar o comando abaixo em seu console:
      ```sh
      rubycritic
      ```
      
     * O relatório que será exibido, se parecerá com esse: 

     ![](https://github.com/maressaoliveirazup/TestCharlesAPI/blob/master/analise_codigo.png)


## ------------ Dúvidas ------------ 

> Em caso de dúvidas, basta entrar em contato:

* Maressa Sales - Analista de Qualidade
* maressa.oliveira@zup.com.br
* [LinkedIn](https://www.linkedin.com/in/maressa-sales-de-oliveira-3541a2151/)


[ruby-image]: https://img.shields.io/badge/ruby-2.6.5--1-red
[ruby-url]: https://www.ruby-lang.org/pt/
[cucumber-image]: https://img.shields.io/badge/cucumber-using-brightgreen
[cucumber-url]: https://cucumber.io/
[httparty-image]: https://img.shields.io/badge/httparty-0.18.1-yellow
[httparty-url]: https://rubygems.org/gems/httparty/versions/0.13.7?locale=pt-BR
