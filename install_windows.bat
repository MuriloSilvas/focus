@echo off
chcp 65001 > nul
echo.
echo ====================================
echo     Focus -- Instalador Windows
echo ====================================
echo.

REM Verifica Python via py launcher (mais confiavel no Windows)
py --version > nul 2>&1
if %errorlevel% equ 0 (
    set PYTHON=py
    for /f "tokens=*" %%i in ('py -c "import sys; print(sys.executable)"') do set PYTHON_EXE=%%i
    goto python_ok
)

REM Tenta python diretamente
python --version > nul 2>&1
if %errorlevel% equ 0 (
    set PYTHON=python
    for /f "tokens=*" %%i in ('python -c "import sys; print(sys.executable)"') do set PYTHON_EXE=%%i
    goto python_ok
)

REM Tenta python3
python3 --version > nul 2>&1
if %errorlevel% equ 0 (
    set PYTHON=python3
    for /f "tokens=*" %%i in ('python3 -c "import sys; print(sys.executable)"') do set PYTHON_EXE=%%i
    goto python_ok
)

echo ERRO: Python nao encontrado.
echo.
echo Instale o Python em: https://www.python.org/downloads/
echo IMPORTANTE: Durante a instalacao, marque a opcao
echo             "Add Python to PATH"
echo.
pause
exit /b 1

:python_ok
echo Python encontrado em: %PYTHON_EXE%
echo.
echo Instalando dependencias...
%PYTHON% -m pip install customtkinter openpyxl fpdf2 pillow --quiet

if %errorlevel% neq 0 (
    echo.
    echo ERRO ao instalar dependencias.
    echo Tente rodar como Administrador (clique direito > Executar como administrador)
    echo.
    pause
    exit /b 1
)

echo Dependencias instaladas com sucesso!
echo.

REM Diretorio atual
set DIR=%~dp0

REM Deriva o pythonw do caminho do python encontrado
set PYTHONW_EXE=%PYTHON_EXE:python.exe=pythonw.exe%
set PYTHONW_EXE=%PYTHONW_EXE:python3.exe=pythonw.exe%

REM Cria o launcher Focus.bat (abre sem janela de terminal)
set LAUNCHER=%DIR%Focus.bat
(
    echo @echo off
    echo cd /d "%DIR%"
    echo start "" "%PYTHONW_EXE%" "%DIR%myapp.py"
) > "%LAUNCHER%"

echo Launcher criado: Focus.bat
echo.

REM Atualiza o Abrir_Focus.vbs com o caminho correto do pythonw
set VBS=%DIR%Abrir_Focus.vbs
(
    echo Set objShell = CreateObject^("WScript.Shell"^)
    echo Set objFSO = CreateObject^("Scripting.FileSystemObject"^)
    echo strDir = objFSO.GetParentFolderName^(WScript.ScriptFullName^)
    echo strScript = strDir ^& "\myapp.py"
    echo objShell.CurrentDirectory = strDir
    echo objShell.Run """%PYTHONW_EXE%"" """ ^& strScript ^& """", 0, False
) > "%VBS%"

echo Launcher VBS atualizado!
echo.

REM Cria atalho na area de trabalho
set SHORTCUT=%USERPROFILE%\Desktop\Focus.lnk
powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SHORTCUT%'); $s.TargetPath = '%VBS%'; $s.WorkingDirectory = '%DIR%'; $s.IconLocation = '%DIR%icon.iconset\icon_512x512.png'; $s.Save()"

if %errorlevel% equ 0 (
    echo Atalho criado na Area de Trabalho!
) else (
    echo Nao foi possivel criar atalho, mas voce pode abrir pelo Focus.bat
)

echo.
echo ====================================
echo   Instalacao concluida!
echo.
echo   Para abrir o app:
echo   - Atalho "Focus" na Area de Trabalho
echo   - Ou clique duas vezes em Abrir_Focus.vbs
echo   - Ou clique duas vezes em Focus.bat
echo ====================================
echo.
pause
