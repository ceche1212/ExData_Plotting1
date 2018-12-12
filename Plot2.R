library(lubridate)
tabla=read.csv("power.txt",header=TRUE,sep = ";")
copia=copy(tabla)
copia[,1]=as.Date(copia[,1],"%d/%m/%Y")
copia=copia[copia$Date>="2007-02-01",]
copia=copia[copia$Date<="2007-02-02",]
copia[,3]=as.numeric(copia[,3])
copia[,4]=as.numeric(copia[,4])
copia[,5]=as.numeric(copia[,5])
copia[,6]=as.numeric(copia[,6])
copia[,7]=as.numeric(copia[,7])
copia[,8]=as.numeric(copia[,8])
copia[,9]=as.numeric(copia[,9])
copia[,"Datetime"]=paste(copia$Date,copia$Time,sep = " ")
copia[,"Datetime"]=ymd_hms(copia[,"Datetime"])
x=copia$Datetime
y=copia$Global_active_power/1000
plot(y~x,xlab = "",ylab = "Global Active Power (kilowatts)",main="",type = "l",col="black")
dev.copy(png,file="Plot2.png")
dev.off()
