# Vamos ver tr~es exemplos de apis
# olho vivo da SPTrans - buz de são paulo
# vamos treinar autenticação nesse api

# depois vamos ver a API do twitter pelo RTwitte

# depois vamos fazer da covid

# Autenticação depende da api e pode ser rsolvido de várias formas
# geralmente se pega uma chave de acesso no site do órgão pra extrair os dados
# e plugo os codigo com o dsode de acesso
library(tidyverse)
library(httr)

u_sptrans <- "http://api.olhovivo.sptrans.com.br/v2.1"
endpoint <- "/Posicao"
u_sptrans_busca <- paste0(u_sptrans, endpoint)
(r <- httr::GET(u_sptrans_busca))

httr::content(r) # não tenho autorização de acesso

## vamos como sptrans pede atenticaçao
## na documentação elea pede para fazer o acesso passando o token no url,
## ideal seira no body


## u_sptrans_login

## tem que fazer a conta no sptrans

api_key<-"4af5e3112da870ac5708c48b7a237b30206806f296e1d302e4cb611660e2e03f"

usethis::edit_r_environ(scope = "project") # e colocamos as var de ambiente e de vemos reiniciar
# a secçao
Sys.getenv("API_OLHO_VIVO")


u_sptrans_login <-paste0(u_sptrans,"Login/Autenticar")
q_sptrans_login <- list(token=api_key)
r_sptrans_login <- httr::POST(u_sptrans_login, query=q_sptrans_login)


r_sptrans_busca


r_sptrans<-httr::content(r_sptrans_busca)


r_sptran <- httr::GET(u_sptrans_busca)
lista <- httr::content(r_sptrans, simplifyDataFrame = TRUE)



####
library(rtweet)

# O OAuth2.0 precisa de um passo manual para entrar com o login do google,
# por exemplo

# {googlesheets4} e {rdrop2}

# o rtweet faz isso automatico


googlesheets4::gs4_auth()

#

trends <- rtweet::get_trends()

# 1. postar

rtweet::post_tweet(
  "Estou tuitando para o curso de Web Scraping da @curso_r, usando o pacote {rtweet}! #rstats"
)

# 2. timeline
da_timeline <-
  rtweet::get_timeline("clent_")
head(da_timeline$text)


# mençoes
da_mensoes <- get_mentions()

da_mensoes_ <- get_mentions("")

# 4. encontrar amigos

da_user <- rtweet::search_users("#rstats", n=100)

da_user_<- search_users("#Peralta_Deise", n=100)



rtweet::post_tweet(
  "@Peralta_Deise Esse post foi tweetado por um robo criado por @panosso_r, eu no caso"
)

# No caso da covid
# é um dashboard, entrar com o pé atrás
# e queremos baixar o CSV
# usa oopem data sus
# querobai monitorar e baixar
# o nome do arquivo tem a data
# nada garante que a data está escrita de uma forma de nome padrão
# as vezes pode ter erraod, 01 ou 1
# quero acessa o site
# identificar o URL, independentemnete do formato dela

r<-httr::GET("")
usethis::edit_r_environ("project")







