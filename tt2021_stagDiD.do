*** Corders Corner TT21, staggered DiD 
* Luke Milsom 29/04/2021

{ /* create data */
	clear all
	cd E:\Dropbox\Apps\Overleaf\coders_corner_ttw2_2021
	set seed 2810

	// i dimension
		set obs 50 
		gen id = _n 
		gen i_specific = rnormal()
		// randomise treatment
		gen temp = runiform()
		gen treat_i = (temp>0.5)
		drop temp

	// t dimension
		expand 20 
		bysort id : gen t = _n 
		gen temp = rnormal()
		bysort id : gen t_specific = temp[1]
		drop temp 
		// randomise treatment (never turns off)
		gen temp = runiform()
		bysort id : gen temp2 = (temp>0.8)
		bysort id : gen temp3 = t*(temp2 == 1) + 100*(temp2 == 0)
		bysort id : egen first_treat = min(temp3)
		gen treat_t = (t >= first_treat )
		drop temp*
		
	// put together
		gen epsilon = rnormal() // error
		gen treat = treat_i * treat_t
		gen treatment_effect = 0.7 + 0.1*(t-first_treat) // increases over time
		gen y = i_specific + t_specific + treatment_effect*treat + epsilon 
		
	// save
		sa example_data.dta , replace
}
	
// analysis 
	use example_data.dta , clear
	ssc install bacondecomp
	
	// regression (naive)
	reghdfe y treat , absorb(id t)

	// bacon-decomposition
	xtset id t
	bacondecomp y treat , ddetail
	graph export bacondecomp_example.png , width(2000) replace

