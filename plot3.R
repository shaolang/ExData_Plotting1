source('base.R')

df <- load.data()

png('plot3.png', width=480, height=480)
plot.sub.meters(df)
dev.off()
