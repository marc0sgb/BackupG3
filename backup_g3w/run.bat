@echo off
CLS

md "%homedrive%\backupg3"

:MENU
CLS
echo [*] Backup G3: Realiza y Restaura copia de las particiones de tu telefono
echo [*] Debe tener roteado y activado depuracion usb en su dispositivo
echo [*] v0.3
echo [*] by Marc0sgb
echo.
echo ...............................................
echo Seleccione que accion desea realizar.
echo ...............................................
echo.
echo 1. Copia de seguridad
echo 2. Restaurar copia de seguridad
echo 3. Salir
echo.

SET /P M=Elija la opcion que desee y presione ENTER:
IF %M%==1 GOTO COPIA
IF %M%==2 GOTO RESTAURAR
IF %M%==3 GOTO EOF

:COPIA
backupg3.bat

:RESTAURAR
restoreg3.bat

