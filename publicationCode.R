suppressWarnings({suppressMessages({  
  library(mlrMBO)  
	library(ggplot2)  
})})  

# set directory of file as path  
setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) 

# import file  
dat = read.csv("FJH_ML_MBO_Yield3.csv") 
# dat = as.data.frame(sapply(dat, as.numeric))

# set parameter space  
ps = makeParamSet(  
  makeIntegerParam("Voltage", 150, 230),  
  makeIntegerParam("PulseTime", lower = 50, upper = 550),  
  makeIntegerParam("Mass", lower = 200, upper = 450),  
  makeDiscreteParam("Pretreatment", values=c('One', 'Two', 'Three', 'Four', 
                                             'Five', 'Six', 'Seven', 'Eight', 'Nine', 
                                             'Ten', 'Eleven', 'Twelve', 'Thirteen', 
                                             'Fourteen', 'Fifteen')), 
  # makeIntegerParam('Pretreatment', lower=0, upper=15),
  makeIntegerParam("Cap", lower=0, upper=6)
)  

# set surrogate model config  
ctrl = makeMBOControl(y.name = "Graphene_Yield")  

# set acquisition function and focus search config  
ctrl = setMBOControlInfill(ctrl, opt = "focussearch", opt.focussearch.maxit = 10,  
                               opt.focussearch.points = 10000, crit = makeMBOInfillCritEI())  
	  
	  
# build surrogate model with parameter space, surrogate model configs, target  
suppressMessages({opt.state = initSMBO(par.set = ps,  
                                       design = subset(dat, select = -c(Estimated, EstimatedUpper)),   
                                       control = ctrl, minimize = FALSE, noisy = TRUE)})  

# propose most promising point  
cat("Proposed parameters:\n")  
prop = suppressWarnings({proposePoints(opt.state)}) 
print(prop)

