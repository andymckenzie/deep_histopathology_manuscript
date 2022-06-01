
library(ggplot2)
library(bayesbio)
library(corrplot)
library(DGCA)
library(cowplot)

#load data
fcor_lhe_res = read.csv("")
hpcp_lhe_res = read.csv("")

mean(hpcp_lhe_res$test_auc)
mean(hpcp_lhe_res$test_acc)

mean(fcor_lhe_res$test_auc)
mean(fcor_lhe_res$test_acc)

#best performing model selection
hpcp_lhe_res$mean_auc_acc = rowMeans(hpcp_lhe_res[,colnames(hpcp_lhe_res) %in% c("test_auc", "test_acc")])
hpcp_lhe_res[order(-hpcp_lhe_res$mean_auc_acc), ]
fcor_lhe_res$mean_auc_acc = rowMeans(fcor_lhe_res[,colnames(fcor_lhe_res) %in% c("test_auc", "test_acc")])
fcor_lhe_res[order(-fcor_lhe_res$mean_auc_acc), ]

#wilcox tests
wilcox.test(hpcp_lhe_res$test_auc, mu = 0.5)
wilcox.test(hpcp_lhe_res$test_acc, mu = 0.5)

wilcox.test(fcor_lhe_res$test_auc, mu = 0.5)
wilcox.test(fcor_lhe_res$test_acc, mu = 0.5)

res_auc_plot = data.frame(
  auc = c(hpcp_lhe_res$test_auc, fcor_lhe_res$test_auc),
  group = c(rep("Hippocampus", 10), rep("Frontal Cortex", 10)))

auc_ggplot = ggplot(res_auc_plot, aes(x=group, y=auc)) +
stat_summary(fun = "mean", fun.min = "mean", fun.max= "mean", size= 0.3, geom = "crossbar") +
  geom_jitter(res_auc_plot, mapping = aes(x=group, y=auc, colour=group), width=0.1, size=4, alpha=1/2) +
  ylab("AUC")  + geom_hline(yintercept=0.5, linetype = "dotted") +   theme_bw() + xlab("") +
  scale_color_manual(values=c("#708090", "#808080")) + scale_x_discrete(limits=c("Hippocampus", "Frontal Cortex")) +
  theme(legend.position = "none") + ylim(c(0.4, 0.8))

res_acc_plot = data.frame(
  acc = c(hpcp_lhe_res$test_acc, fcor_lhe_res$test_acc),
  group = c(rep("Hippocampus", 10), rep("Frontal Cortex", 10)))

acc_ggplot = ggplot(res_acc_plot, aes(x=group, y=acc)) +
stat_summary(fun = "mean", fun.min = "mean", fun.max= "mean", size= 0.3, geom = "crossbar") +
  geom_jitter(res_acc_plot, mapping = aes(x=group, y=acc, colour=group), width=0.1, size=4, alpha=1/2) +
  ylab("Balanced Accuracy")  + geom_hline(yintercept=0.5, linetype = "dotted") +   theme_bw() + xlab("") +
    scale_color_manual(values=c("#708090", "#808080")) + scale_x_discrete(limits=c("Hippocampus", "Frontal Cortex")) +
  theme(legend.position = "none") + ylim(c(0.4, 0.8))

plot_grid(auc_ggplot, acc_ggplot, ncol = 2)
