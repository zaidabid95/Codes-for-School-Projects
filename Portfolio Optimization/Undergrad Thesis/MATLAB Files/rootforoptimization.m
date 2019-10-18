%input rate for which you want minimum mean variance portfolio
rate = 0.275;

[opweights ret mad] = optimumportfolio(rate);