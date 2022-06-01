library(ggplot2)
library(ggsignif)
library(cowplot)
library(DGCA)

#load data
dir = ""
# model = "hpcp_lhe_ncici_model1_s0-2"
model = "fcor_lhe_ncici_model1_s2-2"

Normal_pred_0_ppc = read.table(paste0(dir, model, "label_Normal_pred_0_topk_htk_blueppx.tsv"), sep = "\t", header = T)
Normal_pred_1_ppc = read.table(paste0(dir, model, "label_Normal_pred_1_topk_htk_blueppx.tsv"), sep = "\t", header = T)
Impaired_pred_0_ppc = read.table(paste0(dir, model, "label_Impaired_pred_0_topk_htk_blueppx.tsv"), sep = "\t", header = T)
Impaired_pred_1_ppc = read.table(paste0(dir, model, "label_Impaired_pred_1_topk_htk_blueppx.tsv"), sep = "\t", header = T)

# outlier removal
Normal_pred_0_ppc = Normal_pred_0_ppc[!Normal_pred_0_ppc$attent == "0000000", ]
Normal_pred_1_ppc = Normal_pred_1_ppc[!Normal_pred_1_ppc$attent == "0000000", ]
Impaired_pred_0_ppc = Impaired_pred_0_ppc[!Impaired_pred_0_ppc$attent == "0000000", ]
Impaired_pred_1_ppc = Impaired_pred_1_ppc[!Impaired_pred_1_ppc$attent == "0000000", ]

Normal_pred_0_ppc_slide_strong_ppix = tapply(Normal_pred_0_ppc$strong_ppix, Normal_pred_0_ppc$slide_id, median)
Normal_pred_1_ppc_slide_strong_ppix = tapply(Normal_pred_1_ppc$strong_ppix, Normal_pred_1_ppc$slide_id, median)
Impaired_pred_0_ppc_slide_strong_ppix = tapply(Impaired_pred_0_ppc$strong_ppix, Impaired_pred_0_ppc$slide_id, median)
Impaired_pred_1_ppc_slide_strong_ppix = tapply(Impaired_pred_1_ppc$strong_ppix, Impaired_pred_1_ppc$slide_id, median)

t.test(c(Normal_pred_0_ppc_slide_strong_ppix, Normal_pred_1_ppc_slide_strong_ppix),
  c(Impaired_pred_0_ppc_slide_strong_ppix, Impaired_pred_1_ppc_slide_strong_ppix))

strong_ppix_df = data.frame(strong_ppix = c(Normal_pred_0_ppc_slide_strong_ppix, Normal_pred_1_ppc_slide_strong_ppix,
  Impaired_pred_0_ppc_slide_strong_ppix, Impaired_pred_1_ppc_slide_strong_ppix),
  label = c(
    rep("Label Non-CI, Pred Non-CI", length(Normal_pred_0_ppc_slide_strong_ppix)),
    rep("Label Non-CI, Pred CI", length(Normal_pred_1_ppc_slide_strong_ppix)),
    rep("Label CI, Pred Non-CI", length(Impaired_pred_0_ppc_slide_strong_ppix)),
    rep("Label CI, Pred CI", length(Impaired_pred_1_ppc_slide_strong_ppix))),
  pred = c(
    rep("Non-CI", length(Normal_pred_0_ppc_slide_strong_ppix)),
    rep("CI", length(Normal_pred_1_ppc_slide_strong_ppix)),
    rep("Non-CI", length(Impaired_pred_0_ppc_slide_strong_ppix)),
    rep("CI", length(Impaired_pred_1_ppc_slide_strong_ppix))))

strong_ppix_plot = ggplot(strong_ppix_df, aes(x = label, y = strong_ppix)) +
  stat_summary(fun = "mean", fun.min = "mean", fun.max= "mean", size= 0.3, geom = "crossbar") +
  geom_jitter(strong_ppix_df, mapping = aes(x=label, y=strong_ppix, colour=pred), width=0.3, alpha=0.5) +
  scale_color_manual(values=c("#708090", "#808080")) +
  geom_signif(
    comparisons = list( c("Label CI, Pred CI","Label CI, Pred Non-CI"),
    c("Label Non-CI, Pred CI", "Label Non-CI, Pred Non-CI"),
    c("Label CI, Pred CI", "Label Non-CI, Pred Non-CI")),
    map_signif_level = TRUE, textsize = 6, step_increase = 0.13) + theme_bw() + ylim(NA, 65000) + #60000 for hpcp
    ylab("Median Dark Blue Pixels") + xlab("") +
    theme_bw() + theme(legend.position = "none") +
    theme(axis.text.x = element_blank())

