par(family="serif",bg="white")
plot(temp[,2],
      type="l",
      main="Selection for Waste Propensity",
      xlab="Ticks (Time)",
      ylab="Propensity (Probability)",
      lwd=2,
      frame.plot=F)
abline(h=0.25,col="grey")
dev.copy(png,file="../Images/ts_waste_prop_extended.png",height=1000,width=1500,units="px",res=150)
dev.off()
