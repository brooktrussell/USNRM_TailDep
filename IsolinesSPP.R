#Produce bivariate isolines (as in Dan's paper) for US Northern Rockies SPP data

#first, load Dan's functions
source("~/Documents/CooleyIsolines.R")

#load SPP and precip data
load(file="~/Documents/SPPworkspace12142020.RData")
#load some summary stats
load(file="~/Downloads/SPPsummaryStat.RData")
#load bootstrap stuff from Palmetto
load(file="~/Documents/SPPbsList2.RData")

#table
library(xtable)
xtable(
matrix(c(245.4854,601.6795,1114.459,245.4854,601.6795,1114.459,0,14.55366,96.28352,0,14.55366,96.28352),nrow=3,ncol=4,byrow=FALSE)
)
\begin{table}[ht]
\centering
\begin{tabular}{rrrrr}
  \hline
 & 1 & 2 & 3 & 4 \\ 
  \hline
1 & 245.49 & 245.49 & 0.00 & 0.00 \\ 
  2 & 601.68 & 601.68 & 14.55 & 14.55 \\ 
  3 & 1114.46 & 1114.46 & 96.28 & 96.28 \\ 
   \hline
\end{tabular}
\end{table}



#plot descriptives for paper
pdf(file="~/Dropbox/SatPrecip/SummerPrecipPropSNOTEL.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(unlist(wy.summ.precip.prop.SNOTEL),unlist(id.summ.precip.prop.SNOTEL),unlist(mt.summ.precip.prop.SNOTEL)),add=TRUE,zlim=c(0,.5))
title(main="Empirical Precip Prop (SNOTEL)")
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Dropbox/SatPrecip/SummerPrecipPropPERSIANN.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(unlist(wy.summ.precip.prop.PERSIANN),unlist(id.summ.precip.prop.PERSIANN),unlist(mt.summ.precip.prop.PERSIANN)),add=TRUE,zlim=c(0,.5))
title(main="Empirical Precip Prop (PERSIANN)")
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()


pdf(file="~/Dropbox/SatPrecip/SummerPrecipPropRATIO.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), 
	c(unlist(wy.summ.precip.prop.SNOTEL)/unlist(wy.summ.precip.prop.PERSIANN),
		unlist(id.summ.precip.prop.SNOTEL)/unlist(id.summ.precip.prop.PERSIANN),
		unlist(mt.summ.precip.prop.SNOTEL)/unlist(mt.summ.precip.prop.PERSIANN)),
	add=TRUE,
	zlim=c(.7,2.3),
	col=two.colors(n=51, start="blue", end="red", middle="navajowhite2",alpha=1.0)[20:51])
	#col=two.colors(n=500, start="blue", end="red", middle="navajowhite2",alpha=1.0)[155:500])
	#col=two.colors(n=500, start="midnightblue", end="orangered4", middle="navajowhite2",alpha=1.0)[100:480])
	#col=tim.colors(n=256)[154:256])
title(main="Empirical Precip Prop Ratio")
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Dropbox/SatPrecip/SummerPrecipMeanSNOTEL.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(unlist(wy.summ.precip.mean.SNOTEL),unlist(id.summ.precip.mean.SNOTEL),unlist(mt.summ.precip.mean.SNOTEL)),add=TRUE,zlim=c(0,13))
title(main="Mean Positive Precip  (SNOTEL)")
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()


pdf(file="~/Dropbox/SatPrecip/SummerPrecipQ75PERSIANN.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(wy.summ.precip.q75.PERSIANN,id.summ.precip.q75.PERSIANN,mt.summ.precip.q75.PERSIANN),add=TRUE,zlim=c(0,15.5))#zlim=c(0,8.5))
title(main="0.75 Quantile of Positive Precip (PERSIANN)")
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()


pdf(file="~/Dropbox/SatPrecip/SummerPrecipMeanRATIO.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), 
	c(unlist(wy.summ.precip.mean.SNOTEL)/unlist(wy.summ.precip.mean.PERSIANN),
		unlist(id.summ.precip.mean.SNOTEL)/unlist(id.summ.precip.mean.PERSIANN),
		unlist(mt.summ.precip.mean.SNOTEL)/unlist(mt.summ.precip.mean.PERSIANN)),
	add=TRUE,zlim=c(.5,1.6),
	col=two.colors(n=51, start="blue", end="red", middle="navajowhite2",alpha=1.0)[2:51])
	#col=two.colors(n=500, start="midnightblue", end="orangered4", middle="navajowhite2",alpha=1.0)[20:500])
	#col=two.colors(n=500, start="black", end="darkred", middle="orangered1",alpha=1.0)[1:500])
title(main="Empirical Precip Ratio of Means")
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()


pdf(file="~/Dropbox/SatPrecip/SummerPrecipQ75RATIO.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), 
	c(unlist(wy.summ.precip.q75.SNOTEL)/unlist(wy.summ.precip.q75.PERSIANN),
		unlist(id.summ.precip.q75.SNOTEL)/unlist(id.summ.precip.q75.PERSIANN),
		unlist(mt.summ.precip.q75.SNOTEL)/unlist(mt.summ.precip.q75.PERSIANN)),
	add=TRUE,zlim=c(.42,1.55),
	col=two.colors(n=51, start="blue", end="red", middle="navajowhite2",alpha=1.0)[1:48])
	#col=two.colors(n=500, start="midnightblue", end="orangered4", middle="navajowhite2",alpha=1.0)[20:500])
title(main="Empirical Precip Ratio of 0.75 Quantiles")
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()


pdf(file="~/Dropbox/SatPrecip/SummerPrecipQ95RATIO.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), 
	c(unlist(wy.summ.precip.q95.SNOTEL)/unlist(wy.summ.precip.q95.PERSIANN),
		unlist(id.summ.precip.q95.SNOTEL)/unlist(id.summ.precip.q95.PERSIANN),
		unlist(mt.summ.precip.q95.SNOTEL)/unlist(mt.summ.precip.q95.PERSIANN)),
	add=TRUE,zlim=c(.42,2.77),
	col=two.colors(n=51, start="blue", end="red", middle="navajowhite2",alpha=1.0)[18:51])
	#col=two.colors(n=500, start="midnightblue", end="orangered4", middle="navajowhite2",alpha=1.0)[20:500])
title(main="Empirical Precip Ratio of 0.95 Quantiles")
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Dropbox/SatPrecip/SummerPrecipQ95PERSIANN.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(wy.summ.precip.q95.PERSIANN,id.summ.precip.q95.PERSIANN,mt.summ.precip.q95.PERSIANN),add=TRUE,zlim=c(0,49))#zlim=c(0,29))
title(main="0.95 Quantile of Positive Precip (PERSIANN)")
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()


