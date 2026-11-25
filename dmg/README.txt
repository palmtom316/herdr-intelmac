Herdr for Intel Mac (unofficial build, ad hoc signed)

1. 双击「安装 Herdr (双击).command」。若提示无法打开：右键 → 打开。
   它会把 Herdr.app 放进 /Applications，并把 herdr-core (hc) 装到 ~/.local/bin。
2. 也可以手动把 Herdr.app 拖进 Applications，然后在终端执行：
   xattr -dr com.apple.quarantine /Applications/Herdr.app
   App 首次启动找不到 core 时会自动下载官方 Intel 版 core。
Source: github.com/herdrdev/herdr-app, github.com/herdrdev/herdr-core (Apache-2.0)
