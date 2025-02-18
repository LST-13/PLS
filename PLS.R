##PLS.SEM
aa <- read.csv("E:/桌面/SEM.P.csv")
library(plspm)
df=scale(aa[,4:17],center = T,scale = T)
P <- c(0,0,0,0,0)
PC <- c(1,0,0,0,0)
AN <- c(1,1,0,0,0)
MB <- c(1,1,1,0,0)
E <- c(1,1,1,1,0)
fix_path <- rbind(P,PC,AN,MB,E)
fix_blocks = list(c(4,5),c(3,6),c(7,8),c(1,2),c(9,10,11,12,13,14))
fix_blocks = list(1,2,3,4,5,6,7,c(8,9))
fix_modes = rep("A",5)
fix_pls = plspm(df,fix_path,fix_blocks,modes = fix_modes)
innerplot(fix_pls,colpos = 'red',colneg = 'blue',show.values = T,lcol = 'gray20',box.lwd = 0)
summary(fix_pls)
#显著性p值
fix_pls$inner_model
#拟合系数
fix_pls$gof
