@echo off
chcp 65001 > nul
echo.
echo ====================================
echo     Focus -- Instalador Windows
echo ====================================
echo.

REM Verifica Python via py launcher
py --version > nul 2>&1
if %errorlevel% equ 0 (
    set PYTHON=py
    for /f "tokens=*" %%i in ('py -c "import sys; print(sys.executable)"') do set PYTHON_EXE=%%i
    goto python_ok
)

python --version > nul 2>&1
if %errorlevel% equ 0 (
    set PYTHON=python
    for /f "tokens=*" %%i in ('python -c "import sys; print(sys.executable)"') do set PYTHON_EXE=%%i
    goto python_ok
)

echo ERRO: Python nao encontrado.
echo Instale em: https://www.python.org/downloads/
echo Marque "Add Python to PATH" durante a instalacao!
pause
exit /b 1

:python_ok
echo Python encontrado: %PYTHON_EXE%
echo.

REM Deriva pythonw do caminho do python
set PYTHONW_EXE=%PYTHON_EXE:python.exe=pythonw.exe%

echo Instalando dependencias...
%PYTHON% -m pip install customtkinter openpyxl fpdf2 pillow --quiet

if %errorlevel% neq 0 (
    echo ERRO ao instalar dependencias.
    echo Tente rodar como Administrador.
    pause
    exit /b 1
)

echo Dependencias instaladas!
echo.

set DIR=%~dp0

REM Converte icon PNG para ICO para usar no atalho Windows
set ICON_PNG=%DIR%icon.iconset\icon_256x256.png
set ICON_ICO=%DIR%icon.ico
%PYTHON% -c "from PIL import Image; img = Image.open(r'%ICON_PNG%'); img.save(r'%ICON_ICO%', format='ICO', sizes=[(256,256),(128,128),(64,64),(32,32),(16,16)])" 2>nul
if exist "%ICON_ICO%" (
    echo Icone convertido para Windows!
) else (
    echo Icone nao convertido, usando padrao.
    set ICON_ICO=%DIR%icon.iconset\icon_256x256.png
)

REM Cria Focus.bat usando pythonw (sem CMD)
(
    echo @echo off
    echo start "" "%PYTHONW_EXE%" "%DIR%myapp.py"
) > "%DIR%Focus.bat"

REM Cria Abrir_Focus.vbs usando pythonw (sem CMD)
(
    echo Set objShell = CreateObject^("WScript.Shell"^)
    echo objShell.CurrentDirectory = "%DIR%"
    echo objShell.Run """%PYTHONW_EXE%"" ""%DIR%myapp.py""", 0, False
) > "%DIR%Abrir_Focus.vbs"

echo Launchers criados!
echo.

REM Cria atalho na area de trabalho com icone
set SHORTCUT_VBS=%TEMP%\criar_atalho.vbs
(
    echo Set oWS = WScript.CreateObject^("WScript.Shell"^)
    echo sLinkFile = oWS.SpecialFolders^("Desktop"^) ^& "\Focus.lnk"
    echo Set oLink = oWS.CreateShortcut^(sLinkFile^)
    echo oLink.TargetPath = "%DIR%Abrir_Focus.vbs"
    echo oLink.WorkingDirectory = "%DIR%"
    echo oLink.IconLocation = "%ICON_ICO%"
    echo oLink.Description = "Focus - Task Manager"
    echo oLink.Save
) > "%SHORTCUT_VBS%"

cscript //nologo "%SHORTCUT_VBS%"
del "%SHORTCUT_VBS%"

echo Atalho criado na Area de Trabalho com icone!
echo.
echo ====================================
echo   Instalacao concluida!
echo.
echo   Abra o app pelo atalho "Focus"
echo   na sua Area de Trabalho.
echo ====================================
echo.
pause
