covid<-read.csv2(
  "https://www.data.gouv.fr/fr/datasets/r/f4935ed4-7a88-44e4-8f8a-33910a151d42" , 
  header=TRUE, dec=".", sep=";", 
  skip=7, encoding = "UTF-8")

covid$Pays |> unique() |> sort()

list_pays <- c("Allemagne","Australie","Belgique",
               "France","États-Unis","Royaume-Uni")

for (i in 1:length(list_pays)) {
  filename <- paste("covid_",list_pays[i],".pdf",sep="")
  rmarkdown::render("covid_auto.Rmd", 
                    output_file = filename,
                    param=list(pays=list_pays[i]))
}
