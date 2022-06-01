library(ggplot2)
library(cowplot)

#load data
roc_hpcp_lhe_s1 = read.csv("")
roc_fcor_lhe_s1 = read.csv("")

roc_hpcp_lhe_s1_X0 = data.frame(FPR = roc_hpcp_lhe_s1$X0_fpr, TPR = roc_hpcp_lhe_s1$X0_tpr)
roc_hpcp_lhe_s1_X0 = roc_hpcp_lhe_s1_X0[!is.na(roc_hpcp_lhe_s1_X0$TPR), ]
roc_hpcp_lhe_s1_X0$iteration = rep("X0", nrow(roc_hpcp_lhe_s1_X0))

roc_hpcp_lhe_s1_X1 = data.frame(FPR = roc_hpcp_lhe_s1$X1_fpr, TPR = roc_hpcp_lhe_s1$X1_tpr)
roc_hpcp_lhe_s1_X1 = roc_hpcp_lhe_s1_X1[!is.na(roc_hpcp_lhe_s1_X1$TPR), ]
roc_hpcp_lhe_s1_X1$iteration = rep("X1", nrow(roc_hpcp_lhe_s1_X1))

roc_hpcp_lhe_s1_X2 = data.frame(FPR = roc_hpcp_lhe_s1$X2_fpr, TPR = roc_hpcp_lhe_s1$X2_tpr)
roc_hpcp_lhe_s1_X2 = roc_hpcp_lhe_s1_X2[!is.na(roc_hpcp_lhe_s1_X2$TPR), ]
roc_hpcp_lhe_s1_X2$iteration = rep("X2", nrow(roc_hpcp_lhe_s1_X2))

roc_hpcp_lhe_s1_X3 = data.frame(FPR = roc_hpcp_lhe_s1$X3_fpr, TPR = roc_hpcp_lhe_s1$X3_tpr)
roc_hpcp_lhe_s1_X3 = roc_hpcp_lhe_s1_X3[!is.na(roc_hpcp_lhe_s1_X3$TPR), ]
roc_hpcp_lhe_s1_X3$iteration = rep("X3", nrow(roc_hpcp_lhe_s1_X3))

roc_hpcp_lhe_s1_X4 = data.frame(FPR = roc_hpcp_lhe_s1$X4_fpr, TPR = roc_hpcp_lhe_s1$X4_tpr)
roc_hpcp_lhe_s1_X4 = roc_hpcp_lhe_s1_X4[!is.na(roc_hpcp_lhe_s1_X4$TPR), ]
roc_hpcp_lhe_s1_X4$iteration = rep("X4", nrow(roc_hpcp_lhe_s1_X4))

roc_hpcp_lhe_s1_X5 = data.frame(FPR = roc_hpcp_lhe_s1$X5_fpr, TPR = roc_hpcp_lhe_s1$X5_tpr)
roc_hpcp_lhe_s1_X5 = roc_hpcp_lhe_s1_X5[!is.na(roc_hpcp_lhe_s1_X5$TPR), ]
roc_hpcp_lhe_s1_X5$iteration = rep("X5", nrow(roc_hpcp_lhe_s1_X5))

roc_hpcp_lhe_s1_X6 = data.frame(FPR = roc_hpcp_lhe_s1$X6_fpr, TPR = roc_hpcp_lhe_s1$X6_tpr)
roc_hpcp_lhe_s1_X6 = roc_hpcp_lhe_s1_X6[!is.na(roc_hpcp_lhe_s1_X6$TPR), ]
roc_hpcp_lhe_s1_X6$iteration = rep("X6", nrow(roc_hpcp_lhe_s1_X6))

roc_hpcp_lhe_s1_X7 = data.frame(FPR = roc_hpcp_lhe_s1$X7_fpr, TPR = roc_hpcp_lhe_s1$X7_tpr)
roc_hpcp_lhe_s1_X7 = roc_hpcp_lhe_s1_X7[!is.na(roc_hpcp_lhe_s1_X7$TPR), ]
roc_hpcp_lhe_s1_X7$iteration = rep("X7", nrow(roc_hpcp_lhe_s1_X7))

