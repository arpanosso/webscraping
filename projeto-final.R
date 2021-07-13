u_base  <- "https://ape.unesp.br/orcamento_anual/ddp_tabela.php"

r <- httr::GET(u_base,
               httr::write_disk("output/tabela_unesp.html",overwrite = TRUE)
               )


httr::POST(
  url=u_base
)

httr::GET(
  url=u_base
)

endpoint<-"/txtunidade=1&txtano=2016&txtmes_inicial=1&operacao_atual=buscar_campos&token_ddp="

httr::GET(
  url=paste0(u_base,endpoint)
)

httr::GET(
  url=paste0(u_base,endpoint)
) |>
  httr::content("text", simplifyDataFrame = TRUE)


body_unesp<- list(
txtunidade= 1,
txtano= 2016,
txtmes_inicial= 2,
txtmes_final= 3,
operacao_atual= "buscar_campos",
token_ddp= ""
)

r <- httr::POST(u_base,
               httr::write_disk("output/tabela_unesp_post.html",
                                overwrite = TRUE),
               body = body_unesp
               )