pdf(file="~/Dropbox/SatPrecip/SummerPrecipQ75SNOTEL.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(wy.summ.precip.q75.SNOTEL,id.summ.precip.q75.SNOTEL,mt.summ.precip.q75.SNOTEL),add=TRUE,zlim=c(0,15.5))
title(main="0.75 Quantile of Positive Precip (SNOTEL)")
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()


pdf(file="~/Dropbox/SatPrecip/SummerPrecipQ95SNOTEL.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(wy.summ.precip.q95.SNOTEL,id.summ.precip.q95.SNOTEL,mt.summ.precip.q95.SNOTEL),add=TRUE,zlim=c(0,49))
title(main="0.95 Quantile of Positive Precip (SNOTEL)")
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Dropbox/SatPrecip/SummerPrecipMeanPERSIANN.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(unlist(wy.summ.precip.mean.PERSIANN),unlist(id.summ.precip.mean.PERSIANN),unlist(mt.summ.precip.mean.PERSIANN)),add=TRUE,zlim=c(0,13))
title(main="Mean Positive Precip (PERSIANN)")
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Dropbox/SatPrecip/SummerPrecipKendallTau.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(unlist(wy.summ.tau),unlist(id.summ.tau),unlist(mt.summ.tau)),add=TRUE,zlim=c(0,.5))
title(main="Kendall's Tau")
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

max(c(unlist(wy.summ.tau.pval),unlist(id.summ.tau.pval),unlist(mt.summ.tau.pval)))
#0.04294641



pdf(file="~/Dropbox/SatPrecip/SummerPrecipChi.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)),add=TRUE,zlim=c(0,.41))
title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

max(c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)))
# 0.4042553


# --------------------------
# loop through all stations (start)
# --------------------------
qtile.se.mat <- matrix(NA,261,4)
qtile.mat <- matrix(NA,261,4)
qtile.ci.025 <- matrix(NA,261,4)
qtile.ci.975 <- matrix(NA,261,4)
for (stn in 1:261){
  vals <- SPPbsList[[stn]]$vals
  vals.qtiles <- SPPbsList[[stn]]$vals.qtiles
  qtile.se.mat[stn,] <- SPPbsList[[stn]]$qtile.se
  qtile.mat[stn,] <- c(approx(vals[1,],vals[2,],xout=.25)$y, approx(vals[1,],vals[2,],xout=.5)$y, approx(vals[1,],vals[2,],xout=.75)$y, approx(vals[1,],vals[2,],xout=.95)$y)
  qtile.ci.025[stn,] <- c(apply(vals.qtiles,2,function(x){quantile(na.omit(x),c(.025))}))
  qtile.ci.975[stn,] <- c(apply(vals.qtiles,2,function(x){quantile(na.omit(x),c(.975))}))
}#end stn loop
# --------------------------
# loop through all stations (end)
# --------------------------

pdf(file="~/Documents/qtile25.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.mat[,1]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Documents/qtile50.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.mat[,2]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Documents/qtile75.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.mat[,3]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Documents/qtile95.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.mat[,4]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Documents/qtile25se.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.se.mat[,1]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Documents/qtile50se.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.se.mat[,2]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Documents/qtile75se.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.se.mat[,3]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Documents/qtile95se.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.se.mat[,4]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Documents/lwr25.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.ci.025[,1]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Documents/lwr50.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.ci.025[,2]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Documents/lwr75.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.ci.025[,3]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Documents/lwr95.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.ci.025[,4]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Documents/upr25.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.ci.975[,1]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Documents/upr50.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.ci.975[,2]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Documents/upr75.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.ci.975[,3]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()

pdf(file="~/Documents/upr95.pdf")
#map('state',c("wyoming","montana","idaho"))
map('state',c("wyoming","montana","idaho"),mar = c(4.1, 4.1, 12, 0.1))
quilt.plot(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat), c(qtile.ci.975[,4]),add=TRUE)
#title(main=expression(hat(chi)))
map('state',c("wyoming","montana","idaho"),add=TRUE)
dev.off()


#---------------------------
#try Wyoming 1
#---------------------------
trash <- c(wy.data.list,id.data.list,mt.data.list)
dat <- trash[[3]];summ.dat <- subset(dat,dat$mnth.pers>=6 & dat$mnth.pers<=8)
new.mat <- na.omit(summ.dat[,c(2,7:10)])

scatterhist(new.mat$pers.vec,25.4*new.mat$Precipitation.Increment..in.,
	"                                                PERSIANN",
	"                                                SNOTEL")

IDstationOut <- xContours(dat = cbind(new.mat$pers.vec,25.4*new.mat$Precipitation.Increment..in.), 
					mar1Prop=.05, mar2Prop=.05, mar1Width=.025, mar2Width=.025, baseContourLevel=.01,
					projContourLevels = seq(.01,.0001,length=150), gridSize = 250)

plotOrig(IDstationOut,xlim=c(0,50),ylim=c(0,50),xlab="PERSIANN",ylab="SNOTEL")
marg.qtile <- max(IDstationOut$contourOrig[,1])
vals <- condQtile(IDstationOut,marg.qtile,margProb=.01)#use estimated marginal .99 quantile of 13.132
plot(vals[2,],vals[1,],type="l",ylim=c(0,1),xlab="Precip (mm)",ylab="")

B <- 1
vals.arr <- array(NA,c(2,150,B))
vals.qtiles <- matrix(NA,B,4)#save estimated .25, .5, .75, and .95 quantiles

set.seed(1)
for (b in 1:B){
  boot.inds <- sample(1:nrow(new.mat),rep=TRUE)
  try(BSstationOut <- xContours(dat = (cbind(new.mat$pers.vec,25.4*new.mat$Precipitation.Increment..in.))[boot.inds,], 
					mar1Prop=.05, mar2Prop=.05, mar1Width=.025, mar2Width=.025, baseContourLevel=.01,
					projContourLevels = seq(.01,.0001,length=150), gridSize = 250),silent=TRUE)
  try(marg.val <- max(BSstationOut$contourOrig[,1]),silent=TRUE)
  try(vals.arr[,,b] <- condQtile(BSstationOut,marg.val,margProb=.01),silent=TRUE)
  try(vals.qtiles[b,] <- c(approx(vals.arr[1,,b],vals.arr[2,,b],xout=.25)$y, approx(vals.arr[1,,b],vals.arr[2,,b],xout=.5)$y, approx(vals.arr[1,,b],vals.arr[2,,b],xout=.75)$y, approx(vals.arr[1,,b],vals.arr[2,,b],xout=.95)$y),silent=TRUE)
  try(rm(marg.val,BSstationOut),silent=TRUE)
  if (b %% 10 == 0){print(b)}
}#
plotOrig(BSstationOut,xlim=c(0,50),ylim=c(0,50),xlab="PERSIANN",ylab="SNOTEL");abline(v=marg.val)

for (b in 1:B){try(lines(vals.arr[2,,b],vals.arr[1,,b],col="lightgray",lty=2))}#relies on bootstraps
lines(vals[2,],vals[1,])


#for (b in 1:B){if (is.na(vals.arr[,,b])){print(which(is.na(vals.arr[2,,b])))}}
#use output from Palmetto

