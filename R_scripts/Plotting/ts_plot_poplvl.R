par(mfrow=c(6,3),mar=c(1,1,1,1),oma=c(4,4,5,4),family="serif",bg="white")
exps <- c("exp34",
         "exp35",
         "exp36",
         "exp37",
         "exp38",
         "exp39",
         "exp40",
         "exp41",
         "exp42",
         "exp43",
         "exp44",
         "exp45",
         "exp28",
         "exp29",
         "exp30",
         "exp31",
         "exp32",
         "exp33")
plotylabels <- c("No Waste","Waste","Waste Optim.")
plotxlabels <- c("SD = 1","SD = 3","SD = 5")
for(j in exps){
   print(j)
   xaxtswitch=which(exps==j)
   yaxtswitch=xaxtswitch%%3
   matts <- matrix(waste_ts_sorted[which(waste_ts_sorted[,"experiment"]==j),c(4)],nrow=500,byrow=F)
   matplot(matts,
         type="l",
         lty=1,
         lwd=1,
         col=rgb(0,0,0,0.2),
         xaxt="n",
         yaxt="n",
         main=NA,
         ylab=NA,
         frame.plot=F,
         ylim=c(100,3000))
   lines(1:500,rowMeans(matts),col="white")
   if(yaxtswitch==1){
      axis(2,lwd=1,col="lightgrey")
   }
   if(xaxtswitch %in% c(16,17,18)){
      axis(1,lwd=1,col="lightgrey")
   }
}

mtext("Climate SD = 1",side=3,at=0.15,line=1,outer=T)
mtext("Climate SD = 3",side=3,at=0.5,line=1,outer=T)
mtext("Climate SD = 5",side=3,at=0.85,line=1,outer=T)
mtext("No Waste",side=2,at=0.915,line=2,outer=T,cex=0.75)
mtext("Waste",side=2,at=0.75,line=2,outer=T,cex=0.75)
mtext("No Waste",side=2,at=0.585,line=2,outer=T,cex=0.75)
mtext("Waste",side=2,at=0.425,line=2,outer=T,cex=0.75)
mtext("No Waste",side=2,at=0.25,line=2,outer=T,cex=0.75)
mtext("Waste",side=2,at=0.085,line=2,outer=T,cex=0.75)
mtext("Viscosity = 0.5",side=4,at=0.85,line=1,outer=T)
mtext("Viscosity = 0.75",side=4,at=0.5,line=1,outer=T)
mtext("Viscosity = 1",side=4,at=0.15,line=1,outer=T)
mtext("Ticks",side=1,at=0.5,line=2,outer=T)
mtext("Population Level",side=3,font=2,line=3,outer=T)

dev.copy(png,file="../Images/ts_population_levels.png",height=1500,width=1500,units="px",res=150)
dev.off()
