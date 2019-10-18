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
predict res, res
gen res2 = res*res
regress res2 nir boj_rate mktrf smb hml rmw cma wml
predict hhat, xb
clear all
use "C:\Users\zaid_\Documents\RESOURCES\ECO 2408\Project\Final Shit\stata_input_wls.dta"
regress equal_port nir boj_rate mktrf smb hml rmw cma wml [aweight = var38]
estat hettest
predict yhat, xb
predict uhat, res
gen yhat2 = yhat*yhat
gen uhat2 = uhat*uhat
regress uhat2 yhat yhat2
drop yhat yhat2 uhat uhat2
