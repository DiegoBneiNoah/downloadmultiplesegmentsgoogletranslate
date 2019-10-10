# downloadmultiplesegmentsgoogletranslate
Download multiple segments from google translate voice
Follow the instructions below and watch the [How to use full.sh with google translator manually downloading the har file.](https://vimeo.com/360410735).

First, see cd.txt below, copy and save how cd.txt in your machine:

https://github.com/DiegoBneiNoah/downloadmultiplesegmentsgoogletranslate/blob/master/cd.txt

I use ArchLinux with xfce graphical interface.

I have been making a [How to control full.sh through terminal shell script](https://vimeo.com/360410735), I hope the quality will allow me to see the execution of the procedure.
- In the appendix you are sending the executable bash script called full.sh, you must save it to a folder, then execute within this folder the following command: chmod + x full.sh and then export PATH = $ PATH: $ pwd.
- Then copy the path of this folder to the file cd.txt and change the path that I put in cd.txt for the new your new path.
- After making this change to cd.txt, copy the text to translate.google.com and first press F12 select NETWORK and media, so now you can click on the speaker icon to generate the various tts segments, wait for all the process (I compare the last part of the copied text with the last part of the last tts segment below to make sure the process is over).
- Save har.file as shown in the video in a separate folder to generate the text page you are working on in isolation.
- Access this new folder created by your terminal (make cd path_to_your_new_folder).
- Then copy the command export PATH = $ PATH: $ pwd; cp 'where_you_saved_full.sh' full.sh; full.sh for your terminal

- The command will generate all tts segments represented by multiple mp3 files and then merge each segment in the correct order into a single file called page.mp3.
- page.mp3 is all the text you requested to translate on translate.google.com.

- Now you can rename page.mp3 if you wish and share and put background music (the google translator voice is a little monotonous).

Details about har file

Just remembering, it did not appear in the video correctly, but in the attached image below, you can see where to download the har file, by default full.sh works with the name har.har, so at the time of saving the har file, rename it to har.har. See the image below:

[har.file location in the firefox](https://imgur.com/a/PrQsjWb)
![har.file location in the firefox browser](https://imgur.com/a/PrQsjWb)

Note: I have tested on a non-proxy internet network, but I think it works even with proxy restrictions. One of the codes for numbering mp3 segment sequences to allow efficient use of the "cat" command within full.sh I managed by asking at https://stackoverflow.com/a/57847791/10824251. So part of the credit goes to the first user who answered this question.

UPDATE SOLUTION (WITHOUT WORKING MANUALLY DOWNLOADING FILES.HAR OR GOING INSIDE FIREFOX (OR OTHER WEB BROWSER):

I was unaware of the gtts tool, although I suspected this before posting this question:

So here is an alternative that works:

    install package gtts, see how at: https://gtts.readthedocs.io/en/latest/

My experience bellow:

For a simple translation of a file saved locally on your machine you can use the following command order:

gtts-cli -l pt -f <file>  -o  <name.output>.mp3

four different text files to translate, in both cases, the text files were saved without using any extension.:

Capitule 1 from Book: files (pages): 1 and 2

Capitule 2 from book: files (pages): 3 and 4

Create a finish.sh file in the folder where files 1, 2,3, and 4 are, and place the following code inside the finish.sh file:

#!/bin/bash
awk -F, '{print $1"3;"}' pre.full.gtts.txt > mp3.txt; awk '/\.mp3/{sub(".mp3",++count"&")} 1'  mp3.txt > pre.count.txt; awk '/\-o/{sub(" -o",++count"&")} 1'  pre.count.txt > pre.count1.txt; awk 'ORS=" "' pre.count1.txt > hor.mp3.txt; awk -F, '{print "#!/bin/bash \n "$1" "$2""}' hor.mp3.txt > gtts.sh; chmod +x gtts.sh; export PATH=$PATH:$pwd; gtts.sh

Also create a pre.full.gtts.txt file and save in the same folder with follow code:

gtts-cli -l pt -f   -o  .mp
gtts-cli -l pt -f   -o  .mp
gtts-cli -l pt -f   -o  .mp
gtts-cli -l pt -f   -o  .mp
gtts-cli -l pt -f   -o  .mp

Note: The number of lines (gtts-cli -l en -f -o .mp) need not be exactly the number of text files to translate but cannot be less than this number.

Case 1: Just generating the respective mp3 files from each text page: Enter the terminal into the folder where you saved files 1, 2, 3 and 4 and make the following command: $ chmod + x finish.sh; export PATH = $ PATH: $ pwd and then execute $ finish.sh.

Case 2: Saving files 1, 2, 3 and 4 together in a single file called book.mp3. I left in the folder only the text files 1, 2, 3 and 4. Then create a file in this folder called full.end.sh and put the following code into it and save:

#!/bin/bash
awk -F, '{print $1"3;"}' pre.full.gtts.txt > mp3.txt; awk '/\.mp3/{sub(".mp3",++count"&")} 1'  mp3.txt > pre.count.txt; awk '/\-o/{sub(" -o",++count"&")} 1'  pre.count.txt > pre.count1.txt; awk 'ORS=" "' pre.count1.txt > hor.mp3.txt; awk -F, '{print "#!/bin/bash \n "$1" "$2""}' hor.mp3.txt > gtts.sh; chmod +x gtts.sh; export PATH=$PATH:$pwd; gtts.sh

printf '#!/bin/bash'> oz.txt; awk -F, '{print $1"\n seq 1 4 > ozn1.txt"}' oz.txt > ozn.sh;chmod +x ozn.sh; ozn.sh; awk -F, '{print $1".mp3"}' ozn1.txt > ozn2.txt; awk 'ORS=" "' ozn2.txt > ozn3.txt; awk -F, '{print "#!/bin/bash \n cat "$1" > book.mp3"}' ozn3.txt > ozn4.sh; chmod +x ozn4.sh; ozn4.sh

Note 1: You must also have the pre.full.gts.txt file inside the Case 2 folder. Note 2: Note that the file range we want to put inside book.mp3 is set in the code snippet print $1"\n seq 1 4 . Run the finish.sh command (assuming you had already done $ export PATH=$PATH:$pwd; chmod + x finish.sh

Case 3: Saving pages 1 and 2 in a single mp3 file we'll call capitule1.mp3, and, saving pages 3 and 4 in another single mp3 file we'll call capitule2.mp3 To do so just add one more line (printf '#!/bin/bash'> oz.txt; awk -F, '{print $1"\n seq 1 4 > ozn1.txt"}' oz.txt > ozn.sh;chmod +x ozn.sh; ozn.sh; awk -F, '{print $1".mp3"}' ozn1.txt > ozn2.txt; awk 'ORS=" "' ozn2.txt > ozn3.txt; awk -F, '{print "#!/bin/bash \n cat "$1" > book.mp3"}' ozn3.txt > ozn4.sh; chmod +x ozn4.sh; ozn4.sh) in the file full.end.sh and change the range of the respective pages belonging to each chapter in the excerpt (e.g.: print $1"\n seq 3 4) e rename book.mp3 to capitule2.mp3 and the execute $ full.end.sh. See what the code will look like full.end.sh:

#!/bin/bash
awk -F, '{print $1"3;"}' pre.full.gtts.txt > mp3.txt; awk '/\.mp3/{sub(".mp3",++count"&")} 1'  mp3.txt > pre.count.txt; awk '/\-o/{sub(" -o",++count"&")} 1'  pre.count.txt > pre.count1.txt; awk 'ORS=" "' pre.count1.txt > hor.mp3.txt; awk -F, '{print "#!/bin/bash \n "$1" "$2""}' hor.mp3.txt > gtts.sh; chmod +x gtts.sh; export PATH=$PATH:$pwd; gtts.sh

printf '#!/bin/bash'> oz.txt; awk -F, '{print $1"\n seq 1 2 > ozn1.txt"}' oz.txt > ozn.sh;chmod +x ozn.sh; ozn.sh; awk -F, '{print $1".mp3"}' ozn1.txt > ozn2.txt; awk 'ORS=" "' ozn2.txt > ozn3.txt; awk -F, '{print "#!/bin/bash \n cat "$1" > capitule1.mp3"}' ozn3.txt > ozn4.sh; chmod +x ozn4.sh; ozn4.sh

printf '#!/bin/bash'> oz.txt; awk -F, '{print $1"\n seq 3 4 > ozn1.txt"}' oz.txt > ozn.sh;chmod +x ozn.sh; ozn.sh; awk -F, '{print $1".mp3"}' ozn1.txt > ozn2.txt; awk 'ORS=" "' ozn2.txt > ozn3.txt; awk -F, '{print "#!/bin/bash \n cat "$1" > capitule2.mp3"}' ozn3.txt > ozn4.sh; chmod +x ozn4.sh; ozn4.sh


