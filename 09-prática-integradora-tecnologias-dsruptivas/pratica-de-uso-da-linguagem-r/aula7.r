#criar, chamar pacotes numa variável
required_packages <- c("sf", "leaflet", "ggplot2", "dplyr")

#fazer um for
for(pkg in required_packages){
    if(!require(pkg, character.only = TRUE)){
        install.packages(pkg, dependencies = TRUE)
        library(pkg, character.only = TRUE)
    }
}
