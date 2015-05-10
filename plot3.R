#read the data
df<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#paste date and time columns to create a new datetime column
df$DateTime<-paste(df$Date, df$Time)

#convert to a "real" datetime column
df$DateTime <-strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

#filtering for 1/2/2007 and 2/2/2007
df_filtered <- df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]

#opening png file driver
png(file="plot3.png")

#plot
with(df_filtered, plot(DateTime, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy Sub Metering"))
with(df_filtered, lines(DateTime, Sub_metering_2, col="red"))
with(df_filtered, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", pch = 1, col = c("black", "blue", "red"), legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))

#close driver
dev.off()
