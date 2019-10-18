clear all
import excel "C:\Users\zaid_\Documents\RESOURCES\ECO 2408\Project\Final Shit\stata_input.xlsx", sheet("Sheet1") firstrow case(lower)
gen nir = boj_rate<0
gen equal_port = 1/21*(s8306+ s8316 +s8411 +s8766 +s8591 +s8725 +s8309 +s8604 +s8601 +s8795 +s8473 +s8331 +s8355 +s8354 +s8369 +s8304 +s8729 +s8570 +s8418 +s8593 +s8303)
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

*generate a variable with the original observation number
gen obs =_n

regress equal_port mktrf smb hml rmw cma wml boj_rate nir mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate

*keep the estimation sample so each observation will be matched
*with the corresponding replication
keep if e(sample)
*use jackknife to generate the replications, and save the values in
*file b_replic
jackknife, saving(b_jackknife, replace):  regress equal_port mktrf smb hml rmw cma wml boj_rate nir mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate
*verify that all the replications were successful
assert e(N_misreps) ==0

merge 1:1 _n using b_jackknife
*see how values from replications are stored
describe, fullnames

*compute the dfbeta for each covariate
foreach var in mktrf smb hml rmw cma wml boj_rate nir mktrf2 smb2 rmw2 cma2 boj_rate2 nir_mktrf nir_smb nir_hml nir_cma nir_boj_rate {
	gen dbeta_`var' = (_b[`var'] -_b_`var')
}

gen dbeta_cons = (_b[_cons] - _b_cons)

label var obs "observation number"


*plot dfbeta values for variable nir
scatter dbeta_boj_rate obs, mlabel(obs) title("Influential Observations of BOJ_Rate")
graph save Graph "C:\Users\zaid_\Documents\RESOURCES\ECO 2408\Project\Final Shit\BOJ_Influential_Observations.gph", replace
