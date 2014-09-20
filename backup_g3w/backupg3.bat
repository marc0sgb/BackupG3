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
echo Seleccione la particion que quiera copiar.
echo ...............................................
echo.
echo 1. EFS
echo 2. Recovery
echo 3. System
echo 4. Datos de usuario
echo 5. Todas las particiones
echo 6. Volver
echo 7. Salir
echo.

SET /P M=Elija la opcion que desee y presione ENTER:
IF %M%==1 GOTO EFS
IF %M%==2 GOTO RECOVERY
IF %M%==3 GOTO SYSTEM
IF %M%==4 GOTO USER
IF %M%==5 GOTO ALL
IF %M%==6 GOTO VOLVER
IF %M%==7 GOTO EOF


:EFS
echo.
echo [*] Copia de seguridad de la particion EFS
echo [*] Preparando ADB
adb kill-server
echo [*] Experando conexion con el dispositivo
adb wait-for-device
echo [*] Dispositivo detectado
echo [*] Creando copia de seguridad, espere por favor
adb shell "su -c mkdir /sdcard/backupg3/"
adb push scripts/efs.sh /sdcard/backupg3/efs.sh
adb shell "su -c sh /sdcard/backupg3/efs.sh"
adb pull /sdcard/backupg3/modemst1.img "%homedrive%\backupg3"
adb pull /sdcard/backupg3/modemst2.img "%homedrive%\backupg3"
echo [*] Borrando archivos temporales
adb shell rm -rf /sdcard/backupg3/
echo [*] Copias de seguridad creadas
pause
GOTO MENU

:RECOVERY
echo.
echo [*] Copia de seguridad de la particion Recovery
echo [*] Preparando ADB
adb kill-server
echo [*] Experando conexion con el dispositivo
adb wait-for-device
echo [*] Dispositivo detectado
echo [*] Creando copia de seguridad, espere por favor
adb shell "su -c mkdir /sdcard/backupg3/"
adb push scripts/recovery.sh /sdcard/backupg3/recovery.sh
adb shell "su -c sh /sdcard/backupg3/recovery.sh"
adb pull /sdcard/backupg3/recovery.img "%homedrive%\backupg3"
echo [*] Borrando archivos temporales
adb shell rm -rf /sdcard/backupg3/
echo [*] Copias de seguridad creadas
pause
GOTO MENU

:SYSTEM
echo [*] Copia de seguridad de la particion System
echo [*] Preparando ADB
adb kill-server
echo [*] Experando conexion con el dispositivo
adb wait-for-device
echo [*] Dispositivo detectado
echo [*] Creando copia de seguridad, espere por favor
adb shell "su -c mkdir /sdcard/backupg3/"
adb push scripts/system.sh /sdcard/backupg3/system.sh
adb shell "su -c sh /sdcard/backupg3/system.sh"
adb pull /sdcard/backupg3/system.img "%homedrive%\backupg3"
echo [*] Borrando archivos temporales
adb shell rm -rf /sdcard/backupg3/
echo [*] Copias de seguridad creadas
pause
GOTO MENU

:USER
echo [*] Copia de seguridad de la particion User
echo [*] Preparando ADB
adb kill-server
echo [*] Experando conexion con el dispositivo
adb wait-for-device
echo [*] Dispositivo detectado
echo [*] Creando copia de seguridad, espere por favor
adb shell "su -c mkdir /sdcard/backupg3/"
adb push scripts/user.sh /sdcard/backupg3/user.sh
adb shell "su -c sh /sdcard/backupg3/user.sh"
adb pull /sdcard/backupg3/cache.img "%homedrive%\backupg3"
adb pull /sdcard/backupg3/userdata.img "%homedrive%\backupg3"
echo [*] Borrando archivos temporales
adb shell rm -rf /sdcard/backupg3/
echo [*] Copias de seguridad creadas
pause
GOTO MENU

:ALL
echo [*] Copia de seguridad de todas las particiones
echo [*] Preparando ADB
adb kill-server
echo [*] Experando conexion con el dispositivo
adb wait-for-device
echo [*] Dispositivo detectado
echo [*] Creando copia de seguridad, espere por favor
adb shell "su -c mkdir /sdcard/backupg3/"
adb push scripts/backup.sh /sdcard/backupg3/backup.sh
adb shell "su -c sh /sdcard/backupg3/backup.sh"
adb pull /sdcard/backupg3/modemst1.img "%homedrive%\backupg3"
adb pull /sdcard/backupg3/modemst2.img "%homedrive%\backupg3"
adb pull /sdcard/backupg3/recovery.img "%homedrive%\backupg3"
adb pull /sdcard/backupg3/cache.img "%homedrive%\backupg3"
adb pull /sdcard/backupg3/userdata.img "%homedrive%\backupg3"
adb pull /sdcard/backupg3/system.img "%homedrive%\backupg3"
echo [*] Borrando archivos temporales
adb shell rm -rf /sdcard/backupg3/
echo [*] Copias de seguridad creadas
pause
GOTO MENU

:VOLVER
run.bat
