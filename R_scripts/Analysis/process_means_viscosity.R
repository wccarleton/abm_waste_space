pop_lvls <- lapply(28:45,function(j){
   exps <- paste("exp",j,sep="")
   matrix(waste_ts_viscosity[which(waste_ts_viscosity[,"experiment"]==exps),4],nrow=500)
   })

pop_lvls_e <- lapply(pop_lvls,function(k){
   mus <- apply(k,1,MLENormParams)
   return(mus)
})

pop_lvls_params <- lapply(pop_lvls,function(k){
   mus <- apply(k,1,MLENormParams)
   return(mus)
})

waste_prob <- lapply(28:45,function(j){
   exps <- paste("exp",j,sep="")
   matrix(as.numeric(waste_ts_viscosity[which(waste_ts_viscosity[,"experiment"]==exps),5]),nrow=500)
   })
#
waste_prob_params <- lapply(waste_prob,function(k){
   mus <- apply(k,1,MLENormParams)
   return(mus)
})

waste_rate <- lapply(28:45,function(j){
   exps <- paste("exp",j,sep="")
   matrix(waste_ts_viscosity[which(waste_ts_viscosity[,"experiment"]==exps),6],nrow=500)
   })
#
waste_rate_params <- lapply(waste_rate,function(k){
   mus <- apply(k,1,MLENormParams)
   return(mus)
})
