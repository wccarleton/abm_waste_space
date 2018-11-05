par(mfrow=c(6,3),mar=c(1,1,1,1),oma=c(4,5,5,2),family="serif",bg="white")
plotylabels <- c("No Waste","Waste","Waste Optim.")
plotxlabels <- c("SD = 1","SD = 3","SD = 5")
for(j in 1:18){
  if(j %in% setdiff(c(1:15),seq(1,16,3))){
    acf(pop_lvls_e[[j]][1,],
         pch=16,
         col=rgb(0,0,0,0.2),
         main=NA,
         ylab=NA,
         xaxt="n",
         yaxt="n",
         ylim=c(0,1),
         frame.plot=F)}
  else if(j %in% intersect(c(1:15),seq(1,16,3))){
    acf(pop_lvls_e[[j]][1,],
         pch=16,
         col=rgb(0,0,0,0.2),
         main=NA,
         ylab=NA,
         xaxt="n",
         ylim=c(0,1),
         frame.plot=F)}
  else if(j %in% c(17,18)){
    acf(pop_lvls_e[[j]][1,],
         pch=16,
         col=rgb(0,0,0,0.2),
         main=NA,
         ylab=NA,
         yaxt="n",
         ylim=c(0,1),
         frame.plot=F)}
  else{
    acf(pop_lvls_e[[j]][1,],
        pch=16,
        col=rgb(0,0,0,0.2),
        main=NA,
        ylab=NA,
        ylim=c(0,1),
        frame.plot=F)}
}

mtext("Climate SD = 1",side=3,at=0.15,line=1,outer=T)
mtext("Climate SD = 3",side=3,at=0.5,line=1,outer=T)
mtext("Climate SD = 5",side=3,at=0.85,line=1,outer=T)
mtext("No Waste",side=2,at=0.915,line=1,outer=T,cex=0.75)
mtext("Waste",side=2,at=0.75,line=1,outer=T,cex=0.75)
mtext("No Waste",side=2,at=0.585,line=1,outer=T,cex=0.75)
mtext("Waste",side=2,at=0.425,line=1,outer=T,cex=0.75)
mtext("No Waste",side=2,at=0.25,line=1,outer=T,cex=0.75)
mtext("Waste",side=2,at=0.085,line=1,outer=T,cex=0.75)
mtext("Move = 0.5",side=4,at=0.85,line=1,outer=T)
mtext("Move = 0.1",side=4,at=0.5,line=1,outer=T)
mtext("Move = 0.01",side=4,at=0.15,line=1,outer=T)
mtext("Lags",side=1,at=0.5,line=2,outer=T)
mtext("Correlation",side=2,at=0.5,line=2,outer=T)
mtext("Autocorrelation Function Plots",side=3,font=2,line=3,outer=T)
dev.copy(png,file="../Images/acfplot.png",height=2000,width=2000,units="px",res=250)
dev.off()
