#3.9 - shows how to find distinct words that have the same letters, but in different orders, 
#which are called anagrams. The same idea is applicable to numerals. For example, are there
#many square numbers with anagrams that are also square numbers? 
#Examples are the squares 16,384 (equals 1282), 31,684 (1782), 36,481 (1912), 38,416 (1962),
# and 43,681 (2092), and all five of these five-digit numbers use the same digits. 
#This is called an anasquare. 

#Code Sample 3.41: Code to vary font size in an HTML document. For problem 3.8.

# open(STORY, "The_Black_Cat.txt");
# open(OUT, ">BlackCat.html") or die;
# print OUT "<html>\n<body>\n<marquee>\n";

# while(<STORY>) {
  # chomp;
  # @words = split(/\s+/);

  # if ( /^$/ ) {
    # print OUT "\n</marquee><marquee>\n";
  # } else {
    # foreach $x (@words) {
      # $x =~ /([\w-]+('s)?)/;
      # if ( exists($size{lc($1)}) ) {
      # print OUT "<span style=\"font-size:",

                # "$size{1c($1)}pt\">$x</span>\n";
      # } else { print "Missing Value for $1\n"; }
    # }
  # }
# }
# close(STORY);
# print OUT "</marquee>\n</body>\n</html>\n";

# Output 3.33: A few lines from code sample 3.41.

# <html>
# <body>
# <marquee>
# <span style="font-size:24pt">FOR</span>
# <span style="font-size:27pt">the</span>
# <span style="font-size:21pt">most</span>

# <span style="font-size:19pt">wild,</span>
# <span style="font-size:21pt">yet</span>
# <span style="font-size:21pt">most</span>
# <span style="font-size:12pt">homely</span>

# <span style="font-size:16pt">narrative</span>
# <span style="font-size:24pt">which</span>

# Although word anagrams are not that common, this is not true for anasquares.
# See “Anasquares: Square anagrams of squares” [14] for a discussion of this.

#_________________________SPANISH______________________________

