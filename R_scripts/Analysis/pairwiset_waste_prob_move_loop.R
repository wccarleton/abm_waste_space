#because of interactions, we look at each Climate SD level separately
pt_waste_prob <- c()
pt_waste_prob_diff <- c()
climate_sd_comps <- list(c(1,3),c(3,5),c(1,5))
for(j in c(0.5,0.1,.01)){
   for(k in c(0,1)){
      for(l in climate_sd_comps){
         x <- subset(waste_prob_params_df,Move==j & WasteCondition==k & ClimateCondition == l[1])[,"expectation"]
         y <- subset(waste_prob_params_df,Move==j & WasteCondition==k & ClimateCondition == l[2])[,"expectation"]
         pval <- t.test(x,
                        y,
                        alternative="less",
                        var.equal=F)$p.value
         mean_diffs <- mean(x)-mean(y)
         pt_waste_prob_diff <- c(pt_waste_prob_diff,mean_diffs)
         pt_waste_prob <- c(pt_waste_prob,pval)
      }
   }
}
#export results
pt_pvals <- data.frame("move"=rep(c(0.5,0.1,.01),each=6),
                  "waste"=rep(c(0,0,0,1,1,1),3),
                  "comparison"=rep(c("1_3","3_5","1_5"),6),
                  "pvals"=pt_waste_prob,
                  "diffs"=pt_waste_prob_diff)

write.table(pt_pvals,file="../Results/Analysis/TTests/pt_pvals_waste_prob_move_climate.csv",sep=",")
