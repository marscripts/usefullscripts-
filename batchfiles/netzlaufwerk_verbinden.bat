@echo off
REM Netzlaufwerke verbinden mit NAS-Server

REM ---- Erste Freigabe ----

REM IP-Adresse oder Hostname des ersten NAS
set NAS_SERVER_1=\\192.168.1.100

REM Freigabename des ersten Ordners auf dem NAS
set SHARE_NAME_1=\Freigabe1

REM Laufwerksbuchstaben für das erste Netzlaufwerk
set DRIVE_LETTER_1=Z:

REM Optional: Benutzername und Passwort für die erste Freigabe, falls benötigt
set USERNAME_1=deinBenutzername1
set PASSWORD_1=deinPasswort1

REM Überprüfen, ob das erste Netzlaufwerk bereits verbunden ist, und ggf. trennen
if exist %DRIVE_LETTER_1%\ (
    echo Trenne vorhandenes Netzlaufwerk %DRIVE_LETTER_1%
    net use %DRIVE_LETTER_1% /delete /yes
)

REM Erstes Netzlaufwerk verbinden
echo Verbinde Netzlaufwerk %DRIVE_LETTER_1% mit %NAS_SERVER_1%%SHARE_NAME_1%
net use %DRIVE_LETTER_1% %NAS_SERVER_1%%SHARE_NAME_1% /user:%USERNAME_1% %PASSWORD_1% /persistent:no

REM Verbindung prüfen für das erste Netzlaufwerk
if exist %DRIVE_LETTER_1%\ (
    echo Erstes Netzlaufwerk erfolgreich verbunden.
) else (
    echo Fehler beim Verbinden des ersten Netzlaufwerks.
)

REM ---- Zweite Freigabe ----

REM IP-Adresse oder Hostname des zweiten NAS (oder derselbe Server)
set NAS_SERVER_2=\\192.168.1.100

REM Freigabename des zweiten Ordners auf dem NAS
set SHARE_NAME_2=\Freigabe2

REM Laufwerksbuchstaben für das zweite Netzlaufwerk
set DRIVE_LETTER_2=Y:

REM Optional: Benutzername und Passwort für die zweite Freigabe, falls benötigt
set USERNAME_2=deinBenutzername2
set PASSWORD_2=deinPasswort2

REM Überprüfen, ob das zweite Netzlaufwerk bereits verbunden ist, und ggf. trennen
if exist %DRIVE_LETTER_2%\ (
    echo Trenne vorhandenes Netzlaufwerk %DRIVE_LETTER_2%
    net use %DRIVE_LETTER_2% /delete /yes
)

REM Zweites Netzlaufwerk verbinden
echo Verbinde Netzlaufwerk %DRIVE_LETTER_2% mit %NAS_SERVER_2%%SHARE_NAME_2%
net use %DRIVE_LETTER_2% %NAS_SERVER_2%%SHARE_NAME_2% /user:%USERNAME_2% %PASSWORD_2% /persistent:no

REM Verbindung prüfen für das zweite Netzlaufwerk
if exist %DRIVE_LETTER_2%\ (
    echo Zweites Netzlaufwerk erfolgreich verbunden.
) else (
    echo Fehler beim Verbinden des zweiten Netzlaufwerks.
)

pause
