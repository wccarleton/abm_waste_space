#because of interactions, we look at each Climate SD level separately
pt_waste_prob <- c()
pt_waste_prob_diff <- c()
for(j in c(1,3,5)){
   for(k in c(0.5,0.75,1)){
      x <- subset(waste_prob_params_df,ClimateCondition==j & Viscosity==k & WasteCondition==0)[,"expectation"]
      y <- subset(waste_prob_params_df,ClimateCondition==j & Viscosity==k & WasteCondition==1)[,"expectation"]
      pval <- t.test(x,
                     y,
                     alternative="less",
                     var.equal=F)$p.value
      mean_diffs <- mean(x)-mean(y)
      pt_waste_prob_diff <- c(pt_waste_prob_diff,mean_diffs)
      pt_waste_prob <- c(pt_waste_prob,pval)
   }
}
#export results
pt_pvals <- data.frame(climate=c("1","1","1","3","3","3","5","5","5"),
                  viscosity=c("0.5","0.75","1","0.5","0.75","1","0.5","0.75","1"),
                  "pvals"=pt_waste_prob,
                  "diffs"=pt_waste_prob_diff)

write.table(pt_pvals,file="../Results/Analysis/TTests/pt_pvals_waste_prob_viscosity.csv",sep=",")
