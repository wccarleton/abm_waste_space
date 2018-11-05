#because of interactions, we look at each Climate SD level separately
pt_pop_lvl_sd <- c()
pt_pop_lvl_sd_diff <- c()
for(j in c(1,3,5)){
   for(k in c(0.5,0.1,.01)){
      x <- subset(pop_lvls_params_df,ClimateCondition==j & Move==k & WasteCondition==0)[,"sd"]
      y <- subset(pop_lvls_params_df,ClimateCondition==j & Move==k & WasteCondition==1)[,"sd"]
      pval <- t.test(x,
                     y,
                     alternative="greater",
                     var.equal=F)$p.value
      mean_diffs <- mean(x)-mean(y)
      pt_pop_lvl_sd_diff <- c(pt_pop_lvl_sd_diff,mean_diffs)
      pt_pop_lvl_sd <- c(pt_pop_lvl_sd,pval)
   }
}
#export results
pt_pvals <- data.frame(climate=c("1","1","1","3","3","3","5","5","5"),
                  move=c("0.5","0.1",".01","0.5","0.1",".01","0.5","0.1",".01"),
                  "pvals"=pt_pop_lvl_sd,
                  "diffs"=pt_pop_lvl_sd_diff)

write.table(pt_pvals,file="../Results/Analysis/TTests/pt_pvals_pop_lvls_sd_move.csv",sep=",")
