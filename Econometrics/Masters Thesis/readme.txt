Number 1

File Name: stata_input.xlsx
Description: Contains the dataset used in the STATA do-files

Number 2

File Name: final_do_file.do
Description: Comprised of 5 parts namely Part A - Part E
		Part A: Tests on initial regression specification, 
			corrections, tests on final regression specification
			and result of the final regression on equally 
			weighted portfolio of 21 bank stocks as the 
			dependent variable
		Part B: Tests on final regression specification and result
			of the final regression on a value weighted portfolio
			of 21 bank stocks as the dependent variable
		Part C: Tests and regression results on the final regression
			specification on 4 different bank portfolios; namely
			Diversified Banks, Regional Banks, Investment Banks
			and Insurance Banks
		Part D: Regression results of simplified models (CAPM and 
			Fama French 3 factor model)
		Part E: Generating graphs for evidence of reduced 
			heteroskedasticity and augmented dickey fuller tests
			and checking FF 5 Factor + Momentum in our model

Number 3

File Name: jackknife_boj.do
Description: Do file that conducts the Jack-Knife procedure on the final 
	     regression specification to examine influential observations
	     of boj_rate

Number 4

File Name: b_jackknife.dta
Description: Stores beta values of regressions with each observation 
	     eliminated one by one


Number 5

File Name: wls_do_file.do
Description: Do file that calculates weights for Weighted Least Squares 
	     and does the WLS regression and tests if linear and non-linear
	     heteroskedasticity is removed

Number 6

File Name: stata_input_wls.dta
Description: Data file that stores all the variables as before and the 
	     calculated weights using 1/max(hhat,0.01*sigmahat^2)


Number 7

File Name: Data Appendix.docx
Description: Word file containing detailed indformation about data collection
	     and formatting to make the data set for Stata

Number 8

File Name: waldtest.mat and waldtest.m
Description: MATLAB data file containing variance covariance matrix extracted
	     from Stata, restriction matrix R and vector r to use in the	
	     m-file which calculates Wald Statistic using matrix 
	     multiplication 


Number 9

Fle Name: Interpretation Platform.xlsx
Description: Follows the methodology discussed in paper for interpreattion
	     to see interpretation of results for 1, 5 or 10 basis points
	     depending on user's discretion

Number 10

File Name: ECO2408_2019S_Zaid Abid_Steven Huynh_Term Paper.pdf
Description: Written submission of our term paper