roc_hpcp_lhe_s1_X8 = data.frame(FPR = roc_hpcp_lhe_s1$X8_fpr, TPR = roc_hpcp_lhe_s1$X8_tpr)
roc_hpcp_lhe_s1_X8 = roc_hpcp_lhe_s1_X8[!is.na(roc_hpcp_lhe_s1_X8$TPR), ]
roc_hpcp_lhe_s1_X8$iteration = rep("X8", nrow(roc_hpcp_lhe_s1_X8))

roc_hpcp_lhe_s1_X9 = data.frame(FPR = roc_hpcp_lhe_s1$X9_fpr, TPR = roc_hpcp_lhe_s1$X9_tpr)
roc_hpcp_lhe_s1_X9 = roc_hpcp_lhe_s1_X9[!is.na(roc_hpcp_lhe_s1_X9$TPR), ]
roc_hpcp_lhe_s1_X9$iteration = rep("X9", nrow(roc_hpcp_lhe_s1_X9))

hpcp_roc_multiple_list = list(roc_hpcp_lhe_s1_X0, roc_hpcp_lhe_s1_X1, roc_hpcp_lhe_s1_X2,
  roc_hpcp_lhe_s1_X3, roc_hpcp_lhe_s1_X4, roc_hpcp_lhe_s1_X5, roc_hpcp_lhe_s1_X6,
  roc_hpcp_lhe_s1_X7, roc_hpcp_lhe_s1_X8, roc_hpcp_lhe_s1_X9)

roc_fcor_lhe_s1_X0 = data.frame(FPR = roc_fcor_lhe_s1$X0_fpr, TPR = roc_fcor_lhe_s1$X0_tpr)
roc_fcor_lhe_s1_X0 = roc_fcor_lhe_s1_X0[!is.na(roc_fcor_lhe_s1_X0$TPR), ]
roc_fcor_lhe_s1_X0$iteration = rep("X0", nrow(roc_fcor_lhe_s1_X0))

roc_fcor_lhe_s1_X1 = data.frame(FPR = roc_fcor_lhe_s1$X1_fpr, TPR = roc_fcor_lhe_s1$X1_tpr)
roc_fcor_lhe_s1_X1 = roc_fcor_lhe_s1_X1[!is.na(roc_fcor_lhe_s1_X1$TPR), ]
roc_fcor_lhe_s1_X1$iteration = rep("X1", nrow(roc_fcor_lhe_s1_X1))

roc_fcor_lhe_s1_X2 = data.frame(FPR = roc_fcor_lhe_s1$X2_fpr, TPR = roc_fcor_lhe_s1$X2_tpr)
roc_fcor_lhe_s1_X2 = roc_fcor_lhe_s1_X2[!is.na(roc_fcor_lhe_s1_X2$TPR), ]
roc_fcor_lhe_s1_X2$iteration = rep("X2", nrow(roc_fcor_lhe_s1_X2))

roc_fcor_lhe_s1_X3 = data.frame(FPR = roc_fcor_lhe_s1$X3_fpr, TPR = roc_fcor_lhe_s1$X3_tpr)
roc_fcor_lhe_s1_X3 = roc_fcor_lhe_s1_X3[!is.na(roc_fcor_lhe_s1_X3$TPR), ]
roc_fcor_lhe_s1_X3$iteration = rep("X3", nrow(roc_fcor_lhe_s1_X3))

roc_fcor_lhe_s1_X4 = data.frame(FPR = roc_fcor_lhe_s1$X4_fpr, TPR = roc_fcor_lhe_s1$X4_tpr)
roc_fcor_lhe_s1_X4 = roc_fcor_lhe_s1_X4[!is.na(roc_fcor_lhe_s1_X4$TPR), ]
roc_fcor_lhe_s1_X4$iteration = rep("X4", nrow(roc_fcor_lhe_s1_X4))

roc_fcor_lhe_s1_X5 = data.frame(FPR = roc_fcor_lhe_s1$X5_fpr, TPR = roc_fcor_lhe_s1$X5_tpr)
roc_fcor_lhe_s1_X5 = roc_fcor_lhe_s1_X5[!is.na(roc_fcor_lhe_s1_X5$TPR), ]
roc_fcor_lhe_s1_X5$iteration = rep("X5", nrow(roc_fcor_lhe_s1_X5))