pdf(w=11,h=5.5,file="~/Documents/IDstnEstCondCDFwBS.pdf")
stn <- 109#ID station in analysis
#stn <- 242#MT station in analysis
B <- 1500
vals <- SPPbsList[[stn]]$vals
vals.arr <- SPPbsList[[stn]]$vals.arr
vals.qtiles <- SPPbsList[[stn]]$vals.qtiles
plot(c(0,vals[2,2:150]),c(vals[1,]),type="l",ylim=c(0,1),xlab="Precip (mm)",ylab="Estimated Conditional CDF")
for (b in 1:B){
    if (any(is.na(vals.arr[,2:150,b]))==FALSE & any(diff(vals.arr[2,2:150,b])<0)==FALSE){
    try(lines(c(0,vals.arr[2,2:150,b],5*max(na.omit(vals.arr[2,,b]))),c(vals.arr[1,,b],1),col="lightgray",lty=1))
      }
}#relies on bootstraps
lines(c(0,vals[2,2:150],5*max(na.omit(vals[2,2:150]))),c(vals[1,],1))
dev.off()
#conditional quantile estimates
c(approx(vals[1,],vals[2,],xout=.25)$y, approx(vals[1,],vals[2,],xout=.5)$y, approx(vals[1,],vals[2,],xout=.75)$y, approx(vals[1,],vals[2,],xout=.95)$y)
#  9.799007 18.419378 31.160215 46.618699
#BS SEs
apply(vals.qtiles,2,function(x){sd(na.omit(x))})
# 4.284881 4.569362 3.930859 5.968820
#Get BS percentile CIs
apply(vals.qtiles,2,function(x){quantile(na.omit(x),c(.025,.975))})
# 2.5%   3.860152  9.180319 21.62830 31.14460
# 97.5% 18.823566 26.322613 36.55087 56.70245

pdf(w=11,h=5.5,file="~/Documents/MTstnEstCondCDFwBS.pdf")#this plot has one weird BS est (omit it)
#stn <- 109#ID station in analysis
stn <- 242#MT station in analysis
B <- 1500
vals <- SPPbsList[[stn]]$vals
vals.arr <- SPPbsList[[stn]]$vals.arr
vals.qtiles <- SPPbsList[[stn]]$vals.qtiles
plot(c(0,vals[2,2:150]),c(vals[1,]),type="l",ylim=c(0,1),xlab="Precip (mm)",ylab="Estimated Conditional CDF")
for (b in 1:B){
    if (any(is.na(vals.arr[,2:150,b]))==FALSE){
    try(lines(c(0,vals.arr[2,2:150,b],5*max(na.omit(vals.arr[2,,b]))),c(vals.arr[1,,b],1),col="lightgray",lty=1))
      }
}#relies on bootstraps
lines(c(0,vals[2,2:150],5*max(na.omit(vals[2,2:150]))),c(vals[1,],1))
dev.off()
#conditional quantile estimates
c(approx(vals[1,],vals[2,],xout=.25)$y, approx(vals[1,],vals[2,],xout=.5)$y, approx(vals[1,],vals[2,],xout=.75)$y, approx(vals[1,],vals[2,],xout=.95)$y)
# 4.46315 11.55932 32.92865 70.96014
#BS SEs
apply(vals.qtiles,2,function(x){sd(na.omit(x))})
# 4.224812  5.758723  5.778134 13.703339
#Get BS percentile CIs
apply(vals.qtiles,2,function(x){quantile(na.omit(x),c(.025,.975))})
# 2.5%   0.8102326  2.166132 23.52758  48.04409
# 97.5% 17.1535304 27.767528 46.53434 102.17567




keep.bs <- (is.na(vals.arr[2,1,])==FALSE & abs(vals.arr[2,1,]) < .000001)
apply(vals.qtiles[keep.bs,],2,sd)

#---------------------------
#ID 20 has higher dependence
#---------------------------
#id.stn.info[20,]#109th station overall
#   stn.no   lat     lon elev state    county                      drainage
#20    471 42.36 -111.56 7390    ID Bear Lake Williams Creek (160102020206)
#                 stnname
#20 Emigrant Summit (471)
dat <- id.data.list[[20]];summ.dat <- subset(dat,dat$mnth.pers>=6 & dat$mnth.pers<=8)
new.mat <- na.omit(summ.dat[,c(2,7:10)])
#unlist(id.chi)[20]
# 0.3191489
pdf(file="~/Dropbox/SatPrecip/IDstn20scatterplot.pdf")
par(mar=c(4.1, 4.1, 12, 0.1))
scatterhist(new.mat$pers.vec,25.4*new.mat$Precipitation.Increment..in.,
	"                                                PERSIANN",
	"                                                SNOTEL")
dev.off()

IDstationOut <- xContours(dat = cbind(new.mat$pers.vec,25.4*new.mat$Precipitation.Increment..in.), 
					mar1Prop=.05, mar2Prop=.05, mar1Width=.025, mar2Width=.025, baseContourLevel=.01,
					projContourLevels = seq(.01,.0001,length=150), gridSize = 250)
					#projContourLevels = c(.01,.005,.001,.0005,.0001), gridSize = 100)
					#13.1323362  0.0000000 is on .01 contour
u=seq(.9,.99,by=.01)
dat=cbind(new.mat$pers.vec,25.4*new.mat$Precipitation.Increment..in.)
marginal = 1 
marProp = .05
marWidth = .025
gpdOut = IDstationOut$gpdOut1
#
invTransMar(.97, cbind(new.mat$pers.vec,25.4*new.mat$Precipitation.Increment..in.), 1, .05, .025, IDstationOut$gpdOut1)
qgpd(.99,IDstationOut$gpdOut1$threshold,IDstationOut$gpdOut1$mle[1],IDstationOut$gpdOut1$mle[2])

pdf(file="~/Dropbox/SatPrecip/IDstn20contourPlots.pdf")#,w=11,h=5.5)
#par(mfrow=c(1,2))
plotOrig(IDstationOut,xlim=c(0,50),ylim=c(0,50),xlab="PERSIANN",ylab="SNOTEL")
legend("topright",legend=c("0.01","0.005","0.001","0.0005","0.0001"),col=c(3,4:7),lty=rep(1,5))
#plotFrec(IDstationOut, xlim = c(0, 1000), ylim = c(0, 1000),xlab="Transformed PERSIANN",ylab="Transformed SNOTEL")
dev.off()
 
#MAYBE TRY qcbvnonpar() IN EVD LIBRARY???
library(evd)
trash <- qcbvnonpar(seq(.25,.999,length=150), data = cbind(new.mat$pers.vec,25.4*new.mat$Precipitation.Increment..in.),
  plot = TRUE, epmar=TRUE)
vals <- condQtile2(trash,data=cbind(new.mat$pers.vec,25.4*new.mat$Precipitation.Increment..in.),
  seq(.25,.999,length=150),12.6)
#bvdata <- rbvevd(100, dep = 0.7, model = "log")
#qcbvnonpar(c(0.9,0.95), data = bvdata, plot = TRUE)

#get conditional quantiles given .5 in (= 12,7mm) precip
#vals <- condQtile(IDstationOut,12.6,margProb=.01)
vals.arr <- SPPbsList[[109]]$vals.arr
vals <- SPPbsList[[109]]$vals
#vals <- condQtile(IDstationOut,13.132,margProb=.01)#use estimated marginal .99 quantile of 13.132
pdf(file="~/Dropbox/SatPrecip/EstCondCDFstnID471.pdf",w=10,h=5.5)
plot(vals[2,],vals[1,],type="l",ylim=c(0,1),#xlim=c(10,max(na.omit(vals[2,]))),
	xlab="Precip (mm)",ylab=""
	#main="Estimated CDF for SNOTEL given PERSIANN exceeds 13.132mm (ID 471)")
	#,main="Estimated SNOTEL CDF given PERSIANN exceeds estimated 0.99 quantile (ID 471)"
	)
