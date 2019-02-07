library(readr)
library(reshape2)
library(ggplot2)
sample_dist <- read_delim("Dropbox/PLD_evolution_Louis/raw-data/Human_proteins/FUS-like_comp.txt",
"\t", escape_double = FALSE, col_names = FALSE,
trim_ws = TRUE)
colnames(sample_dist)=c("protein","A","C","D","E","F","G","H","I","K","L","M","N","P","Q","R","S","T","V","W","Y")
df = melt(sample_dist,id.vars = "protein")
ggplot(df, aes(protein,value)) + geom_bar(aes(fill = variable),position = "fill",stat = "identity") + scale_fill_manual(values = c('#e6194b', '#3cb44b', '#ffe119', '#4363d8', 
                                                                                                                                   '#f58231', '#911eb4', '#46f0f0', '#f032e6', 
                                                                                                                                   '#bcf60c', '#fabebe', '#008080', '#e6beff', 
                                                                                                                                   '#9a6324', '#fffac8', '#800000', '#aaffc3', 
                                                                                                                                   '#808000', '#ffd8b1', '#000075', '#808080', 
                                                                                                                                   '#ffffff', '#000000'))
