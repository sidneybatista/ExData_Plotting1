#Load Data
power.data=read.table("household_power_consumption.txt",sep=";",header=TRUE)

#Transform Date variable to as.Date()
power.data$Date=as.Date(power.data$Date,format="%d/%m/%Y")

#Extract observations corresponding to Feb 1st and Feb 2nd 2007.
data=subset(power.data, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#Format Time variable to POSIXlt format
a=paste(as.character(data$Date),as.character(data$Time),sep=" ")
b=strptime(a,format="%Y-%m-%d %H:%M")
data$Time=b

#Transform rest of variables from factor to numeric
  for (i in 3:9)
    {
       data[,i]=as.numeric(as.character(data[,i]))
      }

#Plot 2
png("Plot2.png",bg="white")
plot(data$Time,data$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")
dev.off()