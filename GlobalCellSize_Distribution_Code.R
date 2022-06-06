#load packages
library(tidyverse)
library(ggplot2)

nam <- read.csv("Madin.csv", as.is=TRUE) #load data set
nam2 <- subset(nam, Superkingdom=="Bacteria") #remove Archaea
Vol <- nam2[, "AverageVolume"] #Only Column with Volumes
Vol = Vol*10^18 #convert to cubic micrometers


df=data.frame(log(Vol))
colnames(df)=c("vol")
plot = ggplot(data=df, aes(vol))+
  geom_histogram(binwidth=0.5)+
  theme_classic()+
  labs(x=expression(paste("log(cell volume [", mu, "m"^3, "])")), y="Frequency", title="Global Cell Size Distribution")+scale_x_continuous(breaks = seq(-4, 4, by = 0.5))+
  theme(axis.text=element_text(size=18),axis.title=element_text(size=24), plot.title=element_text(size=35, hjust=0.5))
                                                                                                                                                                                                                               
ggsave(plot = plot, width = 10, height = 5, dpi = 300, filename = "plot.png")
