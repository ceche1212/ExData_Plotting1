library(lubridate)
tabla=read.csv("power.txt",header=TRUE,sep = ";")
copia=copy(tabla)
copia[,1]=as.Date(copia[,1],"%d/%m/%Y")
copia=copia[copia$Date>="2007-02-01",]
copia=copia[copia$Date<="2007-02-02",]
copia[,3]=as.numeric(copia[,3])
copia[,"Datetime"]=paste(copia$Date,copia$Time,sep = " ")
copia[,"Datetime"]=ymd_hms(copia[,"Datetime"])
hist(copia[,3]/1000,col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power",xlim = c(0,6))
dev.copy(png,file="Plot1.png")
dev.off()
