*** PART A ***

clear all
import excel "C:\Users\zaid_\Documents\RESOURCES\ECO 2408\Project\Final Shit\stata_input.xlsx", sheet("Sheet1") firstrow case(lower)
gen time = _n
tsset time
gen nir = boj_rate<0
gen equal_port = 1/21*(s8306+ s8316 +s8411 +s8766 +s8591 +s8725 +s8309 +s8604 +s8601 +s8795 +s8473 +s8331 +s8355 +s8354 +s8369 +s8304 +s8729 +s8570 +s8418 +s8593 +s8303)
summ mktrf smb hml rmw cma wml boj_rate val_port nir equal_port
label variable nir "Negative Interest Rate Dummy"
label variable equal_port "Equal_Port"
regress equal_port nir boj_rate mktrf smb hml rmw cma wml

* heteroskedasticity test * 

estat hettest, fstat
estat imtest, white
estat archlm, lags(13)

* manual white test * 

predict yhat, xb
predict uhat, res
gen yhat2 = yhat*yhat
gen uhat2 = uhat*uhat
regress uhat2 yhat yhat2
drop yhat yhat2 uhat uhat2

* auto-correlation tests * 

quietly regress equal_port mktrf smb hml rmw cma wml boj_rate nir
estat bgodfrey, lags(13)

* misspecification tests * 

estat ovtest

* manual RESET test * 

quietly regress equal_port mktrf smb hml rmw cma wml boj_rate nir
predict yhat, xb
predict uhat, res
gen yhat2 = yhat*yhat
gen yhat3 = yhat2*yhat
quietly regress equal_port mktrf smb hml rmw cma wml boj_rate nir yhat2 yhat3
test yhat2 yhat3
drop yhat yhat2 yhat3 uhat 

* corrections *

gen mktrf2 = mktrf*mktrf
gen smb2 = smb*smb
gen hml2 = hml*hml
gen rmw2 = rmw*rmw
gen cma2 = cma*cma
gen wml2 = wml*wml
gen boj_rate2 = boj_rate*boj_rate
gen nir_mktrf = nir*mktrf
gen nir_smb = nir*smb
gen nir_hml = nir*hml
gen nir_rmw = nir*rmw
gen nir_cma = nir*cma
gen nir_wml = nir*wml
gen nir_boj_rate = nir*boj_rate
quietly regress equal_port mktrf smb hml rmw cma wml boj_rate nir
predict uhat, res
quietly regress uhat mktrf smb hml rmw cma wml boj_rate nir mktrf2 smb2 hml2 rmw2 cma2 wml2 boj_rate2 nir_mktrf nir_smb nir_hml nir_rmw nir_cma nir_wml nir_boj_rate, robust
test mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate
drop uhat

* final regression * 

quietly regress equal_port mktrf smb hml rmw cma wml boj_rate nir mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate

*tests on final regression * 

estat hettest, fstat
estat imtest, white
estat archlm, lags(13)
estat bgodfrey, lags(13)
estat ovtest

* manual RESET test * 

predict yhat, xb
predict uhat, res
gen yhat2 = yhat*yhat
gen yhat3 = yhat2*yhat
quietly regress equal_port mktrf smb hml rmw cma wml boj_rate nir mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate yhat2 yhat3
test yhat2 yhat3
drop yhat yhat2 yhat3 uhat

* final results * 

regress equal_port nir boj_rate mktrf smb hml rmw cma wml mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate, vce(robust)

*** PART B ***

* final regression * 

quietly regress val_port mktrf smb hml rmw cma wml boj_rate nir mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate

*tests on final regression * 

estat hettest, fstat
estat imtest, white
estat archlm, lags(13)
estat bgodfrey, lags(13)
estat ovtest

predict yhat, xb
predict uhat, res
gen yhat2 = yhat*yhat
gen yhat3 = yhat2*yhat
quietly regress equal_port mktrf smb hml rmw cma wml boj_rate nir mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate yhat2 yhat3
test yhat2 yhat3
drop yhat yhat2 yhat3 uhat

* final results * 

regress val_port nir boj_rate mktrf smb hml rmw cma wml mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate, vce(robust)