for (b in 1:750){try(lines(vals.arr[2,,b],vals.arr[1,,b],col="lightgray",lty=2))}#relies on bootstraps below
lines(vals[2,],vals[1,])
dev.off()
abline(h=.5,lty=2,col="gray");abline(h=.75,lty=2,col="gray");abline(h=.25,lty=2,col="gray")
abline(v=interp.fn(vals[2,],vals[1,],qtile=.75),lty=2,col="gray");abline(v=interp.fn(vals[2,],vals[1,],qtile=.5),lty=2,col="gray");abline(v=interp.fn(vals[2,],vals[1,],qtile=.25),lty=2,col="gray")
#get conditional quantile estimates
interp.fn(vals[2,],vals[1,],qtile=.25);interp.fn(vals[2,],vals[1,],qtile=.5);interp.fn(vals[2,],vals[1,],qtile=.75);interp.fn(vals[2,],vals[1,],qtile=.95)
# 9.789349
# 18.41426
# 31.15985
# 46.61711
#corresponding bootstrap SEs
apply(SPPbsList[[109]]$vals.qtiles,2,function(vec){sd(vec,na.rm=TRUE)})
# 4.136386 
# 4.397076 
# 4.003954 
# 6.242529


# ----------------------------
# Begin NP bootstrap
# ----------------------------
B <- 500
vals.arr <- array(NA,c(2,150,B))
vals.qtiles <- matrix(NA,B,4)#save estimated .25, .5, .75, and .95 quantiles

set.seed(1)
for (b in 1:B){
  boot.inds <- sample(1:nrow(new.mat),rep=TRUE)
  try(IDstationOut <- xContours(dat = (cbind(new.mat$pers.vec,25.4*new.mat$Precipitation.Increment..in.))[boot.inds,], 
					mar1Prop=.05, mar2Prop=.05, mar1Width=.025, mar2Width=.025, baseContourLevel=.01,
					projContourLevels = seq(.01,.0001,length=150), gridSize = 250),silent=TRUE)
  try(if (min(IDstationOut$contourOrig[,2])==0){marg.val <- max(IDstationOut$contourOrig[,1])},silent=TRUE)
  if (min(IDstationOut$contourOrig[,2])!=0){}
  #try(marg.val <- IDstationOut$contourOrig[which(IDstationOut$contourOrig[,2]==0,arr.ind=TRUE),1],silent=TRUE)
  try(vals.arr[,,b] <- condQtile(IDstationOut,marg.val,margProb=.01),silent=TRUE)
  try(vals.qtiles[b,] <- c(interp.fn(vals.arr[2,,b],vals.arr[1,,b],qtile=.25),interp.fn(vals.arr[2,,b],
    vals.arr[1,,b],qtile=.5),interp.fn(vals.arr[2,,b],vals.arr[1,,b],qtile=.75),interp.fn(vals.arr[2,,b],
    vals.arr[1,,b],qtile=.95)),silent=TRUE)
  if (b %% 10 == 0){print(b)}
}#end b loop
#apply(vals.qtiles,2,function(vec){sd(vec,na.rm=TRUE)})
save(vals.arr,vals.qtiles,vals,file="~/Documents/ID471BSobjects02222021.RData")
# ----------------------------
# End NP bootstrap
# ----------------------------



#maybe try terciles...
interp.fn(vals[2,],vals[1,],qtile=.333);interp.fn(vals[2,],vals[1,],qtile=.667)
boot

#get conditional quantiles given exceeding .95 empirical quantile PERSIANN
vals <- condQtile(IDstationOut,quantile((25.4*new.mat$Precipitation.Increment..in.),.97))
plot(vals[2,],vals[1,],type="l",ylim=c(0,1),#xlim=c(10,max(na.omit(vals[2,]))),
	xlab="Precip (mm)",ylab="CDF for Precip (Given PERSIANN > 15mm)")
abline(h=.95,lty=2,col="red");abline(h=.75,lty=3,col="red")
abline(v=interp.fn(vals[2,],vals[1,],qtile=.75));abline(v=interp.fn(vals[2,],vals[1,],qtile=.95))
interp.fn(vals[2,],vals[1,],qtile=.75);interp.fn(vals[2,],vals[1,],qtile=.97)
# 534.9102
# 1051.022



pdf(file="~/Dropbox/SatPrecip/IDstn20chiPlots.pdf")#,w=11,h=5.5)
#par(mfrow=c(1,2))
chiplot(data=cbind(new.mat$pers.vec,25.4*new.mat$Precipitation.Increment..in.), 
	nq = 100, which = 1, conf = 0.95,
	xlim = c(.7,1), ylim1 = c(0,1), ylim2 = c(-1,1))
dev.off()

pdf(file="~/Dropbox/SatPrecip/ElevVsChi.pdf")
par(mfrow=c(1,1),mar=c(5, 4.5, 4, 2) + 0.1)
#plot(c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) , c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)),xlab="Elevation (feet)",ylab=expression(hat(chi)))
scatterhist(c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev)*(400/(440*3)) , c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)),xlab="Elevation (meters)",ylab=expression(hat(chi)),LSline=FALSE,xlabSCL=.65,ylabSCL=.75)
#abline(lm(c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)) ~ c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) ))
#cor(c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) , c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)))
# -0.2338795
dev.off()
#plot(c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) , c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)))

#find cells on Whitney's grid that are closest to snotel locations
#'mean' is average PRISM cell elevations within a PERSIANN grid cell
#'sd' is st dev of PRISM cell elevations within a PERSIANN grid cell
snotel_locs <- cbind(c(wy.stn.info$lon,id.stn.info$lon,mt.stn.info$lon),c(wy.stn.info$lat,id.stn.info$lat,mt.stn.info$lat))
grid_locs <- expand.grid(xGrid,yGrid)
st_dev_vec <- unlist(lapply(1:261,function(rw){ind<-which.min(rowSums((snotel_locs[rw,] - grid_locs)^2))
		st_dev <- sd[ which(grid_locs[ind,1]==xGrid,arr.ind=TRUE) ,  which(grid_locs[ind,2]==yGrid,arr.ind=TRUE) ]
		return(st_dev)}))

mean_vec <- unlist(lapply(1:261,function(rw){ind<-which.min(rowSums((snotel_locs[rw,] - grid_locs)^2))
		mn <- mean[ which(grid_locs[ind,1]==xGrid,arr.ind=TRUE) ,  which(grid_locs[ind,2]==yGrid,arr.ind=TRUE) ]
		return(mn)}))

pdf(file="~/Dropbox/SatPrecip/WhitneyMeas1VsChi.pdf")#versus Whitney's metric
par(mfrow=c(1,1),mar=c(5, 4.5, 4, 2) + 0.1)
#plot(c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) , c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)),xlab="Elevation (feet)",ylab=expression(hat(chi)))
scatterhist(st_dev_vec , c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)),xlab="Standard Deviation in Cell",ylab=expression(hat(chi)),LSline=FALSE,xlabSCL=.65,ylabSCL=.75)
#abline(lm(c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)) ~ c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) ))
#cor(c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) , c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)))
# -0.2338795
dev.off()
#plot(c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) , c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)))



