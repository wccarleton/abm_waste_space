par(mfrow=c(6,3),mar=c(1,1,1,1),oma=c(4,4,5,4),family="serif",bg="white")
exps <- c("exp46",
"exp47",
"exp48",
"exp49",
"exp50",
"exp51",
"exp52",
"exp53",
"exp54",
"exp55",
"exp56",
"exp57",
"exp58",
"exp59",
"exp60",
"exp61",
"exp62",
"exp63")
plotylabels <- c("No Waste","Waste","Waste Optim.")
plotxlabels <- c("SD = 1","SD = 3","SD = 5")
for(j in exps){
   print(j)
   xaxtswitch=which(exps==j)
   yaxtswitch=xaxtswitch%%3
   matts <- matrix(as.numeric(waste_ts_move[which(waste_ts_move[,"experiment"]==j),c(5)]),nrow=500,byrow=F)
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
         ylim=c(0,0.7))
   lines(1:500,rowMeans(matts,na.rm=T),col="white")
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
mtext("Move = 0.5",side=4,at=0.85,line=1,outer=T)
mtext("Move = 0.1",side=4,at=0.5,line=1,outer=T)
mtext("Move = 0.01",side=4,at=0.15,line=1,outer=T)
mtext("Ticks",side=1,at=0.5,line=2,outer=T)
mtext("Propensity for Waste",side=3,font=2,line=3,outer=T)

dev.copy(png,file="../Images/ts_waste_prop_2.png",height=1500,width=1500,units="px",res=150)
dev.off()
