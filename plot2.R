plot2 <- function(){
	
	loadPNG("plot2.png")
	
	data <- getData()
	plot(data$Time, data$Global_active_power, type="s",ylab="Global Active Power",xlab="")
	
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


