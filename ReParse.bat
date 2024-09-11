::-----ReParse-----::

@echo off
echo REPARSE v1.1.1
call:rparselogo

echo querying file...
for /f "delims=" %%i in ('powershell -command "Add-Type -AssemblyName System.Windows.Forms; $file = New-Object System.Windows.Forms.OpenFileDialog; $file.ShowDialog() | Out-Null; $file.FileName; Remove-Variable -Name file"') do set filepath=%%i
IF "%filepath%"=="" (
   echo exited REPARSE
   echo:
   PAUSE
   exit
)
echo file chosen: %filepath%
set /p fpath="is this correct? [y,n]> "
IF "%fpath%"=="y" (
   call:invokeaccess "%filepath%"
) ELSE (
   echo "exited REPARSE"
   echo:
   PAUSE
   exit
)

::funcs::
:invokeaccess
echo attempting REPARSE proticols...
set __COMPAT_LAYER=RunAsInvoker
start /wait "" "%~1"
set __COMPAT_LAYER=
IF "%errorlevel%"=="0" (
   echo REPARSE successful
) ELSE IF "%errorlevel%"=="1602" ( ::userinstallcancellation
   echo REPARSE successful
) ELSE (
   echo:
   echo exit code "%errorlevel%"
   echo REPARSE warning: multiple things may have happened;
   echo this might include:
   echo    - "%~1" may require admin privileges
   echo    - program was cancelled by the user
   echo    - something entirely different...
   echo Check the ReParse github documentation for more information
   echo https://github.com/malachi196/ReParse/blob/main/errors-and-codes.md
)
echo:
PAUSE
exit
goto:EOF

:rparselogo
(
echo:
echo               ###  ##############                       
echo               #######################                   
echo               ########        #########                 
echo                                     #####             
echo         **                              **              
echo        ####         ##########                          
echo       #####         **********###                       
echo       ####          ***#   ***###          ##           
echo       ####          ***#   ***###         ######        
echo       ###           *********####        #########      
echo       ####          ***#########        #######         
echo       ####          ***########           ####          
echo       ####          ***#   #####          ####          
echo        ####         ####     ####        ####           
echo        #####       ######    #####      #####           
echo         #####       #####      ####    #####            
echo           #####    *******      #### #####              
echo             #######              #######                
echo               ########################                  
echo                  ##################                     
echo                        #####                            
echo:
)
goto:EOF