pdf(file="~/Dropbox/SatPrecip/WhitneyMeas2VsChi.pdf")#versus Whitney's metric
par(mfrow=c(1,1),mar=c(5, 4.5, 4, 2) + 0.1)
#plot(c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) , c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)),xlab="Elevation (feet)",ylab=expression(hat(chi)))
scatterhist((c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev)*(400/(440*3)) - mean_vec) , c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)),xlab="Difference in Elevation (meters)",ylab=expression(hat(chi)),LSline=FALSE,xlabSCL=.65,ylabSCL=.75)
#abline(lm(c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)) ~ c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) ))
#cor(c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) , c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)))
# -0.2338795
dev.off()
#plot(c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) , c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)))



pdf(file="~/Dropbox/SatPrecip/ElevVsTau.pdf")
par(mfrow=c(1,1),mar=c(5, 4.5, 4, 2) + 0.1)
#plot(c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) , c(unlist(wy.summ.tau),unlist(id.summ.tau),unlist(mt.summ.tau)),xlab="Elevation (feet)",ylab=expression(tau))
scatterhist(c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) , c(unlist(wy.summ.tau),unlist(id.summ.tau),unlist(mt.summ.tau)),xlab="Elevation (feet)",ylab=expression(tau),LSline=TRUE,xlabSCL=.65,ylabSCL=.65)
#abline(lm(c(unlist(wy.summ.tau),unlist(id.summ.tau),unlist(mt.summ.tau)) ~ c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) ))
#cor(c(wy.stn.info$elev,id.stn.info$elev,mt.stn.info$elev) , c(unlist(wy.summ.tau),unlist(id.summ.tau),unlist(mt.summ.tau)))
# -0.2533297
dev.off()
plot(c(unlist(wy.summ.tau),unlist(id.summ.tau),unlist(mt.summ.tau)) , c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)))
#cor(c(unlist(wy.summ.tau),unlist(id.summ.tau),unlist(mt.summ.tau)) , c(unlist(wy.chi),unlist(id.chi),unlist(mt.chi)))
# 0.4045612





#---------------------------
#ID 22 has lower dependence
#MT 71 has lower dependence
#---------------------------
dat <- mt.data.list[[71]];summ.dat <- subset(dat,dat$mnth.pers>=6 & dat$mnth.pers<=8)
new.mat <- na.omit(summ.dat[,c(2,7:10)])
#mt.stn.info[71,]#242nd station overall
#   stn.no   lat     lon elev state   county                            drainage
#71    929 45.87 -110.93 6550    MT Gallatin Upper Brackett Creek (100700030403)
#           stnname
#71 Sacajawea (929)
pdf(file="~/Dropbox/SatPrecip/MTstn71scatterplot.pdf")
scatterhist(new.mat$pers.vec,25.4*new.mat$Precipitation.Increment..in.,
	"                                                      PERSIANN",
	"                                                      SNOTEL")
dev.off()

IDstationOut <- xContours(dat = cbind(new.mat$pers.vec,25.4*new.mat$Precipitation.Increment..in.), 
					mar1Prop=.05, mar2Prop=.05, mar1Width=.025, mar2Width=.025, baseContourLevel=.01,
					projContourLevels = seq(.01,.0001,length=150), gridSize = 250)
					#marginal .99 quantile PERSIANN 19.486
					#projContourLevels = c(.01,.005,.001,.0005,.0001), gridSize = 100)
pdf(file="~/Dropbox/SatPrecip/MTstn71contourPlots.pdf")#,w=11,h=5.5)
#par(mfrow=c(1,2))
plotOrig(IDstationOut,xlim=c(0,78),ylim=c(0,78),xlab="PERSIANN",ylab="SNOTEL")
legend("topright",legend=c("0.01","0.005","0.001","0.0005","0.0001"),col=c(3,4:7),lty=rep(1,5))
#plotFrec(IDstationOut, xlim = c(0, 1000), ylim = c(0, 1000),xlab="Transformed PERSIANN",ylab="Transformed SNOTEL")
dev.off()



vals.arr <- SPPbsList[[242]]$vals.arr
vals <- SPPbsList[[242]]$vals
#vals <- condQtile(IDstationOut,13.132,margProb=.01)#use estimated marginal .99 quantile of 13.132
pdf(file="~/Dropbox/SatPrecip/EstCondCDFstnMT929.pdf",w=10,h=5.5)
plot(vals[2,],vals[1,],type="l",ylim=c(0,1),#xlim=c(10,max(na.omit(vals[2,]))),
	xlab="Precip (mm)",ylab=""
	#main="Estimated CDF for SNOTEL given PERSIANN exceeds 13.132mm (ID 471)")
	#,main="Estimated SNOTEL CDF given PERSIANN exceeds estimated 0.99 quantile (ID 471)"
	)
for (b in 1:750){try(lines(vals.arr[2,,b],vals.arr[1,,b],col="lightgray",lty=2))}#relies on bootstraps below
lines(vals[2,],vals[1,])
dev.off()
abline(h=.5,lty=2,col="gray");abline(h=.75,lty=2,col="gray");abline(h=.25,lty=2,col="gray")
abline(v=interp.fn(vals[2,],vals[1,],qtile=.75),lty=2,col="gray");abline(v=interp.fn(vals[2,],vals[1,],qtile=.5),lty=2,col="gray");abline(v=interp.fn(vals[2,],vals[1,],qtile=.25),lty=2,col="gray")
#get conditional quantile estimates
interp.fn(vals[2,],vals[1,],qtile=.25);interp.fn(vals[2,],vals[1,],qtile=.5);interp.fn(vals[2,],vals[1,],qtile=.75);interp.fn(vals[2,],vals[1,],qtile=.95)
# 0.3637596
# 0.7704427
# 1.378356
# 8.910578
#corresponding bootstrap SEs
apply(SPPbsList[[242]]$vals.qtiles,2,function(vec){sd(vec,na.rm=TRUE)})
# 3.787002  
# 7.192781 
# 14.097366 
# 27.181141



vals <- condQtile(IDstationOut,19.486,margProb=.01)#use estimated marginal .99 quantile of 19.486
pdf(file="~/Dropbox/SatPrecip/EstCondCDFstnMT929.pdf",w=10,h=5.5)
plot(vals[2,],vals[1,],type="l",ylim=c(0,1),#xlim=c(10,max(na.omit(vals[2,]))),
	xlab="Precip (mm)",ylab="",
	#main="Estimated CDF for SNOTEL given PERSIANN exceeds 13.132mm (ID 471)")
	main="Estimated SNOTEL CDF given PERSIANN exceeds estimated 0.99 quantile (MT 929)")
dev.off()

#get conditional quantiles given .5 in precip
vals <- condQtile(IDstationOut,12.7)
plot(vals[2,],vals[1,],type="l",ylim=c(0,1),#xlim=c(10,max(na.omit(vals[2,]))),
	xlab="Precip (mm)",ylab="CDF for Precip (Given PERSIANN > 15mm)")
abline(h=.5,lty=2,col="red");abline(h=.75,lty=3,col="red")
abline(v=interp.fn(vals[2,],vals[1,],qtile=.75));abline(v=interp.fn(vals[2,],vals[1,],qtile=.5))
interp.fn(vals[2,],vals[1,],qtile=.75);interp.fn(vals[2,],vals[1,],qtile=.5);interp.fn(vals[2,],vals[1,],qtile=.25)
# 1.378356
# 0.7704427
# 0.3637596


