
### Script de preparation des données 
### s'execute dans le chunk preparation_donnees


##############################################################
### Traitement des dates utiles pour rapport mensuel (RM)  ###
##############################################################
date_analyse <- ym(periode_analyse)

### Valeur récupérées
mois_analyse <- format(date_analyse, "%m")


#####################################################
## Libellé de la ville pour rapport mensuel (RM)  ###
#####################################################
l_ville <- readRDS("../Data_sortie/libville.rds") %>%
  filter(ville == code_ville) %>%
  select(libville) %>%
  pull()

########################################################
###  Libelle des mois et années pour rapport mensuel ###
########################################################

libmois <- readRDS("../Data_entree/libmois.rds")
#### l_mois
l_mois <- libmois %>%
  filter(mois == mois_analyse)  %>%
  select(libmois) %>%
  pull()

# ################################################################
# ### Traitement fichier historique pour rapport mensuel (RM)  ###
# ################################################################
 
# ipc_histo <- readRDS("../Data_entree/IPC_histo_initial_2017_01_2024_12.rds")
 
##############################
 
# ipc_histo_reduit <- ipc_histo %>% 
#   filter(ville ==  code_ville) %>% 
#   select(all_of(liste_variables))

### DF : ipc_ensemble :
### T01 : Ensemble
### Evolutions mensuelles et annuelles par grand secteur d'activité
### ---------------------------------------------------------------

### DF : ipc_alim - Secteur alimentaire
### T02 : Evolutions mensuelles et annuelles pour les produits alimentaires
### T03 : Les évolutions mensuelles décroissantes des produits alimentaires
### T04 : Les évolutions annuelles décroissantes des produits alimentaires
### ---------------------------------------------------------------------------
 
### DF : ipc_nonalim - Secteur non alimentaire
### T05 : Evolutions mensuelles et annuelles pour les produits non alimentaires
### T06 : Les évolutions mensuelles décroissantes des produits non alimentaires
### T07 : Les évolutions annuelles décroissantes des produits non alimentaires
### -------------------------------------------------------------------------------

### Graphique annuelle - ipc_evol_annuel et ipc_evol_annuel_gra
### G01 : Graphique de l'évolution annuelle en %
### T08 : Tableau de l'évolution annuelle en %
### --------------------------------------------

### Graphique mensuelle - ipc_evol_mensuel et ipc_evol_mensuel_gra
### G02 : Graphique de l'évolution mensuelle en %
### T09 : Tableau de l'évolution mensuelle en %
### ---------------------------------------------

### IPC_tableau
### T10 : Tableau de synthèse
### -------------------------
    

####################
### FIN PGM      ###
####################
