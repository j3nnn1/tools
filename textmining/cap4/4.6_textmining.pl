# 4.6 In section 4.4, the proportions of the letter e in 68 Poe stories are given. 
# Here are some steps to compute these values. First, download the five volumes from the Web,
# and get rid of the initial and ending text so that just the titles and stories are left. 
# Second, although the titles are easy for a person to read, it helps to make them completely unambiguous. 
# One common way to add information to a text is by XML tags. 
# These work the same way as HTML tags except that they can stand for anything,
# not just how to display a Web page. Here we put the story titles in between two title tags,
# for example, <TITLE>The Black Cat</TITLE>. Third, scan these five files line by line using a while loop.
# Finally, use code sample 4.3 as a start for counting the total number of letters (in $count)
# and the number of e’s (in $count_e).