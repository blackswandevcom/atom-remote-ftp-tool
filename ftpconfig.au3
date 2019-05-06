#NoTrayIcon
#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\Work\My Prog\HACK KIT\ICON DIRECTORY\_Icn database\download_from_cloud_filled-512.ico
#AutoIt3Wrapper_Outfile=atom remoteftp tool.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Res_Comment=Black Swan Lab atom/remote-ftp package Tool
#AutoIt3Wrapper_Res_Description=Atom/remote-ftp package tool
#AutoIt3Wrapper_Res_Fileversion=1.0.0.14
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_ProductName=Black Swan Lab atom/remote-ftp package Tool
#AutoIt3Wrapper_Res_ProductVersion=1.0.0.0
#AutoIt3Wrapper_Res_CompanyName=Black Swan Lab
#AutoIt3Wrapper_Res_LegalCopyright=Copyright (C) Black Swan Lab , All rights reserved.
#AutoIt3Wrapper_Res_LegalTradeMarks=Black Swan Lab is founded by Amirhosseinhpv
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <MsgBoxConstants.au3>
#include <Misc.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <FontConstants.au3>

Local $er = false;

If (IsArray($CmdLine) and $CmdLine[0] <> 0 and $CmdLine[1] <> "") Then
	$where = address_return_path($CmdLine[1])


	if FileExists($where & "\.ftpconfig") Then
		Local $iMsgBoxAnswer = MsgBox(260,"Black Swan Lab","FTPConfig file already exist here ! do you want to replace it ???")
		Select
			Case $iMsgBoxAnswer = 6 ;Yes
				FileDelete($where & "\.ftpconfig")
				FileWrite($where & "\.ftpconfig",FileRead(@WindowsDir&"\ShellNew\Template.ftpconfig"))
				Local $iMsgBoxAnswer = MsgBox(260,"Black Swan Lab","FTPConfig file replaced successfully at " & @CRLF & " >> " & $where & @CRLF & @CRLF & "You can change the template file's content and check other configurations , do you want to take a look???",45)
				Select
					Case $iMsgBoxAnswer = 6 ;Yes

					Case $iMsgBoxAnswer = 7 ;No
						Exit
					Case $iMsgBoxAnswer = -1 ;Timeout
						Exit
				EndSelect
			Case $iMsgBoxAnswer = 7 ;No
				Exit
			Case $iMsgBoxAnswer = -1 ;Timeout
				Exit
		EndSelect
	Else
		FileWrite($where & "\.ftpconfig",FileRead(@WindowsDir&"\ShellNew\Template.ftpconfig"))
		Local $iMsgBoxAnswer = MsgBox(260,"Black Swan Lab","FTPConfig file created successfully at " & @CRLF & " >> " & $where & @CRLF & @CRLF & "You can change the template file's content and check other configurations , do you want to take a look???",45)
		Select
			Case $iMsgBoxAnswer = 6 ;Yes

			Case $iMsgBoxAnswer = 7 ;No
				Exit
			Case $iMsgBoxAnswer = -1 ;Timeout
				Exit
		EndSelect
	EndIf

EndIf

#Region ### START Koda GUI section ### Form=F:\Project\Atom FtpConfig\Form1.kxf
$Form1 = GUICreate("Black Swan Lab atom/remote-ftp package Tool | Programmed by Amirhosseinhpv | Version 1.0.0", 710, 417, -1, -1, -1, BitOR($WS_EX_TOPMOST,$WS_EX_WINDOWEDGE))
GUISetFont(9,0,0,"Segoe UI")
$Group1 = GUICtrlCreateGroup(" Template file ", 8, 8, 521, 401)
$Edit1 = GUICtrlCreateEdit("", 16, 32, 505, 369)
ReadTemplate()
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup(" Operations ", 536, 8, 166, 401)
$Button1 = GUICtrlCreateButton(" Register FileType ", 544, 32, 150, 41)
$Button2 = GUICtrlCreateButton(" Add to ShellNew ", 544, 80, 150, 41)
$Button3 = GUICtrlCreateButton(" Remove from ShellNew ", 544, 128, 150, 41)

$Button4 = GUICtrlCreateButton(" Restore Default Template ", 544, 176, 150, 41)
$Button5 = GUICtrlCreateButton(" Save Template Content ", 544, 224, 150, 41)

