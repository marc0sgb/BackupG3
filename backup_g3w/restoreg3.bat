@echo off
CLS

:MENU
CLS
echo [*] Backup G3: Realiza y Restaura copia de las particiones de tu telefono
echo [*] Debe tener roteado y activado depuracion usb en su dispositivo
echo [*] v0.3
echo [*] by Marc0sgb
echo.
echo ...............................................
echo Seleccione la particion que desea restaurar.
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
echo [*] Restaurando particion EFS
echo [*] Preparando ADB
adb kill-server
echo [*] Experando conexion con el dispositivo
adb wait-for-device
echo [*] Dispositivo detectado
echo [*] Moviendo copia de seguridad, espere por favor
adb shell "su -c mkdir /sdcard/backupg3/"
adb push scripts/efsr.sh /sdcard/backupg3/efsr.sh
adb push "%homedrive%\backupg3\modemst1.img /sdcard/backupg3/modemst1.img"
adb push "%homedrive%\backupg3\modemst2.img /sdcard/backupg3/modemst2.img"
echo [*] Restaurando copia de seguridad
adb shell "su -c sh /sdcard/backupg3/efsr.sh"
echo [*] Borrando archivos temporales
adb shell rm -rf /sdcard/backupg3/
echo [*] Copia de seguridad restaurada
pause
GOTO MENU

:RECOVERY
echo.
echo [*] Restaurando particion Recovery
echo [*] Preparando ADB
adb kill-server
echo [*] Experando conexion con el dispositivo
adb wait-for-device
echo [*] Dispositivo detectado
echo [*] Moviendo copia de seguridad, espere por favor
adb shell "su -c mkdir /sdcard/backupg3/"
adb push scripts/recoveryr.sh /sdcard/backupg3/recoveryr.sh
adb push "%homedrive%\backupg3\recovery.img" "/sdcard/backupg3/recovery.img"
echo [*] Restaurando copia de seguridad
adb shell "su -c sh /sdcard/backupg3/recoveryr.sh"
echo [*] Borrando archivos temporales
adb shell rm -rf /sdcard/backupg3/
echo [*] Copia de seguridad restaurada
pause
GOTO MENU

:SYSTEM
echo [*] Restaurando particion System
echo [*] Preparando ADB
adb kill-server
echo [*] Experando conexion con el dispositivo
adb wait-for-device
echo [*] Dispositivo detectado
echo [*] Moviendo copia de seguridad, espere por favor
adb shell "su -c mkdir /sdcard/backupg3/"
adb push scripts/systemr.sh /sdcard/backupg3/systemr.sh
adb push "%homedrive%\backupg3\system.img" "/sdcard/backupg3/system.img"
echo [*] Restaurando copia de seguridad
adb shell "su -c sh /sdcard/backupg3/systemr.sh"
echo [*] Borrando archivos temporales
adb shell rm -rf /sdcard/backupg3/
echo [*] Copias de seguridad restaurada
pause
GOTO MENU

:USER
echo [*] Restaurando particion User
echo [*] Preparando ADB
adb kill-server
echo [*] Experando conexion con el dispositivo
adb wait-for-device
echo [*] Dispositivo detectado
echo [*] Moviendo copia de seguridad, espere por favor
adb shell "su -c mkdir /sdcard/backupg3/"
adb push scripts/userr.sh /sdcard/backupg3/userr.sh
adb push "%homedrive%\backupg3\cache.img" "/sdcard/backupg3/cache.img" 
adb push "%homedrive%\backupg3\userdata.img" "/sdcard/backupg3/userdata.img" 
echo [*] Restaurando copia de seguridad
adb shell "su -c sh /sdcard/backupg3/userr.sh"
echo [*] Borrando archivos temporales
adb shell rm -rf /sdcard/backupg3/
echo [*] Copias de seguridad restaurada
pause
GOTO MENU

:ALL
echo [*] Restaurando todas las particiones
echo [*] Preparando ADB
adb kill-server
echo [*] Experando conexion con el dispositivo
adb wait-for-device
echo [*] Dispositivo detectado
echo [*] Moviendo copia de seguridad, espere por favor
adb shell "su -c mkdir /sdcard/backupg3/"
adb push scripts/restore.sh /sdcard/backupg3/restore.sh
adb push "%homedrive%\backupg3\modemst1.img" /sdcard/backupg3/modemst1.img 
adb push "%homedrive%\backupg3\modemst2.img" /sdcard/backupg3/modemst2.img 
adb push "%homedrive%\backupg3\recovery.img" /sdcard/backupg3/recovery.img 
adb push "%homedrive%\backupg3\cache.img" /sdcard/backupg3/cache.img 
adb push "%homedrive%\backupg3\userdata.img" /sdcard/backupg3/userdata.img 
adb push "%homedrive%\backupg3\system.img" /sdcard/backupg3/system.img 
adb shell "su -c sh /sdcard/backupg3/restore.sh"
echo [*] Borrando archivos temporales
adb shell rm -rf /sdcard/backupg3/
echo [*] Copias de seguridad creadas
pause
GOTO MENU

:VOLVER
run.bat
