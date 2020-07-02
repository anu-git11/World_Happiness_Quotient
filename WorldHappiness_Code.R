#setting up the data
WH <- read.csv('WorldHappiness_Data.csv')
inTrain = sample(1:713, 499, replace=F)
train = WH[inTrain, ]
validation = WH[-inTrain, ]

#libraries
library(caret)
library(randomForest)
library(rpart)
library(rpart.plot)
library(rattle)
library(GGally)

########################################################################################
#correlation matrix
rcorr.adjust(WH, type="pearson", use="pairwise.complete.obs")

#scatterplot matrix
ggpairs(WH,axisLabels='none')

#train control
TrainCTR <- trainControl(method="LGOCV", number=10)

########################################################################################

#linear model
set.seed(12345)
lm.WH <- train(LIFE_LADDER~LOG_GDP+SOC_SUPPORT+FREEDOM+GENEROSITY
               +PERC_CORRUPT+POS_AFFECT+NEG_AFFECT+CONFIDENCE_NATGOVT
               +DEM_QUALITY+GINI_INDEX+GINI_HHINC,data=train, 
               na.action=na.roughfix, method="lm", trControl=TrainCTR)

summary(lm.WH)

#scatterplot matrix of surprising results
ggpairs(train[c(1,9,10,14)],axisLabels='none')

########################################################################################

#decision tree
set.seed(12345)
tree.WH<- train(LIFE_LADDER~LOG_GDP+SOC_SUPPORT+FREEDOM+GENEROSITY
                +PERC_CORRUPT+POS_AFFECT+NEG_AFFECT+CONFIDENCE_NATGOVT
                +DEM_QUALITY+GINI_INDEX+GINI_HHINC, data=train, 
                na.action=na.roughfix, method="rpart", trControl=TrainCTR,
                parms=list(minsplit=10, minbucket=10, maxdepth=5, cp=.01))

fancyRpartPlot(tree.WH$finalModel)
summary(tree.WH)

########################################################################################

#random forest
set.seed(12345)
rf.WH <- train(LIFE_LADDER~LOG_GDP+SOC_SUPPORT+FREEDOM+GENEROSITY
               +PERC_CORRUPT+POS_AFFECT+NEG_AFFECT+CONFIDENCE_NATGOVT
               +DEM_QUALITY+GINI_INDEX+GINI_HHINC,data=train, 
               na.action=na.roughfix, method="rf", trControl=TrainCTR,
               importance=TRUE, parms=list(mtry=11))

rf.WH 
varImpPlot(rf.WH$finalModel)
varImp(rf.WH, scale=FALSE)

########################################################################################

#model comparison
results = resamples(list(lm = lm.WH, tree = tree.WH, rf = rf.WH))
summary(results)
bwplot(results)