GUICtrlCreateLabel("Programmed by ", 544, 352-60, 150, 17,0x01)
$Label4 = GUICtrlCreateLabel("Amirhosseinhpv", 574, 376-60, 90, 17,0x01)
GUICtrlSetTip(-1,"View Amirhosseinhpv's personal site")
GUICtrlSetColor(-1,0x0000ff)
GUICtrlSetFont(-1,8.5,400,4)
GUICtrlSetCursor(-1,4)
$Label3 = GUICtrlCreateLabel("Remote FTP for Atom", 559, 376-40+24, 120, 17,0x01) ;https://atom.io/packages/remote-ftp
GUICtrlSetTip(-1,"Enable browsing remote FTP/FTPS/SFTP just like the built-in Tree View - Atom Package")
GUICtrlSetColor(-1,0x0000ff)
GUICtrlSetFont(-1,8.5,400,4)
GUICtrlSetCursor(-1,4)
$Label2 = GUICtrlCreateLabel("Atom by Github", 574, 376-40+24+24, 90, 17,0x01) ; https://atom.io/ |
GUICtrlSetTip(-1,"A hackable text editor for the 21st Century by Github")
GUICtrlSetColor(-1,0x0000ff)
GUICtrlSetFont(-1,8.5,400,4)
GUICtrlSetCursor(-1,4)

GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1 ; register file type

			Local $er = "";
			$e = RegWrite("HKEY_CLASSES_ROOT\.ftpconfig","","REG_SZ","ftpconfig4atom")
			if $e <> 1 then	$er &= "1:" & @error & "/"

			$e = RegWrite("HKEY_CLASSES_ROOT\ftpconfig4atom","","REG_SZ","Atom/ftp-remote package config file")
			$e = RegWrite("HKEY_CLASSES_ROOT\ftpconfig4atom\DefaultIcon","","REG_SZ","%userprofile%\AppData\Local\atom\app.ico")
			if $e <> 1 then	$er &= "2:" & @error & "/"
			$e = RegWrite("HKEY_CLASSES_ROOT\ftpconfig4atom\shell","","REG_SZ",'open')
			if $e <> 1 then	$er &= "3:" & @error & "/"

			$e = RegWrite("HKEY_CLASSES_ROOT\ftpconfig4atom\shell\open","","REG_SZ",'Edit in Notepad')
			if $e <> 1 then	$er &= "4:" & @error & "/"
			$e = RegWrite("HKEY_CLASSES_ROOT\ftpconfig4atom\shell\open","Icon","REG_SZ",'notepad.exe')
			if $e <> 1 then	$er &= "7:" & @error & "/"
			$e = RegWrite("HKEY_CLASSES_ROOT\ftpconfig4atom\shell\open\command","","REG_SZ",'notepad.exe "%1"')
			if $e <> 1 then	$er &= "5:" & @error & "/"

			$e = RegWrite("HKEY_CLASSES_ROOT\ftpconfig4atom\shell\editinnotepad++","","REG_SZ",'Edit in Notepad++')
			if $e <> 1 then	$er &= "6:" & @error & "/"
			$e = RegWrite("HKEY_CLASSES_ROOT\ftpconfig4atom\shell\editinnotepad++","Icon","REG_SZ",'C:\Program Files\Notepad++\notepad++.exe,2')
			if $e <> 1 then	$er &= "7:" & @error & "/"
			$e = RegWrite("HKEY_CLASSES_ROOT\ftpconfig4atom\shell\editinnotepad++","MUIVerb","REG_SZ",'Edit in Notepad++')
			if $e <> 1 then	$er &= "8:" & @error & "/"
			$e = RegWrite("HKEY_CLASSES_ROOT\ftpconfig4atom\shell\editinnotepad++\command","","REG_SZ",'"C:\Program Files\Notepad++\notepad++.exe" "%1"')
			if $e <> 1 then	$er &= "9:" & @error & "/"

			$e = RegWrite("HKEY_CLASSES_ROOT\ftpconfig4atom\shell\editinatom","","REG_SZ",'Edit in Atom')
			if $e <> 1 then	$er &= "10:" & @error & "/"
			$e = RegWrite("HKEY_CLASSES_ROOT\ftpconfig4atom\shell\editinatom","Icon","REG_SZ",'%userprofile%\AppData\Local\atom\app.ico')
			if $e <> 1 then	$er &= "11:" & @error & "/"
			$e = RegWrite("HKEY_CLASSES_ROOT\ftpconfig4atom\shell\editinatom","MUIVerb","REG_SZ",'Edit in Atom')
			if $e <> 1 then	$er &= "12:" & @error & "/"
			$e = RegWrite("HKEY_CLASSES_ROOT\ftpconfig4atom\shell\editinatom\command","","REG_SZ",'%userprofile%\AppData\Local\atom\atom.exe "%1"')
			if $e <> 1 then	$er &= "13:" & @error & "/"


			if ($er == "") then
				MsgBox(262144,"","Successfully Done !",50,$Form1)
			Else
				MsgBox(262144,"","An error occurred ! " & @CRLF & "ERR: " & $er,50,$Form1)
			EndIf

		Case $Button2 ; add shellnew
			Local $aa = ""
			if @compiled then
				if not FileExists(@WindowsDir&"\ShellNew\ftpconf.exe") then
					FileCopy(@ScriptFullPath,@WindowsDir&"\ShellNew\ftpconf.exe")
				Else
					$old = @WindowsDir&"\ShellNew\ftpconf.exe"
					$new = @ScriptFullPath
					$vc = _VersionCompare ( FileGetVersion($new,"FileVersion"), FileGetVersion($old,"FileVersion") )
					if $vc == 1 then ; we are newer !
						FileCopy(@ScriptFullPath,@WindowsDir&"\ShellNew\ftpconf.exe",1)
						$aa = @CRLF & "Tool Updated to BUILD-" & FileGetVersion($new,"FileVersion")
					EndIf


				EndIf

			EndIf
			$er = ""

			$e = RegWrite("HKEY_CLASSES_ROOT\.ftpconfig\ShellNew","iconpath","REG_SZ",@WindowsDir&'\ShellNew\ftpconf.exe,0')
			if $e <> 1 then	$er &= "14:" & @error

			$e = RegWrite("HKEY_CLASSES_ROOT\.ftpconfig\ShellNew","MenuText","REG_SZ",'NEW FTP')
			if $e <> 1 then	$er &= "14:" & @error


			$e = RegWrite("HKEY_CLASSES_ROOT\.ftpconfig\ShellNew","command","REG_SZ",@WindowsDir&'\ShellNew\ftpconf.exe "%1"')
			if $e <> 1 then	$er &= "14:" & @error
			if ($er == "") then
				MsgBox(262144,"","Successfully Done !" & $aa,50,$Form1)
			Else
				MsgBox(262144,"","An error occurred ! " & @CRLF & "ERR: " & $er,50,$Form1)
			EndIf

		Case $Button3 ; remove shellnew
			$er = ""
			$e = RegDelete("HKEY_CLASSES_ROOT\.ftpconfig\ShellNew","command")
			if $e <> 1 then	$er &= "14:" & @error
			if ($er == "") then
				MsgBox(262144,"","Successfully Done !",50,$Form1)
			Else
				MsgBox(262144,"","An error occurred ! " & @CRLF & "ERR: " & $er,50,$Form1)
			EndIf
		Case $Button4 ; restore
			RestoreDefaultTemplate()
		Case $Button5 ; save
			SaveTemplate()
		Case $Label2
			ShellExecute("https://atom.io/")
		Case $Label3
			ShellExecute("https://atom.io/packages/remote-ftp")
		Case $Label4
			ShellExecute("https://amirhosseinhpv.ir/")
	EndSwitch
