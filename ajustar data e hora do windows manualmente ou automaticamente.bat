@echo off
echo Claudio Santos Apresenta - O Editor de Data e Hora do Windows
echo Bem-vindo ao Editor de Data e Hora do Windows!

:menu
echo.
echo Voce deseja:
echo 1. Alterar a data e hora manualmente
echo 2. Restaurar data e hora automaticamente
echo 3. Sair
set /p choice="Escolha uma opcao (1/2/3): "

if "%choice%"=="1" goto manual
if "%choice%"=="2" goto automatic
if "%choice%"=="3" goto end
goto menu

:manual
set /p newdate="Digite a nova data (DD-MM-AAAA): "
set /p newtime="Digite a nova hora (HH:MM): "

echo.
echo Validando a data e hora...

REM Altera a data
date %newdate%
if errorlevel 1 (
    echo Data invalida. Por favor, tente novamente.
    goto manual
)

REM Altera a hora, adicionando os segundos como 00
time %newtime%:00
if errorlevel 1 (
    echo Hora invalida. Por favor, tente novamente.
    goto manual
)

echo.
echo Data e hora alteradas com sucesso!
pause
goto end

:automatic
echo.
echo Restaurando data e hora automaticamente...
w32tm /resync

echo Data e hora restauradas automaticamente!
pause
goto end

:end
exit
