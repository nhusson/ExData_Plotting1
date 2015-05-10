#read the data
df<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#paste date and time columns to create a new datetime column
df$DateTime<-paste(df$Date, df$Time)

#convert to a "real" datetime column
df$DateTime <-strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

#filtering for 1/2/2007 and 2/2/2007
df_filtered <- df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]

#opening png file driver
png(file="plot4.png")

#plot
par(mfrow=c(2,2))
with(df_filtered, {
        plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
        plot(DateTime, Voltage, type="l", col="black", ylab="Voltage", xlab="datetime")
        plot(DateTime, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
        legend("topright", pch = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(DateTime, Global_reactive_power, type="l", col="black", ylab="Global_reactive_power", xlab="datetime")
        }
     )

#close driver
dev.off()