WEnd


Func RestoreDefaultTemplate()
	$defData = StringFormat("{\r\n    "&Chr(34)&"protocol"&Chr(34)&": "&Chr(34)&"ftp"&Chr(34)&",\r\n    "&Chr(34)&"host"&Chr(34)&": "&Chr(34)&"example.com"&Chr(34)&", // string - The hostname or IP address of the FTP server. Default: "&Chr(39)&"localhost"&Chr(39)&"\r\n    "&Chr(34)&"port"&Chr(34)&": 21, // integer - The port of the FTP server. Default: 21\r\n    "&Chr(34)&"user"&Chr(34)&": "&Chr(34)&"user"&Chr(34)&", // string - Username for authentication. Default: "&Chr(39)&"anonymous"&Chr(39)&"\r\n    "&Chr(34)&"pass"&Chr(34)&": "&Chr(34)&"pass"&Chr(34)&", // string - Password for authentication. Default: "&Chr(39)&"anonymous@"&Chr(39)&"\r\n    "&Chr(34)&"promptForPass"&Chr(34)&": false, // boolean - Set to true for enable password dialog. This will prevent from using cleartext password in this config. Default: false\r\n    "&Chr(34)&"remote"&Chr(34)&": "&Chr(34)&"/"&Chr(34)&",\r\n    "&Chr(34)&"secure"&Chr(34)&": false, // mixed - Set to true for both control and data connection encryption, "&Chr(39)&"control"&Chr(39)&" for control connection encryption only, or "&Chr(39)&"implicit"&Chr(39)&" for implicitly encrypted control connection (this mode is deprecated in modern times, but usually uses port 990) Default: false\r\n    "&Chr(34)&"secureOptions"&Chr(34)&": null, // object - Additional options to be passed to tls.connect(). Default: (null) see https://nodejs.org/api/tls.html#tls_tls_connect_options_callback\r\n    "&Chr(34)&"connTimeout"&Chr(34)&": 10000, // integer - How long (in milliseconds) to wait for the control connection to be established. Default: 10000\r\n    "&Chr(34)&"pasvTimeout"&Chr(34)&": 10000, // integer - How long (in milliseconds) to wait for a PASV data connection to be established. Default: 10000\r\n    "&Chr(34)&"keepalive"&Chr(34)&": 10000, // integer - How often (in milliseconds) to send a "&Chr(39)&"dummy"&Chr(39)&" (NOOP) command to keep the connection alive. Default: 10000\. If set to 0, keepalive is disabled.\r\n    "&Chr(34)&"watch"&Chr(34)&":[ // array - Paths to files, directories, or glob patterns that are watched and when edited outside of the atom editor are uploaded. Default : []\r\n        "&Chr(34)&"dist/stylesheets/main.css"&Chr(34)&", // reference from the root of the project.\r\n        "&Chr(34)&"dist/stylesheets/"&Chr(34)&",\r\n        "&Chr(34)&"dist/stylesheets/*.css"&Chr(34)&"\r\n    ],\r\n    "&Chr(34)&"watchTimeout"&Chr(34)&":500 // integer - The duration ( in milliseconds ) from when the file was last changed for the upload to begin.\r\n}")
	GUICtrlSetData($Edit1, $defData)
	MsgBox(262144,'','Default Content Restored! '&@CRLF&'You need to Save Template.',50,$Form1)
