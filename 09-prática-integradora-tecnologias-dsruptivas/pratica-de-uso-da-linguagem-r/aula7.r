#criar, chamar pacotes numa variável
required_packages <- c("sf", "leaflet", "ggplot2", "dplyr")

#fazer um for
for(pkg in required_packages){
    if(!require(pkg, character.only = TRUE)){
        install.packages(pkg, dependencies = TRUE)
        library(pkg, character.only = TRUE)
    }
}


#importação de dados
#df = data frame
saude_df <- read.csv("saude_geodata.csv")
logistica_df <- read.csv("logistica_geodata.csv")
terceiro_setor_df <- read.csv("terceiro_setor_geodata.csv")


#coversão de dados
#são comandos padronizados
#as função/conversão
#coords = coordenates
saude_df <- st_as_sf(saude_df, coords = c("Long", "Lat"), crs = 4326)
logistica_df <- st_as_sf(logistica_df, coords = c("Long", "Lat"), crs = 4326)
terceiro_setor_df <- st_as_sf(terceiro_setor_df, coords = c("Long", "Lat"), crs = 4326)


#mapear no mapa

leaflet(data = saude_df) %>%
    addTiles()%>%
    addCirclesMarkers(radius = 5, color =  ~colorNumeric("viridis", saude_df$Usuarios) (Usuarios),
    popup = ~paste("Usuário:", Usuarios)) %>%
    addLegend("bottomright", pal = colorNumeric("viridis", saude_df$Usuarios), values = ~Usuarios, title = "Usuários")
