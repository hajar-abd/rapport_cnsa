################################################################################
#ABDAOUI Hâjar 
#ROMANA Shaïnez
#ZOUZANE Karima
##GROUPE 3
######################## SCRIPT ORAL ###########################################
## création et affichage d'un ensemble de données 
    #nous avons décidé de nommer notre base de données "ehpad"
ehpad<-c(cnsa)
ehpad
## choix des variables appropriées à notre étude
ehpad<-cnsa[,c("HAS","STATUT_JUR","prixHebPermCs","PRIX_HEB_PERM_CS","prixHebPermCsa","PRIX_HEB_PERM_CSA","prixHebPermCd","PRIX_HEB_PERM_CD")]
ehpad

## il faut transformer les variables qualitatives en facteurs
ehpad$STATUT_JUR<-as.factor(ehpad$STATUT_JUR)
ehpad$HAS<-as.factor(ehpad$HAS)

## Visualisation de l'étendue des données 
boxplot(ehpad$PRIX_HEB_PERM_CS)
# suppression des valeurs trop éloignées et manquantes 
ehpad=na.omit(ehpad)
ehpad 
ehpad[ehpad$PRIX_HEB_PERM_CS>500,]=NA #MAX DATA
ehpad=na.omit(ehpad)
ehpad #pour s'assurer de la suppression de notre valeur trop éloignée
boxplot(ehpad$PRIX_HEB_PERM_CS) #pour s'assurer de la suppression de notre valeur trop éloignée

## bornes inferieures et superieures des intervalles de confiance 
nrow(ehpad[ehpad$STATUT_JUR=="1-Public",]) #calcul de n 
mean(ehpad[ehpad$STATUT_JUR=="1-Public",]$PRIX_HEB_PERM_CS)+qt(df=1329,0.975)*(sd(ehpad[ehpad$STATUT_JUR=="1-Public",]$PRIX_HEB_PERM_CS)/(1330^0.5))
mean(ehpad[ehpad$STATUT_JUR=="2-Prive non lucratif",]$PRIX_HEB_PERM_CS)+qt(df=1329,0.975)*(sd(ehpad[ehpad$STATUT_JUR=="2-Prive non lucratif",]$PRIX_HEB_PERM_CS)/(1330^0.5))
mean(ehpad[ehpad$STATUT_JUR=="3-Prive commercial",]$PRIX_HEB_PERM_CS)+qt(df=1329,0.975)*(sd(ehpad[ehpad$STATUT_JUR=="3-Prive commercial",]$PRIX_HEB_PERM_CS)/(1330^0.5))
mean(ehpad[ehpad$STATUT_JUR=="1-Public",]$PRIX_HEB_PERM_CS)-qt(df=1329,0.975)*(sd(ehpad[ehpad$STATUT_JUR=="1-Public",]$PRIX_HEB_PERM_CS)/(1330^0.5))
mean(ehpad[ehpad$STATUT_JUR=="2-Prive non lucratif",]$PRIX_HEB_PERM_CS)-qt(df=1329,0.975)*(sd(ehpad[ehpad$STATUT_JUR=="2-Prive non lucratif",]$PRIX_HEB_PERM_CS)/(1330^0.5))
mean(ehpad[ehpad$STATUT_JUR=="3-Prive commercial",]$PRIX_HEB_PERM_CS)-qt(df=1329,0.975)*(sd(ehpad[ehpad$STATUT_JUR=="3-Prive commercial",]$PRIX_HEB_PERM_CS)/(1330^0.5))


##test de conformité entre statuts juridiques et ASH --> test du khi 2 
med<-cnsa[,c("HAS","STATUT_JUR")]
med
med$HAS<-as.factor(med$HAS)
med$STATUT_JUR<-as.factor(med$STATUT_JUR)
statuts<-c(med$STATUT_JUR=="1-Public",med$STATUT_JUR=="2-Prive non lucratif",med$STATUT_JUR=="3-Prive commercial")
statuts
ash<-c(med$HAS=="OUI",med$HAS=="NON")
ash
chisq.test(med$STATUT_JUR,med$HAS)

# proportion des EHPAD habilités à la ASH 
ehpadeux<-cnsa[,c("HAS","PRIX_HEB_PERM_CS","STATUT_JUR")]
ehpadeux
ehpadeux$HAS<-as.factor(ehpadeux$HAS)
ehpadeux$STATUT_JUR<-as.factor(ehpadeux$STATUT_JUR)
ehpadeux=na.omit(ehpadeux)
tab<-table(ehpadeux$HAS)
tab
prop.table(tab)
pie(tab,main = "Proportion des EHPAD habilités à la ASH",font.main=4,cex.main=0.5)

summary(ehpadeux[ehpadeux$HAS=="OUI",]$PRIX_HEB_PERM_CS)
summary(ehpadeux[ehpadeux$HAS=="NON",]$PRIX_HEB_PERM_CS)

# Proportion des NON selon statut juridique 
by(ehpadeux$STATUT_JUR=="1-Public",ehpadeux$HAS=="NON",sum)
by(ehpadeux$STATUT_JUR=="2-Prive non lucratif",ehpadeux$HAS=="NON",sum)
by(ehpadeux$STATUT_JUR=="3-Prive commercial",ehpadeux$HAS=="NON",sum)
tab1<-c(by(ehpadeux$STATUT_JUR=="1-Public",ehpadeux$HAS=="NON",sum),by(ehpadeux$STATUT_JUR=="2-Prive non lucratif",ehpadeux$HAS=="NON",sum),by(ehpadeux$STATUT_JUR=="3-Prive commercial",ehpadeux$HAS=="NON",sum))
tab1
prop.table(tab1)


