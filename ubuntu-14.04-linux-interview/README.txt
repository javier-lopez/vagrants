###############################################################################

Welcome to my organization, we're delighted to have you here!, please allow us
some time to discover how great you are.

The following section contain a couple of tests who exercise Linux skills we
find useful at the Operational team in Organization. Please try to answer as
many as possible.

Here are the rules:

 - You can use man pages or any Internet search engine to complete the tasks
 - You can use man pages or any Internet search engine to complete the tasks
   (really)
 - It's not allowed to edit the 'linux-interview*' nor the q[0-9]*.in files

~/linux-interview.test is a program used to test replies to the specified
questions, feel free to execute it as many times as desired.

    $ ~/linux-interview.test

If any statement isn't clear or the above instructions are confusing, feel free
to ask us for clarifications.

Good Luck!

###############################################################################

0. Create the ~/q0 file (can be any type)

1. Remove all "*.pyc" files from the ~/q1.dir directory recursively

2. Write the number of times the strings "Operations" and "Linux" appears in
   the ~/q2.in file (case insensitive) to the q2.out file

3. Replace all the occurrence of "linux" (case sensitive) with "DevOps"
   in the q3.in file

4. Add 512Mb of Swap to the current instance

5. Clone either:
    git => https://github.com/git-tips/tips
    hg  => https://bitbucket.org/rude/love
    svn => http://svn.apache.org/repos/asf/spamassassin/trunk
   To ~/q5.dir

6. Install a web server in port 8888, ensure the index.html file exists at the
   default location

7. Install the latest MongoDB release:
   https://docs.mongodb.com/v3.2/administration/install-on-linux

8. Write the base_experience the pikachu pokemon has in the q8.in database to the
   q8.out file. HINT: We're using a sqlite db

9. Write a program in your prefered language that prints the numbers from 1 to
   100 with the following conditions:
 - For multiples of three [3] print "Sysadmin\n" instead of the number.
 - For multiples of five  [5] print "support\n" instead of the number.
 - For numbers which are multiples of both three [3] and five[5] print
   "Linux\n" instead of the number.
 - For cases where none of the above conditions apply print the number plus a
   new line "\n"
 - The program should be called 'q9.bin' and be placed at the $HOME directory
 - The program output should be saved to q9.out

10. Write a program in your prefered language to validate ipv4 addresses.
 - The program must be named 'q10.bin' and be placed at the $HOME directory
 - The program should produce no output
 - The program must accept at least 1 parameter
 - The program must exits sucessfully if the parameter is a valid ipv4 address
    e.g. $ ./q10.bin 8.8.8.8 && echo valid ipv4 address
 - The program must exits with error if the parameter is an invalid ipv4 address
    e.g. $ ./q10.bin x.x.x.x || echo invalid ipv4 address
