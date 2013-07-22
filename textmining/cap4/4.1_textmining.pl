#A fair coin is flipped until either HHH or THH is obtained.
#If HHH occurs first, then Player A wins, and if THH occurs first, then Player B wins.
#For example, the sequence HTTTTHH is a win for Player B because THH occurs in the last three flips,
#but HHH does not appear. Although both sequences are equally likely when flipping a coin three times,
#one of the two players is a favorite to win. Write a Perl program to simulate this process,
#find who wins, and then estimate Player A’s probability of winning.
#This problem is just one case of a game described by Walter Penney.
#See pages 59–63 of John Haigh’s Taking Chances:
#Winning with Probability [50] for a description of Penney’s game and how it has counterintuitive properties
#!/usr/bin/perl -w
use strict;
my @ocurrence;

sub generateevent{

}

sub flipped {

} 

sub confirmwinner {

my @ocurrence = shift;

print @ocurrence;

}
