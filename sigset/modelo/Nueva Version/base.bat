sqlcmd -S (local) -i "script\base.sql" -I
pause
sqlcmd -S (local) -i "script\crebas.sql" -I
pause
sqlcmd -S (local) -i "script\2 - scriptsGenericos.sql" -I
pause
sqlcmd -S (local) -i "script\3 - modulos.sql" -I
pause
sqlcmd -S (local) -i "script\4 - permisos.sql" -I
pause
sqlcmd -S (local) -i "script\5 - permisosyperfilpermiso.sql" -I
pause
sqlcmd -S (local) -i "script\6 - Procedimientos.sql" -I
pause
sqlcmd -S (local) -i "script\7 - usuarioSistema.sql" -I
sqlcmd -S (local) -i "script\8 - configOpciones.sql" -I
pause
sqlcmd -S (local) -i "script\9 - VistaReporte.sql" -I
pause
sqlcmd -S (local) -i "script\usuario.sql" -I
pause