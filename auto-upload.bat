@echo off
chcp 65001 >nul
echo ========================================
echo   炼刀 AI 官网 - GitHub 自动上传工具
echo ========================================
echo.

:: 设置变量
set REPO_OWNER=huhu-31
set REPO_NAME=liandao-ai
set BRANCH=main
set DESC=Initial commit - 炼刀 AI 官网

echo [步骤 1/3] 正在准备文件...
cd /d "%~dp0"

:: 将文件转换为 Base64
echo [步骤 2/3] 正在编码文件并上传到 GitHub...

:: 上传 index.html
powershell -Command "$file = 'index.html'; $content = [Convert]::ToBase64String([IO.File]::ReadAllBytes($file)); $json = '{\"message\":\"%DESC%\", \"content\":\"' + $content + '\"}'; curl -X PUT -H \"Authorization: Bearer %GH_TOKEN%\" -H \"Accept: application/vnd.github.v3+json\" https://api.github.com/repos/%REPO_OWNER%/%REPO_NAME%/contents/$file -d $json"

echo.
echo [步骤 3/3] 上传完成！
echo.
echo ========================================
echo   ✅ 文件已成功上传到 GitHub
echo   🌐 访问：https://github.com/%REPO_OWNER%/%REPO_NAME%
echo ========================================
echo.
pause
