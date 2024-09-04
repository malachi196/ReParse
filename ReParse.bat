:ReParse

@echo off

echo "querying file..."
for /f "delims=" %%i in ('powershell -command "Add-Type -AssemblyName System.Windows.Forms; $file = New-Object System.Windows.Forms.OpenFileDialog; $file.ShowDialog() | Out-Null; $file.FileName; Remove-Variable -Name file"') do set filepath=%%i

echo "attempting INVOKER proticols..."
set __COMPAT_LAYER=RunAsInvoker
start /wait "" "%filepath%"
echo %errorlevel%
set __COMPAT_LAYER=
echo "INVOKER successful"
PAUSE
