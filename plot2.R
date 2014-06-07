source('base.R')

df <- load.data()

png('plot2.png', width=480, height=480)
plot.line.gap.vs.date.time(df)
dev.off()
