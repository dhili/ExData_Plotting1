plot4 <- function(){
	
	loadPNG("plot4.png")
	
	data <- getData()
	
	#setting rows & cols
	par(mfrow=c(2,2))
	
	#setting margins
	par(mar=c(4,4,2,2))
	
	#plot1 - 1,1
	plot(data$Time, data$Global_active_power, type="s",ylab="Global Active Power",xlab="")

	#plot2 - 1,2
	plot(data$Time, data$Voltage, type="s",ylab="Voltage",xlab="datetime")
	
	#plot3 - 2,1
	plot(data$Time, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
	points(data$Time,data$Sub_metering_1, type="s")
	points(data$Time,data$Sub_metering_2, type="s", col="red")
	points(data$Time,data$Sub_metering_3, type="s", col="blue")
	legend("topright","groups",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), lwd=c(2,2,2), col=c("black","red","blue"), horiz=FALSE, bty="n")
	
	#plot4 - 2,2
	plot(data$Time, data$Global_reactive_power, type="s",ylab="Global_reactive_power",xlab="datetime")
	
	unloadPNG()

}

#Loading PNG object
loadPNG <- function(imagename){

	png(filename = imagename, width = 480, height = 480)

}

#Unloading PNG object
unloadPNG <- function(){

	dev.off()
}
#Reading data from file
getData <- function(){

	data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE)
	data$Date <- as.Date(data$Date, format="%d/%m/%Y")
	data <-data[(data$Date=="2007-02-01" | data$Date=="2007-02-02"),] 
	data$Time <- paste(as.character(data$Date), as.character(data$Time))
	data$Time <- strptime( data$Time, "%Y-%m-%d %H:%M:%S")
	data

}

