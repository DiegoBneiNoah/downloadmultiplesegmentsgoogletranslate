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



