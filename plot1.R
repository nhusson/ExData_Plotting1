#read the data
df<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#paste date and time columns to create a new datetime column
df$DateTime<-paste(df$Date, df$Time)

#convert to a "real" datetime column
df$DateTime <-strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

#filtering for 1/2/2007 and 2/2/2007
df_filtered <- df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]

#opening png file driver
png(file="plot1.png")

#plot
hist(df_filtered$Global_active_power, main="Global Active Power", col="Red", xlab="Global Active Power (kilowatts)")

#close driver
dev.off()
