:restart
@echo off
set cooldown=0
if not exist H:\SciFileShare\ ( mkdir H:\SciFileShare )
if not exist P:\SciFileShare\ ( mkdir P:\SciFileShare )

echo aby pobra� plik od kogo� stw�rz w folderze SciFileShare plik w ten spos�b [u�ytkownik udost�pniaj�cy plik]RQ.txt > "P:\SciFileShare\1 SciSciFileShare jak uzywac.txt"
echo np.andrewRQ.txt . w �rodku teko pliku piszesz nazw� pliku kt�ry chcesz pobra�, ten plik powinien si� pojawi� na publicu  >> "P:\SciFileShare\1 SciSciFileShare jak uzywac.txt"
echo aby wystawia� pliki do pobrania i po wiencej instrukcji zobacz na githuba >> "P:\SciFileShare\1 SciSciFileShare jak uzywac.txt"
echo https://github.com/sciAndrew/SciSciFileShare >> "P:\SciFileShare\1 SciSciFileShare jak uzywac.txt"

:start
if %TIME:~3,2%==00 ( del /f /q /s P:\SciFileShare\ && timeout 60 && goto restart )
echo %cooldown%
timeout 20
if %cooldown% gtr 0 ( set /A cooldown=%cooldown%-1 )
if not exist P:\SciFileShare\ ( mkdir P:\SciFileShare )
if not exist P:\SciFileShare\%USERNAME%_list.txt ( dir /B H:\SciFileShare\ > P:\SciFileShare\%USERNAME%_FileList.txt )
if exist P:\SciFileShare\%USERNAME%RQ.txt ( goto process ) else ( goto start )

:process

set /A cooldown=%cooldown%+10

set /p requested=<P:\SciFileShare\%USERNAME%RQ.txt
del /q P:\SciFileShare\%USERNAME%RQ.txt

if exist H:\SciFileShare\%requested% ( copy "H:\SciFileShare\%requested%" P:\ )

::echo %USERNAME% > "P:\SciFileShare\%USERNAME% on cooldown"

echo cooldown %cooldown%
timeout %cooldown%

::del /q "P:\SciFileShare\%USERNAME% on cooldown"

goto start