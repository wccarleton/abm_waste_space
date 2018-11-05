headings <- c("experiment",
            "pop_sd",
            "waste_prob")
write.table(file="../Results/Analysis/Stationarity/adftests_stationary_trend_move.csv",
            t(headings),
            col.names=F,
            row.names=F,
            sep=",")
for(j in 1:18){
   expname <- j
   adf_pop_sd <- adfTest(pop_lvls_params[[j]][2,],type="c")@test$p.value
   adf_waste_prob <- adfTest(waste_prob_params[[j]][1,],type="c")@test$p.value
   #population <- adf.test(pop_lvls_params[[j]][1,],k=1,alternative="explosive")$p.value
   #waste_prob <- adf.test(waste_prob_params[[j]][1,],k=1,alternative="explosive")$p.value
   #waste_rate <- adf.test(waste_rate_params[[j]][1,],k=1,alternative="explosive")$p.value
   pvals <- c(expname,
               adf_pop_sd,
               adf_waste_prob)
   write.table(file="../Results/Analysis/Stationarity/adftests_stationary_trend_move.csv",
               t(pvals),
               append=T,
               col.names=F,
               row.names=F,
               sep=",")
}
