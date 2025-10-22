
#### --------------------------------------------------------------------
#### Production du rapport mensuelle d'aide à la rédaction de la note IPC
#### --------------------------------------------------------------------

rm(list=ls())

analyse <- "2022_03"
liste_ville <- "10"

library(dplyr)
library(lubridate)
library(glue)
library(zip)

### Création de la fonction produisant le rapport mensuel d'une ville ###
#### ---------------------------------------------------------------- ### 
f_rapport_mensuel <- function(ville) {
  print (glue("Traitement de la ville ",ville))
  
  ## Production du html pour une ville
  quarto::quarto_render(
    input = "Programmes/AA_Modele.qmd",
    execute_params = list(p_ville = ville,
                          p_periode = analyse) )
  
  ## Renommage du html de sortie 
  file.rename("Programmes/AA_Modele.html",
              glue("Data_sortie/AnalyseAA_{analyse}_Ville{ville}.html"))
  
} 
## Fin de la creation de la fonction f_rapport_mensuel

lapply(liste_ville, function(i) f_rapport_mensuel(ville=i))

print("Fin des traitements")

