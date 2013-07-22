#4.2 Suppose two people are betting the outcome of a fair coin where 
#Player A loses a dollar if the flip is tails and otherwise wins a dollar.
# A running tally of Player A’s net winnings or loses is kept where the initial
# value is $0. For example, if the game starts off with HTTHT, then Player
# A has $1, $0, -$1, $0, -$1, respectively.
#Write a Perl simulation of this game for 20 tosses, then compute the proportion of
# the flips where Player A is ahead or even. Then repeat this simulation 10,000 times.
# The result will be 10,000 proportions each based on 20 flips. One guesses that since
# the coin is fair, that Player A should be ahead about 50% of the time, but this is not true. 
# Surprisingly, the most probable scenario is that Player A is either ahead or behind the entire game. 
# See pages 64–69 of John Haigh’s Taking Chances: Winning with Probability [50] for a discussion of this process.
# For a mathematical exposition, see section III.4 of
# An Introduction to Probability Theory and Its Applications by William Feller