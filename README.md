# FJH_ML
Code and data available for the prediction of flash graphene crystallinity from flash Joule heating parameters. This project supports the paper "Machine learning guided synthesis of flash graphene" by Beckham et al., currently under review. 

The file "RegressionAndPD" was used to compile performance metrics and analyses for the various models trained to predict GY. This file uses data from the dataset contained in "FJH_ML_Final.csv." 

The file "publicationCode.R" contains the script used to generate new suggested datapoints using mlrMBO learners. The script "CalculatingPDMBO" shows the PD of the parameters involved in this process. These scripts use variations of the same dataset, with the PD dataset using a transformed version that more accruately represents the nature of the parameters involved. For instance, when this study began, it was not known whether the path dependence of pre-treatment would be important to consider, so we merely asked the MBO algorithm to determine the best pretreatment from a variety of options presented. In the analysis script, once we had a better idea of how pre-treatment affected GY, pre-treatment was presented as teh cumulative voltage applied and the highest voltage treatment. This is why there are multiple files containing different forms of the MBO dataset, which are used by different analysis scripts. 

The classification script was something that I coded out of curiosity. It generally supported the same conclusions as the regression models, so they were not included in the final paper for fear of redundancy. 

For questions or problems running the scripts presented please contact jacobbeckham@rice.edu. 
