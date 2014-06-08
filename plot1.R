#Draws plot1
plot1 <- function(){
	
	#loading PNG object
	loadPNG("plot1.png")
	
	#Reading data from file
	data <- getData()
	
	#Drawing histogram
	hist(as.numeric(data$Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
	
	#unloadPNG
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
	#reading data from file to data frame
	data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE)
	
	#converting date column to Date 
	data$Date <- as.Date(data$Date, format="%d/%m/%Y")
	
	#filtering data to 2007-02-01 & 2007-02-02
	data <-data[(data$Date=="2007-02-01" | data$Date=="2007-02-02"),] 
	
	#converting time column to Time 
	data$Time <- paste(as.character(data$Date), as.character(data$Time))
	data$Time <- strptime( data$Time, "%Y-%m-%d %H:%M:%S")
	
	#returning data
	data
}