Normal_pred_0_ppc_slide_ratio_strong_to_total = tapply(Normal_pred_0_ppc$ratio_strong_to_total, Normal_pred_0_ppc$slide_id, median)
Normal_pred_1_ppc_slide_ratio_strong_to_total = tapply(Normal_pred_1_ppc$ratio_strong_to_total, Normal_pred_1_ppc$slide_id, median)
Impaired_pred_0_ppc_slide_ratio_strong_to_total = tapply(Impaired_pred_0_ppc$ratio_strong_to_total, Impaired_pred_0_ppc$slide_id, median)
Impaired_pred_1_ppc_slide_ratio_strong_to_total = tapply(Impaired_pred_1_ppc$ratio_strong_to_total, Impaired_pred_1_ppc$slide_id, median)

t.test(c(Normal_pred_0_ppc_slide_ratio_strong_to_total, Normal_pred_1_ppc_slide_ratio_strong_to_total),
  c(Impaired_pred_1_ppc_slide_ratio_strong_to_total, Impaired_pred_1_ppc_slide_ratio_strong_to_total))

t.test(c(Normal_pred_0_ppc_slide_ratio_strong_to_total, Normal_pred_1_ppc_slide_ratio_strong_to_total),
  c(Impaired_pred_1_ppc_slide_ratio_strong_to_total, Impaired_pred_1_ppc_slide_ratio_strong_to_total))$p.value

ratio_strong_ppix_df = data.frame(ratio_ppix = c(Normal_pred_0_ppc_slide_ratio_strong_to_total, Normal_pred_1_ppc_slide_ratio_strong_to_total,
  Impaired_pred_0_ppc_slide_ratio_strong_to_total, Impaired_pred_1_ppc_slide_ratio_strong_to_total),
  label = c(
    rep("Label Non-CI, Pred Non-CI", length(Normal_pred_0_ppc_slide_ratio_strong_to_total)),
    rep("Label Non-CI, Pred CI", length(Normal_pred_1_ppc_slide_ratio_strong_to_total)),
    rep("Label CI, Pred Non-CI", length(Impaired_pred_0_ppc_slide_ratio_strong_to_total)),
    rep("Label CI, Pred CI", length(Impaired_pred_1_ppc_slide_ratio_strong_to_total))),
    pred = c(
      rep("Non-CI", length(Normal_pred_0_ppc_slide_ratio_strong_to_total)),
      rep("CI", length(Normal_pred_1_ppc_slide_ratio_strong_to_total)),
      rep("Non-CI", length(Impaired_pred_0_ppc_slide_ratio_strong_to_total)),
      rep("CI", length(Impaired_pred_1_ppc_slide_ratio_strong_to_total))),
      strong_ppix = c(Normal_pred_0_ppc_slide_strong_ppix, Normal_pred_1_ppc_slide_strong_ppix,
        Impaired_pred_0_ppc_slide_strong_ppix, Impaired_pred_1_ppc_slide_strong_ppix))

cor.test(ratio_strong_ppix_df$ratio_ppix, ratio_strong_ppix_df$strong_ppix, method = "spearman")

ratio_strong_ppix_plot = ggplot(ratio_strong_ppix_df, aes(x = label, y = ratio_ppix)) +
  stat_summary(fun = "mean", fun.min = "mean", fun.max= "mean", size= 0.3, geom = "crossbar") +
  geom_jitter(ratio_strong_ppix_df, mapping = aes(x=label, y=ratio_ppix, colour=pred), width=0.3, alpha=0.5) +
  scale_color_manual(values=c("#708090", "#808080")) +
  geom_signif(
    comparisons = list( c("Label CI, Pred CI","Label CI, Pred Non-CI"),
    c("Label Non-CI, Pred CI", "Label Non-CI, Pred Non-CI"),
    c("Label CI, Pred CI", "Label Non-CI, Pred Non-CI")),
    map_signif_level = TRUE, textsize = 6, step_increase = 0.13) + theme_bw() + ylim(0, 1.4) +
    ylab("Median Ratio Dark to Light Blue") + xlab("") +
    theme_bw() + theme(legend.position = "none") +
    theme(axis.text.x = element_blank())

strong_ratio_corrplot = ggplot(ratio_strong_ppix_df, aes(y = log(strong_ppix), x = ratio_ppix, colour = pred)) +
  geom_point(alpha=0.2) +
  geom_density_2d(geom="polygon", aes(fill = pred), bins = 5, alpha = 0.5) +
  scale_color_manual(values=c("#F39B7FFF", "#4DBBD5FF")) +
  theme_bw() + xlab("Median Ratio Dark to Light Blue") + ylab("Log Median Dark Blue Pixels") +
  labs(color = "Prediction") + guides(fill=guide_legend(title="Prediction")) +
  theme(legend.position="none") 

plot_grid(strong_ppix_plot, ratio_strong_ppix_plot, strong_ratio_corrplot, labels = NULL, ncol = 3, rel_widths = c(1, 1, 0.85))
