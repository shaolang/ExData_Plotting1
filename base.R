load.data <- function() {
  df <- read.csv2('household_power_consumption.txt', colClasses='character')

  df <- subset(df, grepl('^(1|2)/2/2007$', df$Date))

  for (i in 3:9) df[,i] <- as.numeric(df[, i])

  df$Date.time <- as.POSIXct(sprintf('%s %s', df$Date, df$Time),
                             format='%d/%m/%Y %H:%M:%S')

  df
}

# for plot 2
plot.line.gap.vs.date.time <- function(df) {
  plot(df$Date.time, df$Global_active_power, type='l',
       xlab='', ylab='Global Active Power (kilowatts)')
}

# for plot 3
plot.sub.meters <- function(df, legend.box='o') {
  max.sub.metering <- with(df, max(Sub_metering_1, Sub_metering_2, Sub_metering_3))
  min.sub.metering <- with(df, min(Sub_metering_1, Sub_metering_2, Sub_metering_3))

  with(df, plot(Date.time, Sub_metering_1 + Sub_metering_2 + Sub_metering_3,
                type='n', xlab='', ylab='Energy sub metering',
                ylim=c(min.sub.metering, max.sub.metering)))

  with(df, lines(Date.time, Sub_metering_1, col='black'))
  with(df, lines(Date.time, Sub_metering_2, col='red'))
  with(df, lines(Date.time, Sub_metering_3, col='blue'))

  legend('topright', lty='solid', col=c('black', 'red', 'blue'),
         bty=legend.box,
         legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
}
