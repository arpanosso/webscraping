library(purrr)

nums <- 1:10

soma_um <- function(arg) arg +1

map(nums, soma_um)



map_dbl(nums, soma_um) # para vetorizar
# _chr
# _lgl
# _dfr linhas do dataframe
# _dfc colunas do dataframe


map(nums, \(.).+1)
map(nums, ~ .x + 1)
map(nums, ~ . + 1)


library(future)
availableCores()

