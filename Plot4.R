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

#setting the quantity of plots
par(mfrow=c(2,2))


#plot1

plot(copia$Global_active_power~copia$Datetime,xlab = "",ylab = "Global Active Power (kilowatts)",type = "l",col="black")

#Plot2

plot(copia$Voltage~copia$Datetime,xlab = "datetime",ylab = "Voltage",main="",type = "l",col="black")

#plot3

plot(copia$Sub_metering_1~copia$Datetime,type="l",xlab="",ylab = "Energy Sub metering",col="black")
points(copia$Sub_metering_2~copia$Datetime,type="l",col="red")
points(copia$Sub_metering_3~copia$Datetime,type="l",col="blue")
legend("topright",lty = c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot4

plot(copia$Global_reactive_power/1000~copia$Datetime,xlab = "datetime",ylab = "Global_reactive_power",type = "l",col="black")

dev.copy(png,file="Plot4.png")
dev.off()
