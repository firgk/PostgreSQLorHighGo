@echo off
CHCP 65001

echo 还原的时候请清空库

set /p HOST= 请输入主机地址:
set /p PORT= 请输入端口号:
set /p DATABASE= 请输入数据库名称:
set /p USER= 请输入用户名（默认sysdba, 只有sysdba有恢复数据库的权限）:

if "%USER%"=="" set USER=sysdba

pg_restore -h %HOST% -p %PORT% -U %USER% -d %DATABASE% -v store/highgo_backup.hgdmp
echo 请观察日志, 如果上述没有出现错误,那么恢复完成, 从当前目录下, 名字为highgo_backup.hgdmp的备份文件恢复
pause