*** PART C ***
clear all
import excel "C:\Users\zaid_\Documents\RESOURCES\ECO 2408\Project\Final Shit\stata_input.xlsx", sheet("Sheet1") firstrow case(lower)
gen time = _n
tsset time
gen nir = boj_rate<0
gen mktrf2 = mktrf*mktrf
gen smb2 = smb*smb
gen hml2 = hml*hml
gen rmw2 = rmw*rmw
gen cma2 = cma*cma
gen wml2 = wml*wml
gen boj_rate2 = boj_rate*boj_rate
gen nir_mktrf = nir*mktrf
gen nir_smb = nir*smb
gen nir_hml = nir*hml
gen nir_rmw = nir*rmw
gen nir_cma = nir*cma
gen nir_wml = nir*wml
gen nir_boj_rate = nir*boj_rate
gen div_port  = (1/5)*(s8306+s8316+s8411+s8309+s8304)
gen reg_port  = (1/6)*(s8331+s8355+s8354+s8369+s8418+s8303)
gen inv_port  = (1/2)*(s8604+s8601)
gen ins_port  = (1/4)*(s8795+s8729+s8766+s8725)
label variable div_port  "Diversified_Port"
label variable reg_port  "Regional_Port"
label variable inv_port  "Investment_Port"
label variable ins_port  "Insurance_Port"
gen equal_port = 1/21*(s8306+ s8316 +s8411 +s8766 +s8591 +s8725 +s8309 +s8604 +s8601 +s8795 +s8473 +s8331 +s8355 +s8354 +s8369 +s8304 +s8729 +s8570 +s8418 +s8593 +s8303)
label variable nir "Negative Interest Rate Dummy"
label variable equal_port "Equal_Port"

foreach var of varlist div_port -ins_port {
quietly regress `var' mktrf smb hml rmw cma wml boj_rate nir mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate
* heteroskedasticity test * 
estat hettest, fstat
estat imtest, white
estat archlm, lags(13)
* auto-correlation tests * 
quietly regress `var' mktrf smb hml rmw cma wml boj_rate nir mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate
estat bgodfrey, lags(13)
* misspecification tests * 
quietly regress `var' mktrf smb hml rmw cma wml boj_rate nir mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate
estat ovtest
}

newey div_port  nir boj_rate mktrf smb hml rmw cma wml mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate, lag(13)
regress reg_port  nir boj_rate mktrf smb hml rmw cma wml mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate, vce(robust)
regress inv_port  nir boj_rate mktrf smb hml rmw cma wml mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate, vce(robust)
regress ins_port  nir boj_rate mktrf smb hml rmw cma wml mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate, vce(robust)

*** PART D ***

* simplified results * 

* FF 3 Factor *
regress equal_port nir boj_rate mktrf smb hml mktrf2 smb2 boj_rate2 nir_mktrf nir_smb nir_hml nir_boj_rate, vce(robust)
* CAPM * 
regress equal_port nir boj_rate mktrf boj_rate2 nir_mktrf nir_boj_rate, vce(robust)

*** PART E ***

* heteroskedasticity graphs * 

quietly regress equal_port mktrf smb hml rmw cma wml boj_rate nir
predict old_uhat, res
gen old_uhat_2 = old_uhat*old_uhat
quietly regress equal_port mktrf smb hml rmw cma wml boj_rate nir mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate
predict new_uhat, res
gen new_uhat_2 = new_uhat*new_uhat
twoway scatter old_uhat_2 nir || scatter new_uhat_2 nir
graph save Graph "C:\Users\zaid_\Documents\RESOURCES\ECO 2408\Project\Final Shit\Hetero_Graph_NIR.gph", replace
twoway scatter old_uhat_2 boj_rate || scatter new_uhat_2 boj_rate
graph save Graph "C:\Users\zaid_\Documents\RESOURCES\ECO 2408\Project\Final Shit\Hetero_Graph_BOJRate.gph", replace
gr combine Hetero_Graph_NIR.gph Hetero_Graph_BOJRate.gph

* stationarity tests*

dfuller mktrf, lags(13)
dfuller smb, lags(13) 
dfuller hml, lags(13) 
dfuller rmw, lags(13) 
dfuller cma, lags(13) 
dfuller wml, lags(13) 
dfuller boj_rate, lags(13) 
dfuller nir, lags(13) 
dfuller equal_port, lags(13) 
dfuller div_port , lags(13) 
dfuller reg_port , lags(13) 
dfuller inv_port , lags(13) 
dfuller ins_port , lags(13) 
dfuller val_port, lags(13)

* Fama French 6 Factor Test * 

regress equal_port nir boj_rate mktrf smb hml rmw cma wml mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate, vce(robust)
test mktrf smb hml rmw cma wml 