roc_fcor_lhe_s1_X6 = data.frame(FPR = roc_fcor_lhe_s1$X6_fpr, TPR = roc_fcor_lhe_s1$X6_tpr)
roc_fcor_lhe_s1_X6 = roc_fcor_lhe_s1_X6[!is.na(roc_fcor_lhe_s1_X6$TPR), ]
roc_fcor_lhe_s1_X6$iteration = rep("X6", nrow(roc_fcor_lhe_s1_X6))

roc_fcor_lhe_s1_X7 = data.frame(FPR = roc_fcor_lhe_s1$X7_fpr, TPR = roc_fcor_lhe_s1$X7_tpr)
roc_fcor_lhe_s1_X7 = roc_fcor_lhe_s1_X7[!is.na(roc_fcor_lhe_s1_X7$TPR), ]
roc_fcor_lhe_s1_X7$iteration = rep("X7", nrow(roc_fcor_lhe_s1_X7))

roc_fcor_lhe_s1_X8 = data.frame(FPR = roc_fcor_lhe_s1$X8_fpr, TPR = roc_fcor_lhe_s1$X8_tpr)
roc_fcor_lhe_s1_X8 = roc_fcor_lhe_s1_X8[!is.na(roc_fcor_lhe_s1_X8$TPR), ]
roc_fcor_lhe_s1_X8$iteration = rep("X8", nrow(roc_fcor_lhe_s1_X8))

roc_fcor_lhe_s1_X9 = data.frame(FPR = roc_fcor_lhe_s1$X9_fpr, TPR = roc_fcor_lhe_s1$X9_tpr)
roc_fcor_lhe_s1_X9 = roc_fcor_lhe_s1_X9[!is.na(roc_fcor_lhe_s1_X9$TPR), ]
roc_fcor_lhe_s1_X9$iteration = rep("X9", nrow(roc_fcor_lhe_s1_X9))

fcor_roc_multiple_list = list(roc_fcor_lhe_s1_X0, roc_fcor_lhe_s1_X1, roc_fcor_lhe_s1_X2,
  roc_fcor_lhe_s1_X3, roc_fcor_lhe_s1_X4, roc_fcor_lhe_s1_X5, roc_fcor_lhe_s1_X6,
  roc_fcor_lhe_s1_X7, roc_fcor_lhe_s1_X8, roc_fcor_lhe_s1_X9)

# vertical average with linear interpolation
## citation: http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.10.9777

interpolate <- function(ROC_point1, ROC_point2, fpr_sample){
  slope = (ROC_point2$TPR - ROC_point1$TPR)/(ROC_point2$FPR - ROC_point1$FPR)
  return(ROC_point1$TPR + (slope * (fpr_sample - ROC_point1$FPR)))
}

tpr_for_fpr <- function(fpr_sample, roc){
  npoints = nrow(roc)
  k = 1
  while(k < npoints && roc[(k+1), "FPR"] < fpr_sample){
    k = k + 1
  }
  if(roc[k, "FPR"] == fpr_sample){
    return(roc[k, "TPR"])
  } else {
    return(interpolate(roc[k, ], roc[(k+1), ], fpr_sample))
  }
}

vertical_average_roc <- function(list_rocs, FPR_to_sample){
  tpr_average = tpr_se = vector()
  for(i in FPR_to_sample){
    tpr_sum = 0
    tpr_for_fpr_local = vector()
    for(j in 1:length(list_rocs)){
      tpr_for_fpr_res = tpr_for_fpr(i, list_rocs[[j]])
      tpr_for_fpr_local = c(tpr_for_fpr_local, tpr_for_fpr_res)
      tpr_sum = tpr_sum + tpr_for_fpr(i, list_rocs[[j]])
    }
    tpr_average = c(tpr_average, tpr_sum/length(list_rocs))
    tpr_se = c(tpr_se, sd(tpr_for_fpr_local))
  }
  return(list(tpr_average = tpr_average, tpr_se = tpr_se))
}

