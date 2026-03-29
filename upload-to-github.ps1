# 炼刀 AI 官网 - GitHub Pages 自动上传脚本
# 使用方法：在 PowerShell 中运行 .\upload-to-github.ps1

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  炼刀 AI 官网 - GitHub Pages 部署工具" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 配置信息
$repoOwner = "huhu-31"
$repoName = "liandao-ai"
$branch = "main"
$uploadDir = $PSScriptRoot

Write-Host "仓库：$repoOwner/$repoName" -ForegroundColor Yellow
Write-Host "分支：$branch" -ForegroundColor Yellow
Write-Host "上传目录：$uploadDir" -ForegroundColor Yellow
Write-Host ""

# 检查 Git 是否安装
try {
    $gitVersion = git --version 2>&1
    Write-Host "✓ Git 已安装：$gitVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Git 未安装，请先安装 Git: https://git-scm.com/download/win" -ForegroundColor Red
    Write-Host ""
    Write-Host "或者手动上传：" -ForegroundColor Yellow
    Write-Host "1. 打开 https://github.com/huhu-31/liandao-ai/upload" -ForegroundColor White
    Write-Host "2. 将 liandao-ai 文件夹中的所有文件拖拽到上传区域" -ForegroundColor White
    Write-Host "3. 输入 Commit message: 'Initial commit - 炼刀 AI 官网'" -ForegroundColor White
    Write-Host "4. 点击 'Commit changes' 按钮" -ForegroundColor White
    exit 1
}

# 初始化 Git 仓库（如果还没有）
if (-not (Test-Path ".git")) {
    Write-Host "正在初始化 Git 仓库..." -ForegroundColor Cyan
    git init
}

# 添加远程仓库（如果还没有）
$remoteUrl = "https://github.com/$repoOwner/$repoName.git"
$currentRemote = git remote get-url origin 2>$null
if (-not $currentRemote) {
    Write-Host "正在添加远程仓库..." -ForegroundColor Cyan
    git remote add origin $remoteUrl
} else {
    Write-Host "✓ 远程仓库已配置" -ForegroundColor Green
}

# 添加所有文件
Write-Host "正在添加文件..." -ForegroundColor Cyan
git add .

# 提交更改
$message = "Initial commit - 炼刀 AI 官网"
Write-Host "正在提交：$message" -ForegroundColor Cyan
git commit -m $message

# 推送到 GitHub
Write-Host "正在推送到 GitHub..." -ForegroundColor Cyan
Write-Host ""
Write-Host "⚠️  需要输入 GitHub 用户名和密码（Token）" -ForegroundColor Yellow
Write-Host "   密码请使用 Personal Access Token:" -ForegroundColor Yellow
Write-Host "   https://github.com/settings/tokens" -ForegroundColor Yellow
Write-Host ""

git push -u origin $branch

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  ✓ 上传成功！" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "网站地址：" -ForegroundColor Cyan
    Write-Host "https://$repoOwner.github.io/$repoName/" -ForegroundColor White
    Write-Host ""
    Write-Host "启用 GitHub Pages：" -ForegroundColor Yellow
    Write-Host "1. 进入 https://github.com/$repoOwner/$repoName/settings/pages" -ForegroundColor White
    Write-Host "2. Source 选择 'Deploy from a branch'" -ForegroundColor White
    Write-Host "3. Branch 选择 '$branch'，文件夹选择 '/ (root)'" -ForegroundColor White
    Write-Host "4. 点击 Save" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "✗ 推送失败，请检查网络连接或认证信息" -ForegroundColor Red
}

Write-Host ""
Write-Host "按任意键退出..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
