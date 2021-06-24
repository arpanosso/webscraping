# Raspagem de dados, criando robos
# nossos http
# como R conecta com a web
# http - e api, application programing interface
# depois discutimos como fazer webscraping de fato
# baixar páginas web, fazer requisição http
# e a etapa da parcimgs e como iterar esses algortmos, como
# fazer as interações, programa em paralelo e usar barras de progresso
# para acompanhar -)
# erros, e no final vamos ver tmb páginas dinManicas,
# muito empírico, fazendo na prática a partir de exemplos
# vai na cara e coragem

### APIS
# application Programing Interface
# forma de acessar dados de uma plataforma por uma lignagem
# forma que os computadores se comunicam na nte
# usa o {httr}

## API do pokemoon

library(httr)
library(jsonlite)

u_base <- "https://pokeapi.co/api/v2/"
endpoint<-"/pokemon/ditto"
u_pokemon<-paste0(u_base,endpoint)
r_pokemon <- GET(u_pokemon)

content(r_pokemon)
content(r_pokemon, as="text") # solta o texto do json,
content(r_pokemon, as="raw") # bruto, endereço de memoria pouco utilizado
content(r_pokemon, as="parsed") # é o padrão



# Mas o que ela ta rodadno??
# a fromJASON

r_pokemon |>
  content("parse", simplifyDataFrame = TRUE)


fromJSON(content(r_pokemon, as="text")) # á mesma que anterior
# procura nas listas de listas de listas os formatos de data frame
# as listas cujos elemesntos tem mesmo comprimento.

content(r_pokemon, as="text") |>
  fromJSON()

# as tres sao a mesma coisa

r_pokemon |>
  content("text") |>
  fromJSON()

# 2. Usando os parametos da api do site
q_pokemon <- list(
  limit = 8,
  offset=1
)

r_pokemon_filtrado <- GET(
  paste0(u_base,"/pokemon"),
  query = q_pokemon
)

content(r_pokemon_filtrado,simplifyDataFrame=TRUE)

# get vai direto no url depois de ? offset=9&limit=8

# ou posso fazer

r_pokemon_filtrado2 <- GET(
  "https://pokeapi.co/api/v2/pokemon?limit=8&offset=1"
)

content(r_pokemon_filtrado2,simplifyDataFrame=TRUE)

# vamos explorar parametros da get

# write_disk, serve para salvar o resultado para depois
# uma otoma estrategia
# vc escreve em um arquivo especifico

dir.create("output",showWarnings = FALSE, recursive = TRUE)
GET(
  paste0(u_base,"/pokemon"),
  query = q_pokemon,
  write_disk("output/pokemon.json", overwrite = TRUE)
)

read_json("output/pokemon.json", simplifyDataFrame=TRUE)
# geralmente baixamos muitas paginas, e a prob do algoritmo dar problema
# é alta, pois sempre tem problema de internet por exemplo
# ja pensou se perdo tudo que baixei?, quardar em disco é a forma de
# garantir que nao vai perder, boa prática, guardar em disco
# depois ou vc guarda ou deleta os arquivos brutos na HD.

# etapa de baixar dados deve ser diferenta de etapa de processar os dados
# fazer faxina , organizar
# ideal é dividir em duas, e com  código, mesmoq que o código
# traga ineficienci, mas fazer o q... mas em geral é uma boa prática
# deixar os arquivo grupos, para garantir que tudo q vc precisa já foi baixado
# agora é faxina de dados. pode fazer ofline