#get conditional quantiles given exceeding .95 empirical quantile PERSIANN
vals <- condQtile(IDstationOut,quantile((25.4*new.mat$Precipitation.Increment..in.),.97))
plot(vals[2,],vals[1,],type="l",ylim=c(0,1),#xlim=c(10,max(na.omit(vals[2,]))),
	xlab="Precip (mm)",ylab="CDF for Precip (Given PERSIANN > 15mm)")
abline(h=.95,lty=2,col="red");abline(h=.75,lty=3,col="red")
abline(v=interp.fn(vals[2,],vals[1,],qtile=.75));abline(v=interp.fn(vals[2,],vals[1,],qtile=.95))
interp.fn(vals[2,],vals[1,],qtile=.75);interp.fn(vals[2,],vals[1,],qtile=.95)
# 30.12983
# 196.8735

pdf(file="~/Dropbox/SatPrecip/MTstn71chiPlots.pdf")#,w=11,h=5.5)
#par(mfrow=c(1,2))
chiplot(data=cbind(new.mat$pers.vec,25.4*new.mat$Precipitation.Increment..in.), 
	nq = 100, which = 1, conf = 0.95,
	xlim = c(.7,1), ylim1 = c(0,1), ylim2 = c(-1,1))
dev.off()




dat <- id.data.list[[1]];summ.dat <- subset(dat,dat$mnth.pers>=6 & dat$mnth.pers<=8)
#double check this...
#lat=43.76 lon=-115.24 elev=7580 state=ID county=Elmore drainage=North and Middle Forks Boise stnname=Atlanta Summit
new.mat <- na.omit(summ.dat[,c(2,7:10)])
GammaCalc(new.mat$pers.vec,new.mat$Precipitation.Increment..in.,.95)
par(mfrow=c(1,2))
plot(apply(cbind(new.mat$pers.vec,new.mat$Precipitation.Increment..in.),2,unitFr),xlab=expression(PRECIP[PERS]),ylab=expression(PRECIP[SNO]))
hist(getW(new.mat$pers.vec,new.mat$Precipitation.Increment..in.),main="",xlab="w",freq=FALSE,ylim=c(0,2))
scatterhist(new.mat$pers.vec,25.4*new.mat$Precipitation.Increment..in.,
	"                                                      PERSIANN",
	"                                                      SNOTEL")

#jitter.mat <- data.frame("pers.vec"=jitter(new.mat$pers.vec,amount=.15),
#	"Precipitation.Increment..in."=jitter(25.4*new.mat$Precipitation.Increment..in.,amount=.15))
IDstationOut <- xContours(dat = new.mat[, c("pers.vec", "Precipitation.Increment..in.")], 
					projContourLevels = seq(.0125,.0001,length=150), gridSize = 100)
					#projContourLevels = c(.02,.01,.005,.0025,.001,.0005,.00025,.0001), gridSize = 100)
par(mfrow=c(1,2))
plotOrig(IDstationOut)
plotFrec(IDstationOut, xlim = c(0, 1000), ylim = c(0, 1000))


#IDstationBoot <- bootstrapBvpot(IDstationOut, 1, 20, 1)#fn args: outObj, blockSize, iter, bootContourLevel

#function to get conditional quantiles given at least x cm for PERSIANN
condQtile <- function(outObj,mm=10,margProb){
  numLevels <- length(outObj$projContours)
  out <- rep(NA,numLevels)
  if (is.null(margProb)==TRUE) {estMargProb <- sum(data[,1] > mm) / nrow(data)}
  if (is.null(margProb)==FALSE) {estMargProb <- margProb}
    
    for (lvl in 1:numLevels){
        out[lvl] <- approx((outObj$projContours[[lvl]])[,1],(outObj$projContours[[lvl]])[,2],xout=mm)$y
    }#end lvl loop
condQtiles <- 1 - outObj$setup$projContourLevels / estMargProb
return(rbind(condQtiles,out))
}#end condQtile function


#function to get conditional quantiles given at least x cm for PERSIANN
condQtile2 <- function(outObj,data,ContourLevels,mm=10,margProb=NULL){#use with qcbvnonpar(), data is original data
  numLevels <- length(outObj)
  out <- rep(NA,numLevels)
  if (is.null(margProb)==TRUE) {estMargProb <- sum(data[,1] > mm) / nrow(data)}
  if (is.null(margProb)==FALSE) {estMargProb <- margProb}

    for (lvl in 1:numLevels){
      if (any((outObj[[lvl]])[,1]>=mm)==TRUE){
        trash2 <- which((outObj[[lvl]])[,1]>=mm,arr.ind=TRUE)
        min.ind <- min(trash2)
        out[lvl] <- mean((outObj[[lvl]])[min.ind:(min.ind+1),2])*25.4
        rm(trash2,min.ind)
      }
      if (any((outObj[[lvl]])[,1]>=mm)==FALSE){
        out[lvl] <- NA
      }      
    }#end lvl loop
condQtiles <- (1 - ContourLevels) / estMargProb#???
return(rbind(condQtiles,out))
}#end condQtile function

vals <- condQtile(IDstationOut,12.7)
plot(vals[2,],vals[1,],type="l",ylim=c(0,1),#xlim=c(10,max(na.omit(vals[2,]))),
	xlab="Precip (mm)",ylab="CDF for Precip (Given PERSIANN > 15mm)")
abline(h=.95,lty=2,col="red");abline(h=.75,lty=3,col="red")
abline(v=interp.fn(vals[2,],vals[1,],qtile=.75));abline(v=interp.fn(vals[2,],vals[1,],qtile=.95))
interp.fn(vals[2,],vals[1,],qtile=.75);interp.fn(vals[2,],vals[1,],qtile=.95)


#my function to interpolate conditional quantiles
interp.fn <- function(x,y,qtile=.9){
  min.ind <- min(which(y>=qtile,arr.ind=TRUE))
  trash <- approx(x[(min.ind - 1):min.ind],y[(min.ind - 1):min.ind],n=100)
  min.ind <- which.min(abs(trash$y - qtile))
  return(trash$x[min.ind])
}#end interp.fn function

interp.fn(vals[2,],vals[1,],qtile=.75)
approx(vals[2,],vals[1,])


#--------------------------------------
#Example using two simulated data sets
#--------------------------------------
set.seed(3);x.norm <- mvrnorm(n = 10000, mu=c(0,0), Sigma=matrix(c(1,.5,.5,1),2,2))
plot(x.norm)
set.seed(3);x.evd <- rbvevd(n=10000, dep=.7, model = c("log"))
plot(x.evd)
plot(stdNorm(x.evd[,1]),stdNorm(x.evd[,2]))

cor(x.norm)
# 0.4926872
cor(stdNorm(x.evd[,1]),stdNorm(x.evd[,2]))
# 0.4496717
pdf(file="~/Downloads/NormalScatterplot.pdf")
scatterhist(x.norm[,1],x.norm[,2],xlab="X",ylab="Y")
#scatterhist(x.norm[,1],x.norm[,2],xlab="X",ylab="Y",extContours=TRUE)
dev.off()

pdf(file="~/Downloads/NormalChiPlot.pdf")
chiplot(x.norm, nq = 100, qlim = c(.7,.995), which = 1, conf = 0.95, trunc =
    TRUE, spcases = FALSE, lty = 1, xlim = c(.7,1), ylim1 = c(0,1))
dev.off()

