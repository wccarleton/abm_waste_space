experiments <- read.csv("../R_scripts/experiments.csv",head=T,as.is=T)
names(experiments) <- c("Experiment","Waste","Climate.SD","Viscosity")
experiments_500 <- as.data.frame(apply(experiments,2,function(d)rep(t(d),each=500)),stringsAsFactors=F)
experiments_500 <- data.frame(Exp=experiments_500$Experiment,
                           WasteCondition=as.numeric(experiments_500$Waste),
                           ClimateCondition=as.numeric(experiments_500$Climate.SD),
                           Viscosity=as.numeric(experiments_500$Viscosity))
temp <- do.call(rbind,lapply(pop_lvls_params,t))
pop_lvls_params_df <- data.frame(experiments_500,temp)
temp <- do.call(rbind,lapply(waste_prob_params,t))
waste_prob_params_df <- data.frame(experiments_500,temp)
