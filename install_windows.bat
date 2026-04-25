@echo off
chcp 65001 > nul
echo.
echo ╔══════════════════════════════════════╗
echo ║      Focus — Instalador Windows      ║
echo ╚══════════════════════════════════════╝
echo.

REM Verifica Python
python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python nao encontrado.
    echo    Instale em: https://www.python.org/downloads/
    echo    Marque a opcao "Add Python to PATH" durante a instalacao!
    pause
    exit /b 1
)

echo ✅ Python encontrado!
echo.
echo 📦 Instalando dependencias...
pip install customtkinter openpyxl fpdf2 pillow --quiet

if %errorlevel% neq 0 (
    echo ❌ Erro ao instalar dependencias.
    pause
    exit /b 1
)

echo ✅ Dependencias instaladas!
echo.

REM Diretório atual
set DIR=%~dp0

REM Cria o launcher .bat
set LAUNCHER=%DIR%Focus.bat
(
    echo @echo off
    echo cd /d "%DIR%"
    echo start pythonw "%DIR%myapp.py"
) > "%LAUNCHER%"

echo ✅ Launcher criado: Focus.bat
echo.

REM Cria atalho na área de trabalho
set SHORTCUT=%USERPROFILE%\Desktop\Focus.lnk
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SHORTCUT%'); $s.TargetPath = '%LAUNCHER%'; $s.WorkingDirectory = '%DIR%'; $s.Save()"

echo ✅ Atalho criado na area de trabalho!
echo.
echo ╔══════════════════════════════════════╗
echo ║   Instalacao concluida com sucesso!  ║
echo ║                                      ║
echo ║   Abra o app pelo atalho na          ║
echo ║   sua area de trabalho: Focus        ║
echo ╚══════════════════════════════════════╝
echo.
pause