pdf(file="~/Downloads/EVDScatterplot.pdf")
scatterhist(stdNorm(x.evd[,1]),stdNorm(x.evd[,2]),xlab="X",ylab="Y")
#scatterhist(stdNorm(x.evd[,1]),stdNorm(x.evd[,2]),xlab="X",ylab="Y",extContours=TRUE)
dev.off()

pdf(file="~/Downloads/EVDChiPlot.pdf")
chiplot(cbind(stdNorm(x.evd[,1]),stdNorm(x.evd[,2])), nq = 100, qlim = c(.7,.995), which = 1, conf = 0.95, trunc =
    TRUE, spcases = FALSE, lty = 1, xlim = c(.7,1), ylim1 = c(0,1))
dev.off()

stdNorm <- function(dat.vec){
	n <- length(dat.vec)
	trash.rank<-rank(dat.vec)
	U<-ifelse(is.na(dat.vec)==TRUE,NA,trash.rank/(n+1))
	qnorm(U,0,1)
}



#--------------------------------------
#Example using 2nd two simulated data sets
#--------------------------------------
library(evd)
set.seed(8);x.norm <- mvrnorm(n = 1000, mu=c(0,0), Sigma=matrix(c(1,.5,.5,1),2,2))
plot(x.norm)
x.norm <- cbind(stdNorm(x.norm[,1]),stdNorm(x.norm[,2]))
plot(x.norm)
set.seed(8);x.evd <- rbvevd(n=1000, dep=.7, model = c("log"))
plot(x.evd)
x.evd <- cbind(stdNorm(x.evd[,1]),stdNorm(x.evd[,2]))
plot(x.evd)

par(mfrow=c(1,2));plot(x.norm);plot(stdNorm(x.evd[,1]),stdNorm(x.evd[,2]))

pdf(file="~/Downloads/NormalScatterplot2.pdf")
scatterhist(x.norm[,1],x.norm[,2],xlab="X",ylab="Y")
#scatterhist(x.norm[,1],x.norm[,2],xlab="X",ylab="Y",extContours=TRUE)
dev.off()

pdf(file="~/Downloads/NormalChiPlot2.pdf")
chiplot(x.norm, nq = 100, qlim = c(.7,.975), which = 1, conf = 0.95, trunc =
    TRUE, spcases = FALSE, lty = 1, xlim = c(.7,1), ylim1 = c(0,1))
dev.off()

pdf(file="~/Downloads/EVDScatterplot2.pdf")
scatterhist(stdNorm(x.evd[,1]),stdNorm(x.evd[,2]),xlab="X",ylab="Y")
#scatterhist(stdNorm(x.evd[,1]),stdNorm(x.evd[,2]),xlab="X",ylab="Y",extContours=TRUE)
dev.off()

pdf(file="~/Downloads/EVDChiPlot2.pdf")
chiplot(cbind(stdNorm(x.evd[,1]),stdNorm(x.evd[,2])), nq = 100, qlim = c(.7,.975), which = 1, conf = 0.95, trunc =
    TRUE, spcases = FALSE, lty = 1, xlim = c(.7,1), ylim1 = c(0,1))
dev.off()

IDstationOut <- xContours(dat = x.norm, mar1Prop=.02, mar2Prop=.02, mar1Width=.0125, mar2Width=.0125, baseContourLevel=.01,
					projContourLevels = seq(.01,.0001,length=150), gridSize = 250)

#plotOrig(IDstationOut,xlab="X",ylab="Y")
marg.qtile1 <- max(IDstationOut$contourOrig[,1])
vals1 <- condQtile(IDstationOut,marg.qtile1,margProb=.01)#use estimated marginal .99 quantile 2.388




IDstationOut <- xContours(dat = x.evd, mar1Prop=.02, mar2Prop=.02, mar1Width=.0125, mar2Width=.0125, baseContourLevel=.01,
					projContourLevels = seq(.01,.0001,length=150), gridSize = 250)


marg.qtile2 <- max(IDstationOut$contourOrig[,1])
vals2 <- condQtile(IDstationOut,marg.qtile2,margProb=.01)#use estimated marginal .99 quantile 2.388

pdf(file="~/Downloads/SimStudyEstCondCDFs2.pdf",w=12,h=7)
#plot(c(-1.36,3.26),c(0,1),type="n",ylim=c(0,1),xlab="X",ylab="Y")
plot(c(-3.1,3.1),c(0,1),type="n",ylim=c(0,1),xlab="X",ylab="Y")
lines(seq(-4,4,length=200),pnorm(seq(-4,4,length=200)))
lines(c(-3.35,vals1[2,-1],3.35),c(0,vals1[1,-1],1),lty=2)
lines(c(-3.35,vals2[2,-1],3.35),c(0,vals2[1,-1],1),lty=4)
#legend(-1.35,.94,lty=c(2,4),legend=c("Gaussian","Bivariate EVD"))
legend(-3.1,.935,lty=c(1,2,4),legend=c("N(0,1) CDF","Est Cond CDF (Gaussian Data)","Est Cond CDF (Biv EVD Data)"))
abline(h=c(.25,.5,.75,.95),lty=3,col="lightgray")
dev.off()
#abline(v=c(approx(vals1[1,],vals1[2,],xout=.25)$y, approx(vals1[1,],vals1[2,],xout=.5)$y, approx(vals1[1,],vals1[2,],xout=.75)$y, approx(vals1[1,],vals1[2,],xout=.95)$y),lty=3,col="red")
#abline(v=c(approx(vals2[1,],vals2[2,],xout=.25)$y, approx(vals2[1,],vals2[2,],xout=.5)$y, approx(vals2[1,],vals2[2,],xout=.75)$y, approx(vals2[1,],vals2[2,],xout=.95)$y),lty=3,col="red")
c(approx(vals1[1,],vals1[2,],xout=.25)$y, approx(vals1[1,],vals1[2,],xout=.5)$y, approx(vals1[1,],vals1[2,],xout=.75)$y, approx(vals1[1,],vals1[2,],xout=.95)$y)
# 0.4267503 1.3455799 2.1248893 2.9177534
c(approx(vals2[1,],vals2[2,],xout=.25)$y, approx(vals2[1,],vals2[2,],xout=.5)$y, approx(vals2[1,],vals2[2,],xout=.75)$y, approx(vals2[1,],vals2[2,],xout=.95)$y)
# 0.4548279 1.6300941 2.4358322 3.0068141
###########
#code to run Dan's stuff
###########

#example using karachi data (asymptotically INDEPENDENT!)
library(chron)
load("~/Documents/karachiDatDaily.RData")
karachiOut <- xContours(dat = karachiDatDaily[, c("temp", "relHum")], asympIndep = T, 
			projContourLevels = c(.005, .001, .0005, .0001, .00005, .00001), beta = 200)
plotOrig(karachiOut)
plotFrec(karachiOut, xlim = c(0,50), ylim = c(0, 50))
etaDiag(karachiOut)
betaDiag(karachiOut, level = 3)

#example using santa ana data (asymptotically dependent)
load("~/Documents/santaAnaBivariate.RData")
colnames(saDat)[5] <- "dryness"
santaAnaOut <- xContours(dat = saDat[, c("windspeeds", "dryness")], 
					projContourLevels = c(.005, .001, .0005, .0001))
