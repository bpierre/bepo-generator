REM Batch � lancer dans ...\msklc\bin\i386\ avec les 6 fichiers .klc
REM Il g�n�re les fichiers dlls avec kbdutool.exe
REM Penser � modificer le num�ro de version (set ver=...)
REM Le nom de la dll est en dos 8.3 donc le nom de version est abr�g� en rc2x
REM Il faut ensuite faire les fichiers d'installation avec msklc
REM (Attention a bien garder le m�me nom de dll.)
@echo off
set ver=rc2
md bepo%ver%a
md bepo%ver%b
md bepo%ver%c
cd bepo%ver%a
md amd64
md i386
md ia64
md sources
md wow64
cd..
cd bepo%ver%b
md amd64
md i386
md ia64
md sources
md wow64
cd..
cd bepo%ver%c
md amd64
md i386
md ia64
md sources
md wow64
cd..
copy fr-dvorak-bepo-%ver%A.klc bepo%ver%a.klc
kbdutool.exe -u -s fr-dvorak-bepo-%ver%A-kbd.klc
move /y bepo%ver%a.* bepo%ver%a/sources/
kbdutool.exe -u -x fr-dvorak-bepo-%ver%A-kbd.klc
move /y bepo%ver%a.dll bepo%ver%a/i386/
kbdutool.exe -u -i fr-dvorak-bepo-%ver%A-kbd.klc
move /y bepo%ver%a.dll bepo%ver%a/ia64/
kbdutool.exe -u -m fr-dvorak-bepo-%ver%A-kbd.klc
move /y bepo%ver%a.dll bepo%ver%a/amd64/
kbdutool.exe -u -o fr-dvorak-bepo-%ver%A-kbd.klc
move /y bepo%ver%a.dll bepo%ver%a/wow64/
copy fr-dvorak-bepo-%ver%B.klc bepo%ver%b.klc
kbdutool.exe -u -s fr-dvorak-bepo-%ver%B-kbd.klc
move /y bepo%ver%b.* bepo%ver%b/sources/
kbdutool.exe -u -x fr-dvorak-bepo-%ver%B-kbd.klc
move /y bepo%ver%b.dll bepo%ver%b/i386/
kbdutool.exe -u -i fr-dvorak-bepo-%ver%B-kbd.klc
move /y bepo%ver%b.dll bepo%ver%b/ia64/
kbdutool.exe -u -m fr-dvorak-bepo-%ver%B-kbd.klc
move /y bepo%ver%b.dll bepo%ver%b/amd64/
kbdutool.exe -u -o fr-dvorak-bepo-%ver%B-kbd.klc
move /y bepo%ver%b.dll bepo%ver%b/wow64/
copy fr-dvorak-bepo-%ver%C.klc bepo%ver%c.klc
kbdutool.exe -u -s fr-dvorak-bepo-%ver%C-kbd.klc
move /y bepo%ver%c.* bepo%ver%c/sources/
kbdutool.exe -u -x fr-dvorak-bepo-%ver%C-kbd.klc
move /y bepo%ver%c.dll bepo%ver%c/i386/
kbdutool.exe -u -i fr-dvorak-bepo-%ver%C-kbd.klc
move /y bepo%ver%c.dll bepo%ver%c/ia64/
kbdutool.exe -u -m fr-dvorak-bepo-%ver%C-kbd.klc
move /y bepo%ver%c.dll bepo%ver%c/amd64/
kbdutool.exe -u -o fr-dvorak-bepo-%ver%C-kbd.klc
move /y bepo%ver%c.dll bepo%ver%c/wow64/