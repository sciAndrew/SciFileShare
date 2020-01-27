:restart
@echo off
set cooldown=0
if not exist H:\SciFileShare\ ( mkdir H:\SciFileShare )
if not exist P:\SciFileShare\ ( mkdir P:\SciFileShare )

Icacls P:\SciFileShare /grant:r Wszyscy:(D,W,R)

echo aby pobrac plik od kogos stworz w folderze SciFileShare plik w ten sposob [uzytkownik udostepniajocy plik]RQ.txt > "P:\SciFileShare\1 SciFileShare jak uzywac.txt"
echo np.andrewRQ.txt . w srodku teko pliku piszesz nazwe pliku ktory chcesz pobrac, ten plik powinien sie pojawic na publicu  >> "P:\SciFileShare\1 SciFileShare jak uzywac.txt"
echo aby wystawiac pliki do pobrania i po wiencej instrukcji zobacz na githuba >> "P:\SciFileShare\1 SciFileShare jak uzywac.txt"
echo https://github.com/sciAndrew/SciFileShare >> "P:\SciFileShare\1 SciFileShare jak uzywac.txt"

:start
if %TIME:~3,2%==00 ( del /f /q /s P:\SciFileShare\ && timeout 60 && goto restart )
echo %cooldown%
timeout 20
if %cooldown% gtr 0 ( set /A cooldown=%cooldown%-1 )
if not exist P:\SciFileShare\ ( goto restart )
if not exist P:\SciFileShare\%USERNAME%_list.txt ( dir /B H:\SciFileShare\ > P:\SciFileShare\%USERNAME%_FileList.txt )
if exist P:\SciFileShare\%USERNAME%RQ.txt ( goto process ) else ( goto start )

:process

set /p requested=<P:\SciFileShare\%USERNAME%RQ.txt
del /q P:\SciFileShare\%USERNAME%RQ.txt

if exist "H:\SciFileShare\%requested%" ( copy "H:\SciFileShare\%requested%" P:\ && set /A cooldown=%cooldown%+10)

::echo %USERNAME% > "P:\SciFileShare\%USERNAME% on cooldown"

echo cooldown %cooldown%
timeout %cooldown%

::del /q "P:\SciFileShare\%USERNAME% on cooldown"

goto start