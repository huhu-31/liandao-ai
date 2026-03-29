# 炼刀 AI 官网 - GitHub 自动上传脚本
# 使用 GitHub API 直接上传所有文件

$ErrorActionPreference = "Stop"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  炼刀 AI 官网 - GitHub 自动上传工具" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 配置参数
$repoOwner = "huhu-31"
$repoName = "liandao-ai"
$branch = "main"
$commitMessage = "Initial commit - 炼刀 AI 官网"

# 切换到脚本所在目录
Set-Location -Path $PSScriptRoot

Write-Host "[步骤 1/4] 正在扫描项目文件..." -ForegroundColor Yellow
$files = @(
    "index.html",
    "vercel.json",
    "_redirects",
    "CNAME",
    ".gitignore",
    "README.md",
    "DEPLOYMENT.md",
    "DOMAIN-GUIDE.md",
    "deploy.bat",
    "快速上传指南.md"
)

Write-Host "  找到 $($files.Count) 个文件待上传" -ForegroundColor Green
Write-Host ""

# 检查是否已有 GitHub Token
$ghToken = $env:GH_TOKEN
if (-not $ghToken) {
    Write-Host "⚠️  未检测到 GitHub Token" -ForegroundColor Red
    Write-Host ""
    Write-Host "请按以下步骤获取 Token：" -ForegroundColor Yellow
    Write-Host "1. 访问 https://github.com/settings/tokens" -ForegroundColor White
    Write-Host "2. 点击 'Generate new token (classic)'" -ForegroundColor White
    Write-Host "3. 勾选 'repo' 权限" -ForegroundColor White
    Write-Host "4. 复制生成的 token" -ForegroundColor White
    Write-Host ""
    $ghToken = Read-Host "然后在此粘贴您的 GitHub Token"
}

Write-Host ""
Write-Host "[步骤 2/4] 开始上传文件到 GitHub..." -ForegroundColor Yellow
Write-Host ""

$successCount = 0
$failCount = 0

foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "  ⏳ 上传：$file" -NoNewline
        
        try {
            # 读取文件并转换为 Base64
            $bytes = [IO.File]::ReadAllBytes($file)
            $contentBase64 = [Convert]::ToBase64String($bytes)
            
            # 构建 API URL
            $apiUrl = "https://api.github.com/repos/$repoOwner/$repoName/contents/$file"
            
            # 构建请求体
            $body = @{
                message = $commitMessage
                content = $contentBase64
                branch = $branch
            } | ConvertTo-Json
            
            # 发送 PUT 请求
            $headers = @{
                "Authorization" = "token $ghToken"
                "Accept" = "application/vnd.github.v3+json"
                "User-Agent" = "PowerShell-Uploader"
            }
            
            $response = Invoke-RestMethod -Uri $apiUrl -Method Put -Headers $headers -Body $body -ContentType "application/json"
            
            Write-Host " ✅" -ForegroundColor Green
            $successCount++
        }
        catch {
            Write-Host " ❌" -ForegroundColor Red
            Write-Host "     错误：$($_.Exception.Message)" -ForegroundColor Red
            $failCount++
        }
    } else {
        Write-Host "  ⚠️  跳过：$file (文件不存在)" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "[步骤 3/4] 上传完成！" -ForegroundColor Green
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  📊 上传结果统计" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  ✅ 成功：$successCount 个文件" -ForegroundColor Green
Write-Host "  ❌ 失败：$failCount 个文件" -ForegroundColor Red
Write-Host ""
Write-Host "  🌐 仓库地址:" -ForegroundColor Cyan
Write-Host "     https://github.com/$repoOwner/$repoName" -ForegroundColor White
Write-Host ""
Write-Host "  🚀 下一步操作:" -ForegroundColor Yellow
Write-Host "     1. 进入仓库 Settings → Pages" -ForegroundColor White
Write-Host "     2. Source 选择 'Deploy from a branch'" -ForegroundColor White
Write-Host "     3. Branch 选择 'main', folder 选择 '/'" -ForegroundColor White
Write-Host "     4. 点击 Save,等待 1-2 分钟" -ForegroundColor White
Write-Host ""
Write-Host "  🌍 您的网站即将上线:" -ForegroundColor Green
Write-Host "     https://$repoOwner.github.io/$repoName/" -ForegroundColor White
Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan

# 自动打开仓库页面
Start-Process "https://github.com/$repoOwner/$repoName/settings/pages"
