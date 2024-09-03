@echo off
CHCP 65001

set /p HOST= 请输入主机地址:
set /p PORT= 请输入端口号:
set /p DATABASE= 请输入数据库名称:
set /p USER= 请输入用户名（默认sysdba, 只有sysdba有恢复数据库的权限）:

if "%USER%"=="" set USER=sysdba

pg_dump -h %HOST% -p %PORT% -U %USER% -d %DATABASE% -n public --exclude-table-data=hg_t_audit_log -v -Fc > store/highgo_backup.hgdmp

echo 请观察日志, 如果上述没有出现错误, 那么备份完成, 备份文件在当前目录store文件夹下, 名字为highgo_backup.hgdmp
pause
