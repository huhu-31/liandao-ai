@echo off
chcp 65001 >nul
echo ========================================
echo   炼刀 AI 官网 - 一键部署脚本
echo ========================================
echo.

REM 检查 Git 是否安装
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 未检测到 Git，请先安装 Git
    echo 下载地址：https://git-scm.com/download/win
    pause
    exit /b 1
)

echo [步骤 1/4] 初始化 Git 仓库...
cd /d "%~dp0"
if not exist ".git" (
    git init
    echo ✓ Git 仓库初始化完成
) else (
    echo ✓ Git 仓库已存在
)
echo.

echo [步骤 2/4] 添加文件到暂存区...
git add .
echo ✓ 文件添加完成
echo.

echo [步骤 3/4] 提交更改...
git commit -m "炼刀 AI 官网初始版本 - 胡天龙"
echo ✓ 提交完成
echo.

echo [步骤 4/4] 检查远程仓库配置...
git remote -v | findstr origin
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ⚠ 尚未配置远程仓库
    echo.
    echo 请按以下步骤操作：
    echo 1. 访问 https://github.com/new 创建新仓库
    echo 2. 仓库名称建议：liandao-ai 或 lian-dao-ai
    echo 3. 复制仓库地址（HTTPS 或 SSH）
    echo 4. 运行命令：git remote add origin <仓库地址>
    echo 5. 运行命令：git push -u origin main
    echo.
) else (
    echo ✓ 远程仓库已配置
    echo.
    echo 推送代码到远程仓库：
    echo git push -u origin main
    echo.
)

echo ========================================
echo   部署准备完成！
echo ========================================
echo.
echo 下一步操作：
echo 1. 如果尚未创建 GitHub 仓库，请前往 github.com 创建
echo 2. 将代码推送到 GitHub
echo 3. 访问 vercel.com 或 netlify.com 导入仓库
echo 4. 绑定自定义域名（推荐：liandao.ai）
echo.
echo 详细部署指南请查看：DEPLOYMENT.md
echo.
pause
