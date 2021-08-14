# import file  
dat = read.csv("FJH_ML_MBO_Yield4_PD.csv") 

# Make Learner
surr.rf = makeLearner(cl = "regr.randomForest")

# Make task
task = makeRegrTask(data=dat, target='Graphene_Yield')

# Train learner
fit.regr = train(surr.rf, task)

# Generate PD data
pd = generatePartialDependenceData(fit.regr, task, {"Voltage"})

# Export to .csv
write.csv(pd[['data']], 'PD_PTVoltage.csv')
