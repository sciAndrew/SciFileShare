@echo off
set cooldown=0
if not exist H:\FileShare\ ( mkdir H:\FileShare )

echo aby pobra� plik od kogo� stw�rz w folderze FileShare plik w ten spos�b [u�ytkownik udost�pniaj�cy plik]RQ.txt > "P:\FileShare\FileShare instrukca obs�ugi.txt"
echo np.andrewRQ.txt . w �rodku teko pliku piszesz nazw� pliku kt�ry chcesz pobra�, ten plik powinien si� pojawi� na publicu  >> "P:\FileShare\FileShare instrukca obs�ugi.txt"
echo aby wystawia� pliki do pobrania i po wiencej instrukcji zobacz na githuba >> "P:\FileShare\FileShare instrukca obs�ugi.txt"
echo [link do githuba] >> "P:\FileShare\FileShare instrukca obs�ugi.txt"

:start
if %TIME:~3,2%==00 ( del /f /q /s P:\FileShare\ && timeout 60 )
echo %cooldown%
timeout 10
if %cooldown% gtr 0 ( set /A cooldown=%cooldown%-1 )
if not exist P:\FileShare\ ( mkdir P:\FileShare )
if not exist P:\FileShare\%USERNAME%_list.txt ( dir /B H:\FileShare\ > P:\FileShare\%USERNAME%_FileList.txt )
if exist P:\FileShare\%USERNAME%RQ.txt ( goto process ) else ( goto start )

:process

set /A cooldown=%cooldown%+20

set /p requested=<P:\FileShare\%USERNAME%RQ.txt
del /q P:\FileShare\%USERNAME%RQ.txt

if exist H:\FileShare\%requested% ( copy "H:\FileShare\%requested%" P:\ )

::echo %USERNAME% > "P:\FileShare\%USERNAME% on cooldown"

echo cooldown %cooldown%
timeout %cooldown%

::del /q "P:\FileShare\%USERNAME% on cooldown"

goto start