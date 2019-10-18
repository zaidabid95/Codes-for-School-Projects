use "C:\Users\zaid_\Documents\RESOURCES\ECON 330\Project\ecls_5th_grade.dta" 

regress math_test gender race mom_educ family_income hhsize part_dance part_athletics part_club part_music part_art tv_afternoon_mf both_parents has_library_card has_home_computer mom_work_status school_type problem_drugs
outreg2 using "C:\Users\zaid_\Documents\RESOURCES\ECON 330\Project\YO\0.Regression 0.doc"

gen lmath = log(math_test)

gen lincome = log(family_income)

foreach x of numlist 1/4{
gen race`x' = race==`x' if !missing(race)
}

foreach x of numlist 1/3{
gen schooltype`x' = school_type==`x' if !missing(school_type)
}

gen momworks = (mom_work_status==1 | mom_work_status==2) if !missing(mom_work_status)

gen male = gender==1

regress lmath male race1 race2 race3 mom_educ lincome hhsize part_dance part_athletics part_club part_music part_art tv_afternoon_mf both_parents has_library_card has_home_computer momworks schooltype1 schooltype2 problem_drugs
outreg2 using "C:\Users\zaid_\Documents\RESOURCES\ECON 330\Project\YO\1.Regression Number 1.doc"

predict yhat
predict errors, residuals
gen errorsq = errors*errors
gen yhatsq = yhat*yhat

scatter errorsq yhat
*graph shows hetroskedasticity

regress errorsq yhat yhatsq
outreg2 using "C:\Users\zaid_\Documents\RESOURCES\ECON 330\Project\YO\4.Regression White Test.doc"
*White Test shows hetroskedasticity

regress lmath male race1 race2 race3 mom_educ lincome hhsize part_dance part_athletics part_club part_music part_art tv_afternoon_mf both_parents has_library_card has_home_computer momworks schooltype1 schooltype2 problem_drugs, robust
outreg2 using "C:\Users\zaid_\Documents\RESOURCES\ECON 330\Project\YO\5.Regression with Robust SE.doc"
*used robust standard errors

vif
*multicollinearity not a problem

summ errors
*see if E(u) = 0
foreach var of varlist male race1 race2 race3 mom_educ lincome hhsize part_dance part_athletics part_club part_music part_art tv_afternoon_mf both_parents has_library_card has_home_computer momworks schooltype1 schooltype2 problem_drugs{
regress errors `var'
}
pwcorr lmath male race1 race2 race3 mom_educ lincome hhsize part_dance part_athletics part_club part_music part_art tv_afternoon_mf both_parents has_library_card has_home_computer momworks schooltype1 schooltype2 problem_drugs
*check for collinerity between errors and independent variables to conclude E(u|xi's)=0

kdensity errors
*to check normality of residuals

regress lmath male race1 race2 race3 mom_educ lincome hhsize part_dance part_athletics part_club part_music part_art tv_afternoon_mf both_parents has_library_card has_home_computer momworks schooltype1 schooltype2 problem_drugs
hettest
ovtest
*B-P and RESET Test

regress lmath male race1 race2 race3 mom_educ lincome hhsize part_dance part_athletics part_club part_music part_art tv_afternoon_mf both_parents has_library_card has_home_computer momworks schooltype1 schooltype2 problem_drugs, robust
test part_dance part_athletics part_club part_music part_art
*Testing for Joint Significance of Extra-Curricular Activities
