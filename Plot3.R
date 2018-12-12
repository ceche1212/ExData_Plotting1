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
y1=copia$Sub_metering_1
y2=copia$Sub_metering_2
y3=copia$Sub_metering_3
plot(y1~x,type="l",xlab="",ylab = "Energy Sub metering",col="black")
points(y2~x,type="l",col="red")
points(y3~x,type="l",col="blue")
legend("topright",lty = c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="Plot3.png")
dev.off()