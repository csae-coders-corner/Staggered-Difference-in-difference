# Staggered-Difference-in-Differences
Difference in difference estimators have been a popular empirical strategy for researchers since the “credibility revolution” [Angrist and Pischke, 2008] and they remain incredibly popular. Empirics somewhat got ahead of the theory, and the econometrics has caught up only recently. In doing so, it has discovered some potential problems with the canonical approach. Here, we will focus on issues with differential treatment timing across units as discussed in Goodman-Bacon [2018].
Consider the familiar two-way fixed effect (TWFE) specification:

yit = β · Tit + αi + τt + εit	(1)

yit is some outcome of interest, αi and τt are unit (i) and time (t) fixed effects, Tit is treatment and εit is some idiosyncratic error. The coefficient of interest is, as always, β. Now suppose that treatment Tit turns on at different times for different units i. Then Goodman-Bacon [2018] shows that βˆ will be a weighted average of all possible (2x2) traditional DiD estimators. A traditional DiD estimator is a 2-period, 2-group ‘experiment’ where one group is treated in the second period. An example with three treatment groups is given in the figure below.