plotOrig(santaAnaOut)
plotFrec(santaAnaOut, xlim = c(0, 1000), ylim = c(0, 1000))
betaDiag(santaAnaOut)  #still a useful plot even in asymptotic dependence case

























##################
#Figures for Dan's paper
##################
#santa ana motivation plot
#pdf("Dropbox/SharedContour/Fig/santaAnaMotivation.pdf", height = 5, width = 4.2)
plot(saDat[, c("windspeeds", "neg_relHum")], xlab = "windspeed", ylab = "dryness", 
			pch = 1, cex = 0.8, col = "gray48")
cedarDay <- which(saDat[, "date"] == "10/25/2003")
witchDay <- which(saDat[, "date"] == "10/21/2007")
points(list( x = saDat[cedarDay, "windspeeds"], 
			 y = saDat[cedarDay, "neg_relHum"]), 
			 col = 1, pch = 19)
text(x = saDat[cedarDay, "windspeeds"] + .15, 
			 y = saDat[cedarDay, "neg_relHum"] + 2, 
			 labels = "C", col = 1)
points(list( x = saDat[witchDay, "windspeeds"], 
			 y = saDat[witchDay, "neg_relHum"]), 
			 col = 1, pch = 19)
text(x = saDat[witchDay, "windspeeds"] + .15, 
			 y = saDat[witchDay, "neg_relHum"] + 2,
			 labels = "W", col = 1)
#dev.off()


#karachi motivation plot
#pdf("Dropbox/SharedContour/Fig/karachiMotivation.pdf", height = 5, width = 4.2)
plot(karachiDatDaily[, c("temp", "relHum")], pch = 1, cex = 0.8, col = "gray48")
heatWaveDates <- karachiDatDaily[, "date"] < "06/24/15" & karachiDatDaily[, "date"] > "06/17/15"
points(karachiDatDaily[heatWaveDates, c("temp", "relHum")], pch = 19)
#dev.off()

#chi plots
library(evd)
#pdf("Dropbox/SharedContour/Fig/santaAnaChi.pdf", height = 5, width = 4.2)
chiplot(saDat[, c("windspeeds", "dryness")], which = 1, nq = 250, xlim = c(.75, 1), 
				ylim1 = c(0,1), qlim = c(.75, .995), main1 = "", xlab = "u")
abline(h = 0, lty = 3)
#dev.off()

chiplot(karachiDatDaily[, c("temp", "relHum")], which = 2)

#santa Ana plots
#pdf("Dropbox/SharedContour/Fig/santaAnaOrigScale.pdf", height = 5, width = 4.2)
plotOrig(santaAnaOut, cex = 0.8, col = "gray60", xlab = "windspeed", ylab = "dryness", lwd = 2)
points(list( x = saDat[cedarDay, "windspeeds"], 
			 y = saDat[cedarDay, "dryness"]), 
			 col = 1, pch = 19)
text(x = saDat[cedarDay, "windspeeds"] + .15, 
			 y = saDat[cedarDay, "dryness"] + 2, 
			 labels = "C", col = 1)
points(list( x = saDat[witchDay, "windspeeds"], 
			 y = saDat[witchDay, "dryness"]), 
			 col = 1, pch = 19)
text(x = saDat[witchDay, "windspeeds"] + .15, 
			 y = saDat[witchDay, "dryness"] + 2,
			 labels = "W", col = 1)
#dev.off()

#pdf("Dropbox/SharedContour/Fig/santaAnaFrecScale.pdf", height = 5, width = 4.2)
plotFrec(santaAnaOut, xlim = c(0, 1000), ylim = c(0, 1000), xlab = "transformed windspeed", ylab = "transformed dryness", cex = 0.8, col = "gray60", lwd = 2)
#dev.off()


#karachiPlots
#pdf("Dropbox/SharedContour/Fig/karachiOrigScale.pdf", height = 5, width = 4.2)
plotOrig(karachiOut, cex = 0.8, col = "gray60", lwd = 2, xlab = "temperature(F)", ylab = "relative humidity(%)")
points(karachiDatDaily[heatWaveDates, c("temp", "relHum")], pch = 19)
#dev.off()
#pdf("Dropbox/SharedContour/Fig/karachiFrecScale.pdf", height = 5, width = 4.2)
plotFrec(karachiOut, cex = 0.8, col = "gray60", lwd = 2, xlab = "transformed temperature", 
	ylab = "trans. rel. humidity")
#dev.off()


karachiOut50 <- xContours(dat = karachiDatDaily[, c("temp", "relHum")], asympIndep = T, 
			projContourLevels = c(.005, .001, .0005, .0001, .00005, .00001), beta = 50)
karachiOut1000 <- xContours(dat = karachiDatDaily[, c("temp", "relHum")], asympIndep = T, 
			projContourLevels = c(.005, .001, .0005, .0001, .00005, .00001), beta = 1000)
karachiOutDumb <- xContours(dat = karachiDatDaily[, c("temp", "relHum")], asympIndep = F, 
			projContourLevels = c(.005, .001, .0005, .0001, .00005, .00001))
par(mfrow = c(1,3))
plotOrig(karachiOut)
plotOrig(karachiOut50)
plotOrig(karachiOut1000)
#plotOrig(karachiOutDumb)
##
betaDiag(karachiOut, level = 3)
betaDiag(karachiOut50, level = 3)
betaDiag(karachiOut1000, level = 3)





#pdf("Dropbox/SharedContour/Fig/santaAnaBeta.pdf", height = 4, width = 3.2)
betaDiag(santaAnaOut, level = 2)
#dev.off()
#pdf("Dropbox/SharedContour/Fig/karachiBeta.pdf", height = 4, width = 3.2)
betaDiag(karachiOut, level = 3, ylab = "")
#dev.off()
#pdf("Dropbox/SharedContour/Fig/karachi1000Beta.pdf", height = 4, width = 3.2)
betaDiag(karachiOut1000, level = 3, ylab = "")
#dev.off()





#karachiBoot <- bootstrapBvpot(karachiOut, 5, 200, 2)
#save(karachiBoot, file = "Dropbox/SharedContour/Data/karachiBoot.RData")
			
#pdf("Dropbox/SharedContour/Fig/karachiBootstrap.pdf", height = 5, width = 4.2)
plot(karachiDatDaily[, c("temp", "relHum")], pch = 1, cex = 0.8, col = "gray68")
points(karachiBoot[[1]]$data)
for(k in seq(1, length(karachiBoot)))
{
	lines(karachiBoot[[k]]$projContours[[2]], col = "gray48")
}
lines(karachiOut$projContours[[2]], col = 4, lwd = 3)
#dev.off()

#santaAnaBoot <- bootstrapBvpot(santaAnaOut, 3, 200, 2)
#save(santaAnaBoot, file = "Dropbox/SharedContour/Data/santaAnaBoot.RData")
pdf("Dropbox/SharedContour/Fig/santaAnaBootstrap.pdf", height = 5, width = 4.2)
plot(saDat[, c("windspeeds", "dryness")], pch = 1, cex = 0.8, col = "gray68")
points(santaAnaBoot[[1]]$data)
for(k in seq(1, length(santaAnaBoot)))
{
	lines(santaAnaBoot[[k]]$projContours[[2]], col = "gray48")
}
lines(santaAnaOut$projContours[[2]], col = 4, lwd = 3)
dev.off()

