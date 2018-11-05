dataobjects <- list.files("../Results/Analysis/Summary/redo/Summary/")
waste_ts_move <- c()
for(j in dataobjects){
   waste_ts_move <- rbind(waste_ts_move,read.csv(file=paste("../Results/Analysis/Summary/redo/Summary/",j,sep=""),head=T))
}
