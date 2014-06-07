source('base.R')

df <- load.data()

png('plot1.png', width=480, height=480)

hist(df$Global_active_power, xlab='Global Active Power (kilowatts)',
     main='Global Active Power', col='red')

dev.off()
