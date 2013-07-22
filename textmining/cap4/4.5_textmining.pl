#4.5 [Mathematical] For four-letter words, equation 4.8 
#suggests that the events “first letter is a q” and “second letter is an u”
# are dependent as language intuition suggests. However, how strong is this evidence?
# This problem gives a quantitative answer to this.
#The problem of independence of events can be solved with contingency tables.
# There are several ways to do this, and this problem applies Fisher’s exact test.
# Equation 4.11 shows the computation needed, which gives the probability of seeing 
#the counts in table 4.3 if independence were true. Since this answer is about six 
#in a billion, the reasonable conclusion is that the two events are dependent

			#1st is q #1st not q #Row Sums
#2nd is u		10		368			378
#2nd not u		2		3306		3308
#Column Sums	12		3674		3686

#For this problem, find a statistics text that shows how to analyze categorical data.
#Then look up Fisher’s exact test to see why it works. For example, see section 3.5.1
# of Alan Agresti’s Categorical Data Analysis [2].