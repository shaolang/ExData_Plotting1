source('base.R')

df <- load.data()

png('plot4.png', width=480, height=480)

par(mfcol=c(2,2))

plot.line.gap.vs.date.time(df)
plot.sub.meters(df, legend.box='n')

with(df, plot(Date.time, df$Voltage, type='l', xlab='datetime'))
with(df, plot(Date.time, Global_reactive_power, type='s', xlab='datetime'))

dev.off()