## Comparaison des statistiques descriptives de nos variables en fonction du statut juridique 

summary(ehpad[ehpad$STATUT_JUR=="1-Public",]$PRIX_HEB_PERM_CS)
summary(ehpad[ehpad$STATUT_JUR=="2-Prive non lucratif",]$PRIX_HEB_PERM_CS)
summary(ehpad[ehpad$STATUT_JUR=="3-Prive commercial",]$PRIX_HEB_PERM_CS)

summary(ehpad[ehpad$STATUT_JUR=="1-Public",]$PRIX_HEB_PERM_CSA)
summary(ehpad[ehpad$STATUT_JUR=="2-Prive non lucratif",]$PRIX_HEB_PERM_CSA)
summary(ehpad[ehpad$STATUT_JUR=="3-Prive commercial",]$PRIX_HEB_PERM_CSA)

# Autre méthode pour comparer les statistiques descriptives de nos variables en fonction du statut juridique
by(ehpad$PRIX_HEB_PERM_CS,ehpad$STATUT_JUR,summary)
by(ehpad$PRIX_HEB_PERM_CSA,ehpad$STATUT_JUR,summary)

## test de 2 échantillons appariés 
t.test(ehpad$PRIX_HEB_PERM_CS,ehpad$PRIX_HEB_PERM_CSA,paired=TRUE)
# p valeur < 5%, donc les moyennes sont significativement différentes soit les prix pour les bénéficiaires de l'ASH sont 
# significativement ≠ des prix de base sans l'aide. 
# Autre méthode : vérification avec la formule 
avant<-c(ehpad$PRIX_HEB_PERM_CS)
apres<-c(ehpad$PRIX_HEB_PERM_CSA)
d<-apres-avant
d
t<-(mean(d))/(sd(d)/(nrow(ehpad)^0.5))
t # on retrouve le même t que dans notre test de Student. 

## Comparaison des prix moyen et médian entre chambre simple et double en hébergement permanent 

by(ehpad$PRIX_HEB_PERM_CD,ehpad$STATUT_JUR,mean) #prix moyen de l'hébergement permanent en chambre double en fn du statut juridique
by(ehpad$PRIX_HEB_PERM_CS,ehpad$STATUT_JUR,mean) #prix moyen de l'hébergement permanent en chambre simple en fn du statut juridique

by(ehpad$PRIX_HEB_PERM_CS,ehpad$STATUT_JUR,median) #prix médian de l'hébergement permanent en chambre simple en fn du statut juridique
by(ehpad$PRIX_HEB_PERM_CD,ehpad$STATUT_JUR,median) #prix médian de l'hébergement permanent en chambre double en fn du statut juridique

## test entre deux échantillons appariés
t.test(ehpad$PRIX_HEB_PERM_CS,ehpad$PRIX_HEB_PERM_CD,paired=TRUE) # les moyennes  sont significativement différentes
# -->les prix moyens entre chambre double et simple sont significativement différents  
wilcox.test(ehpad$PRIX_HEB_PERM_CS,ehpad$PRIX_HEB_PERM_CD, paired=TRUE)
# --> Les prix médians sont significativement différents car la p-valeur< 5% 

    ##### DIAGRAMMES COMPLEMENTAIRES AU TEST DE WILCOXON ET T.TEST 
# Diagramme qui montre la proportion dans notre échantillon d'établissements par statut juridique et par type de chambre
split.screen(1:2)
screen(2);barplot(table(ehpad[ehpad$PRIX_HEB_PERM_CS,]$STATUT_JUR),ylim=c(0,1600),main="Proportions d'établissements proposant une chambre simple selon le statut juridique",cex.main=0.7,col=c("#999999","#FF9966","#009999")) 
screen(1);barplot(table(ehpad[ehpad$PRIX_HEB_PERM_CD,]$STATUT_JUR),ylim=c(0,1600),main="Proportions d'établissements proposant une chambre double selon le statut juridique",cex.main=0.7,col=c("#999999","#FF9966","#009999"))
table(ehpad[ehpad$PRIX_HEB_PERM_CS,]$STATUT_JUR)
table(ehpad[ehpad$PRIX_HEB_PERM_CD,]$STATUT_JUR)

# Diagramme comparant le prix moyen de l'hébergement en chambre double et simple en fonction du statut juridique 
split.screen(1:2)
screen(2);barplot(by(ehpad$PRIX_HEB_PERM_CS,ehpad$STATUT_JUR,mean),main= "Prix moyen de l'hébergement permanant en chambre seule en fonction du statut juridique", cex.main=0.7, ylim = c(0,100),col=c("#009999","#FF9966","#999999"))
screen(1);barplot(by(ehpad$PRIX_HEB_PERM_CD,ehpad$STATUT_JUR,mean),main= "Prix moyen de l'hébergement permanant en chambre double en fonction du statut juridique", cex.main=0.7, ylim = c(0,100),col=c("#009999","#FF9966","#999999"))

# ANOVA => comparaison des moyennes des prix d'hébergement permanent selon le statut juridique 
bat<-data.frame(ehpad$STATUT_JUR,ehpad$PRIX_HEB_PERM_CS,ehpad$PRIX_HEB_PERM_CD)
bat
summary(aov(ehpad$PRIX_HEB_PERM_CS~ehpad$STATUT_JUR,data=bat))
summary(aov(ehpad$PRIX_HEB_PERM_CD~ehpad$STATUT_JUR,data=bat))