EndFunc
Func SaveTemplate()
	$data = GUICtrlRead($Edit1)
	FileDelete(@WindowsDir&"\ShellNew\Template.ftpconfig")
	FileWrite(@WindowsDir&"\ShellNew\Template.ftpconfig",$data)
	MsgBox(262144,'','Template Saved !',50,$Form1)
EndFunc
Func ReadTemplate()
	$read = FileRead(@WindowsDir&"\ShellNew\Template.ftpconfig")
	GUICtrlSetData($Edit1,$read)
EndFunc

Func GetFileSize($file)
	Local $iFileSize = FileGetSize($file)
	Local $iBytes = $iFileSize
	Local $iIndex, $aArray[9] = [' bytes', ' KB', ' MB', ' GB', ' TB', ' PB', ' EB', ' ZB', ' YB']
	While $iBytes > 1023
		$iIndex += 1
		$iBytes /= 1024
	WEnd
	Return Round($iBytes) & $aArray[$iIndex]
EndFunc   ;==>ByteSuffix
Func GetFolderSize($file)
	Local $iFileSize = DirGetSize($file,1)
	Local $iBytes = $iFileSize[0]
	Local $iIndex, $aArray[9] = [' bytes', ' KB', ' MB', ' GB', ' TB', ' PB', ' EB', ' ZB', ' YB']
	While $iBytes > 1023
		$iIndex += 1
		$iBytes /= 1024
	WEnd
	Return Round($iBytes) & $aArray[$iIndex] & " | " & $iFileSize[1] & " File(s) | " & $iFileSize[2] & " Folder(s)"
EndFunc   ;==>ByteSuffix
Func address_return_path($ad)
	Local $afilename = StringSplit($ad, "\")
	Return StringTrimRight($ad, StringLen($afilename[$afilename[0]]) + 1)
EndFunc
Func address_return_name($ad)
	Local $afilename = StringSplit($ad, "\")
	If NOT @error Then Return $afilename[$afilename[0]]
EndFunc
Func address_return_ext($ad, $fnodot = False)
	Local $iindex = _lastdelimiter(".\:", $ad)
	If ($iindex > 0) AND (StringMid($ad, $iindex, 1) = ".") Then
		If $fnodot Then
			Return StringMid($ad, $iindex + 1)
		Else
			Return StringMid($ad, $iindex)
		EndIf
	Else
		Return ""
	EndIf
EndFunc
Func address_return_fullname_without_ext($ad)
	$ext = address_return_ext($ad)
	Return StringTrimRight($ad, StringLen($ext))
EndFunc
Func _filegetsize($file)
	Local $ifilesize = FileGetSize($file)
	Local $ibytes = $ifilesize
	Local $iindex, $aarray[9] = [" bytes", " KB", " MB", " GB", " TB", " PB", " EB", " ZB", " YB"]
	While $ibytes > 1023
		$iindex += 1
		$ibytes /= 1024
	WEnd
	Return Round($ibytes) & $aarray[$iindex]
EndFunc
Func _lastdelimiter($sdelimiters, $sstring)
	Local $sdelimiter, $in
	For $ii = 1 To StringLen($sdelimiters)
		$sdelimiter = StringMid($sdelimiters, $ii, 1)
		$in = StringInStr($sstring, $sdelimiter, 0, -1)
		If $in > 0 Then Return $in
	Next
EndFunc
