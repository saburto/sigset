
/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     17-11-2009 14:03:08					    	*/
/* User DataBase										 		*/	
/*==============================================================*/


USE [master]
GO
CREATE LOGIN [dba_sigset] WITH PASSWORD=N'sigset', DEFAULT_DATABASE=[sigset], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'bulkadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'dbcreator'
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'diskadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'processadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'securityadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'serveradmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'setupadmin'
GO
EXEC master..sp_addsrvrolemember @loginame = N'dba_sigset', @rolename = N'sysadmin'
GO
USE [sigset]
GO
CREATE USER [dba_sigset] FOR LOGIN [dba_sigset]
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_accessadmin', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_backupoperator', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_datareader', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_datawriter', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_ddladmin', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_denydatareader', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_denydatawriter', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_owner', N'dba_sigset'
GO
USE [sigset]
GO
EXEC sp_addrolemember N'db_securityadmin', N'dba_sigset'
GO
