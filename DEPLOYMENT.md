# 炼刀 AI 官网 - 部署指南

## 🌐 网站命名方案

为您精选了以下简洁高级的域名名称：

### 推荐方案（按优先级排序）

#### 1. **炼刀 AI** → `liandao.ai` ⭐⭐⭐⭐⭐
- **特点**：最简洁、最专业，直接对应品牌名
- **优势**：`.ai` 域名完美契合 AI 产品定位，国际化程度高
- **记忆度**：极易记忆，拼音 + 行业后缀
- **适用场景**：官方主站、品牌形象展示

#### 2. **炼刀智能** → `liandao.io` ⭐⭐⭐⭐
- **特点**：科技感强，`.io` 代表输入输出，象征智能化
- **优势**：技术圈认可度高，简洁有力
- **记忆度**：简短易记
- **适用场景**：技术文档、开发者平台

#### 3. **炼刀科技** → `ldtech.cn` / `ldtech.com` ⭐⭐⭐⭐
- **特点**：缩写形式，更短更简洁
- **优势**：LD 两个字母极简，国际化
- **记忆度**：超短域名，稀缺性强
- **适用场景**：企业官网、商务合作

#### 4. **炼刀员工** → `aistaff.cn` ⭐⭐⭐
- **特点**：直译"AI 员工"概念
- **优势**：直观表达产品定位
- **记忆度**：英文组合，易于理解
- **适用场景**：产品推广、营销页面

#### 5. **炼刀工作台** → `ldwork.ai` ⭐⭐⭐
- **特点**：强调工作场景应用
- **优势**：结合品牌缩写和功能描述
- **记忆度**：清晰表达用途
- **适用场景**：SaaS 平台、工作台入口

---

## 🚀 公网部署方案

### 方案一：Vercel 部署（推荐）⭐⭐⭐⭐⭐

**优势**：
- 免费 HTTPS 证书
- 自动 CDN 加速
- 支持自定义域名
- 一键部署，无需配置服务器
- 全球访问速度快

**部署步骤**：

1. **访问 Vercel**
   - 打开 https://vercel.com
   - 使用 GitHub / GitLab / Bitbucket 账号登录

2. **导入项目**
   - 点击 "Add New Project"
   - 选择 "Import Git Repository"
   - 将 `liandao-ai` 文件夹推送到 GitHub 仓库
   - 或者使用 Vercel CLI：
     ```bash
     npm install -g vercel
     cd liandao-ai
     vercel login
     vercel
     ```

3. **配置域名**
   - 在项目设置中找到 "Domains"
   - 添加您购买的域名（如 `liandao.ai`）
   - 按照提示配置 DNS 解析

4. **完成部署**
   - Vercel 会自动构建并部署
   - 获得免费域名：`liandao-ai.vercel.app`
   - 绑定自定义域名后即可访问

**预计耗时**：5-10 分钟

---

### 方案二：Netlify 部署 ⭐⭐⭐⭐⭐

**优势**：
- 拖拽上传即可部署
- 免费 HTTPS
- 支持表单收集
- 内置分析功能

**部署步骤**：

1. **访问 Netlify**
   - 打开 https://netlify.com
   - 注册/登录账号

2. **上传文件**
   - 进入 "Sites" 页面
   - 直接将 `liandao-ai` 文件夹拖拽到上传区域
   - 或者连接 GitHub 仓库自动部署

3. **配置域名**
   - 点击 "Domain settings"
   - 添加自定义域名
   - 配置 DNS 记录

4. **完成部署**
   - 获得免费域名：`liandao-ai.netlify.app`
   - 绑定自定义域名后生效

**预计耗时**：3-5 分钟

---

### 方案三：GitHub Pages 部署 ⭐⭐⭐⭐

**优势**：
- 完全免费
- 与代码仓库集成
- 适合开源项目

**部署步骤**：

1. **创建 GitHub 仓库**
   ```bash
   cd liandao-ai
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin <your-repo-url>
   git push -u origin main
   ```

2. **启用 GitHub Pages**
   - 进入仓库 Settings → Pages
   - Source 选择 "main branch"
   - 保存后获得域名：`<username>.github.io/liandao-ai`

3. **配置自定义域名**
   - 在 Pages 设置中添加自定义域名
   - 创建根目录下的 `CNAME` 文件，内容为您的域名

**预计耗时**：10-15 分钟

---

### 方案四：Cloudflare Pages 部署 ⭐⭐⭐⭐

**优势**：
- 全球最快 CDN
- 免费无限带宽
- 内置 DDoS 防护

**部署步骤**：

1. **访问 Cloudflare**
   - 打开 https://pages.cloudflare.com
   - 登录/注册账号

2. **连接仓库**
   - 连接 GitHub 账号
   - 选择 `liandao-ai` 仓库
   - 配置构建设置（静态网站无需构建命令）

3. **配置域名**
   - 在项目中添加自定义域名
   - Cloudflare 自动处理 SSL 证书

**预计耗时**：5-10 分钟

---

## 📋 部署前检查清单

- [ ] 确认 `index.html` 文件完整
- [ ] 测试本地运行正常（http://localhost:8080）
- [ ] 准备域名（推荐购买 `.ai` 或 `.com` 后缀）
- [ ] 选择部署平台（推荐 Vercel 或 Netlify）
- [ ] 注册对应平台账号
- [ ] 准备好 GitHub 账号（如需关联仓库）

---

## 💡 快速部署脚本

如果您已安装 Node.js 和 Git，可执行以下命令一键部署到 Vercel：

```bash
# 1. 安装 Vercel CLI
npm install -g vercel

# 2. 登录 Vercel
vercel login

# 3. 进入项目目录
cd liandao-ai

# 4. 部署到 Vercel
vercel --prod

# 5. 绑定自定义域名
vercel domains add liandao.ai
```

---

## 🎯 推荐执行路径

**最快上线方案（15 分钟内完成）**：

1. **立即行动**：
   - 访问 https://vercel.com
   - 用 GitHub 账号登录
   - 创建新仓库并上传 `liandao-ai` 文件夹内容
   - Vercel 自动部署，获得临时域名

2. **购买域名**（可选但推荐）：
   - 访问 https://namesilo.com 或 https://aliyun.com
   - 搜索并购买 `liandao.ai` 或其他心仪域名
   - 费用参考：`.ai` 域名约 $60-80/年，`.com` 约 $10-15/年

3. **绑定域名**：
   - 在 Vercel 项目设置中添加购买的域名
   - 按照提示配置 DNS 解析
   - 等待 DNS 生效（通常 10 分钟 -24 小时）

4. **完成**：
   - 访问您的自定义域名
   - 网站正式上线！

---

## 📞 需要帮助？

如果在部署过程中遇到任何问题，请随时告知我，我会为您提供详细的技术支持。

**祝您的炼刀 AI 官网顺利上线！** 🚀
