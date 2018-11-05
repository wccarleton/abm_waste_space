#because of interactions, we look at each Climate SD level separately
pt_pop_lvl_sd <- c()
pt_pop_lvl_sd_diff <- c()
climate_sd_comps <- list(c(1,3),c(3,5),c(1,5))
for(j in c(0.5,0.75,1)){
   for(k in c(0,1)){
      for(l in climate_sd_comps){
         x <- subset(pop_lvls_params_df,Viscosity==j & WasteCondition==k & ClimateCondition == l[1])[,"sd"]
         y <- subset(pop_lvls_params_df,Viscosity==j & WasteCondition==k & ClimateCondition == l[2])[,"sd"]
         pval <- t.test(x,
                        y,
                        alternative="less",
                        var.equal=F)$p.value
         mean_diffs <- mean(x)-mean(y)
         pt_pop_lvl_sd_diff <- c(pt_pop_lvl_sd_diff,mean_diffs)
         pt_pop_lvl_sd <- c(pt_pop_lvl_sd,pval)
      }
   }
}
#export results
pt_pvals <- data.frame("viscosity"=rep(c(0.5,0.75,1),each=6),
                  "waste"=rep(c(0,0,0,1,1,1),3),
                  "comparison"=rep(c("1_3","3_5","1_5"),6),
                  "pvals"=pt_pop_lvl_sd,
                  "diffs"=pt_pop_lvl_sd_diff)

write.table(pt_pvals,file="../Results/Analysis/TTests/pt_pvals_pop_lvls_sd_viscosity_climate_test.csv",sep=",")