FPR_to_sample = seq(0,1,0.05)

average_roc_res_hpcp = vertical_average_roc(hpcp_roc_multiple_list, FPR_to_sample)
average_roc_res_df_hpcp = data.frame(TPR = average_roc_res_hpcp[["tpr_average"]], FPR = FPR_to_sample,
  TPR_sd_upper = average_roc_res_hpcp[["tpr_average"]] + average_roc_res_hpcp[["tpr_se"]],
  TPR_sd_lower = average_roc_res_hpcp[["tpr_average"]] - average_roc_res_hpcp[["tpr_se"]])

average_roc_res_df_hpcp$TPR_sd_lower = pmax(average_roc_res_df_hpcp$TPR_sd_lower, rep(0, nrow(average_roc_res_df_hpcp)))
average_roc_res_df_hpcp$TPR_sd_upper = pmin(average_roc_res_df_hpcp$TPR_sd_upper, rep(1, nrow(average_roc_res_df_hpcp)))

average_roc_res_df_hpcp_plot = ggplot(average_roc_res_df_hpcp, aes(y = TPR, x = 1 - FPR)) +
  geom_segment(aes(x = 0, y = 1, xend = 1,yend = 0), alpha = 0.5, linetype="dashed") +
  geom_line(color = "black") +
  geom_ribbon(aes(ymin=TPR_sd_lower, ymax=TPR_sd_upper), fill = "grey70", alpha = 0.5) +
  scale_x_reverse(name = "False Positive Rate",limits = c(1,0), labels=rev(c("0.0", "0.25", "0.5", "0.75", "1.0")), expand = c(0.001,0.001)) +
  scale_y_continuous(name = "True Positive Rate", limits = c(0,1), labels=c("0.0", "0.25", "0.5", "0.75", "1.0"), expand = c(0.001, 0.001)) +
  theme_bw() +
  theme(axis.ticks = element_line(color = "grey80"), plot.title = element_text(hjust = 0.5)) +
  coord_equal() + ggtitle("Hippocampus")

average_roc_res_fcor = vertical_average_roc(fcor_roc_multiple_list, FPR_to_sample)
average_roc_res_df_fcor = data.frame(TPR = average_roc_res_fcor[["tpr_average"]], FPR = FPR_to_sample,
  TPR_sd_upper = average_roc_res_fcor[["tpr_average"]] + average_roc_res_fcor[["tpr_se"]],
  TPR_sd_lower = average_roc_res_fcor[["tpr_average"]] - average_roc_res_fcor[["tpr_se"]])

average_roc_res_df_fcor$TPR_sd_lower = pmax(average_roc_res_df_fcor$TPR_sd_lower, rep(0, nrow(average_roc_res_df_fcor)))
average_roc_res_df_fcor$TPR_sd_upper = pmin(average_roc_res_df_fcor$TPR_sd_upper, rep(1, nrow(average_roc_res_df_fcor)))

average_roc_res_df_fcor_plot = ggplot(average_roc_res_df_fcor, aes(y = TPR, x = 1 - FPR)) +
  geom_segment(aes(x = 0, y = 1, xend = 1,yend = 0), alpha = 0.5, linetype="dashed") +
  geom_line(color = "black") +
  geom_ribbon(aes(ymin=TPR_sd_lower, ymax=TPR_sd_upper), fill = "grey70", alpha = 0.5) +
  scale_x_reverse(name = "False Positive Rate",limits = c(1,0), labels=rev(c("0.0", "0.25", "0.5", "0.75", "1.0")), expand = c(0.001,0.001)) +
  scale_y_continuous(name = "True Positive Rate", limits = c(0,1), labels=c("0.0", "0.25", "0.5", "0.75", "1.0"), expand = c(0.001, 0.001)) +
  theme_bw() +
  theme(axis.ticks = element_line(color = "grey80"), plot.title = element_text(hjust = 0.5)) +
  coord_equal() + ggtitle("Frontal Cortex")

plot_grid(average_roc_res_df_hpcp_plot, average_roc_res_df_fcor_plot, ncol = 2)
