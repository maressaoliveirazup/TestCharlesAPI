#language: pt
#utf-8
@OMDB
Funcionalidade: Listar a busca dos titulos no OMDB

  @OMDB_apikey_valid
  Esquema do Cenario: Realizar a busca de titulos
    Dado que eu informe os dados Titulo <s>, Tipo <type>, Ano <y>, Retorno <r>, Pagina <page>, callbacck <callback> e Versao <v>
    Quando eu realizar a busca
    Entao a minha requisicao deve ter o retorno <code>
    E os titulos referente a busca devem ser retornados com sucesso

    Exemplos:

      |    s    |     type     |    y   |     r    |    page   |          callback        |    v    |   code    |
      |  "300"  |     ""       |   ""   |    ""    |     ""    |             ""           |    ""   |    200    |
      |  "300"  |   "movie"    |   ""   |    ""    |     ""    |             ""           |    ""   |    200    |
      |  "300"  |   "series"   |   ""   |    ""    |     ""    |             ""           |    ""   |    200    |
      |  "300"  |   "episode"  |   ""   |    ""    |     ""    |             ""           |    ""   |    200    |
      |  "300"  |   "movie"    | "2006" |    ""    |     ""    |             ""           |    ""   |    200    |
      |  "300"  |   "series"   | "2000" |    ""    |     ""    |             ""           |    ""   |    200    |
      |  "300"  |   "episode"  | "2012" |    ""    |     ""    |             ""           |    ""   |    200    |
      |  "300"  |   "movie"    | "2006" |  "json"  |     ""    |             ""           |    ""   |    200    |
      |  "300"  |   "series"   | "2000" |  "json"  |     ""    |             ""           |    ""   |    200    |
      |  "300"  |   "episode"  | "2012" |  "json"  |     ""    |             ""           |    ""   |    200    |
      |  "300"  |   "movie"    | "2006" |   "xml"  |     ""    |             ""           |    ""   |    200    |
      |  "300"  |   "series"   | "2000" |   "xml"  |     ""    |             ""           |    ""   |    200    |
      |  "300"  |   "episode"  | "2012" |   "xml"  |     ""    |             ""           |    ""   |    200    |
      |  "300"  |   "movie"    | "2006" |  "json"  |    "5"    |             ""           |    ""   |    200    |
      |  "300"  |   "series"   | "2000" |  "json"  |    "6"    |             ""           |    ""   |    200    |
      |  "300"  |   "episode"  | "2012" |  "json"  |    "2"    |             ""           |    ""   |    200    |
      |  "300"  |   "movie"    | "2006" |   "xml"  |    "3"    |             ""           |    ""   |    200    |
      |  "300"  |   "series"   | "2000" |   "xml"  |    "9"    |             ""           |    ""   |    200    |
      |  "300"  |   "episode"  | "2012" |   "xml"  |    "1"    |             ""           |    ""   |    200    |
      |  "300"  |   "movie"    | "2006" |  "json"  |    "5"    |             ""           |   "2"   |    200    |
      |  "300"  |   "series"   | "2000" |  "json"  |    "6"    |             ""           |   "3"   |    200    |
      |  "300"  |   "episode"  | "2012" |  "json"  |    "2"    |             ""           |   "1"   |    200    |
      |  "300"  |   "movie"    | "2006" |   "xml"  |    "3"    |             ""           |   "4"   |    200    |
      |  "300"  |   "series"   | "2000" |   "xml"  |    "9"    |             ""           |   "2"   |    200    |
      |  "300"  |   "episode"  | "2012" |   "xml"  |    "1"    |             ""           |   "1"   |    200    |
      |  "300"  |   "movie"    | "2006" |  "json"  |    "5"    |     "Teste Charles"      |   "2"   |    200    |
      |  "300"  |   "series"   | "2000" |  "json"  |    "6"    |     "Teste Charles"      |   "3"   |    200    |
      |  "300"  |   "episode"  | "2012" |  "json"  |    "2"    |     "Teste Charles"      |   "1"   |    200    |
      |  "300"  |   "movie"    | "2006" |   "xml"  |    "3"    |     "Teste Charles"      |   "4"   |    200    |
      |  "300"  |   "series"   | "2000" |   "xml"  |    "9"    |     "Teste Charles"      |   "2"   |    200    |
      |  "300"  |   "episode"  | "2012" |   "xml"  |    "1"    |     "Teste Charles"      |   "1"   |    200    |

  @OMDB_apikey_invalid
  Cenario: Realizar a busca de titulos
    Quando eu realizar a busca de um titulo com um apikey invalido
    Entao a minha requisicao deve falhar e retornar 401
