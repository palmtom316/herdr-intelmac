#!/bin/bash
# 安装 Herdr (Intel)：把 Herdr.app 拷到 /Applications，把 herdr-core 装进 ~/.local/bin
set -e
here="$(cd "$(dirname "$0")" && pwd)"
echo "== 安装 Herdr.app 到 /Applications"
rm -rf /Applications/Herdr.app
cp -R "$here/Herdr.app" /Applications/
xattr -dr com.apple.quarantine /Applications/Herdr.app 2>/dev/null || true
echo "== 安装 herdr-core (hc) 到 ~/.local/bin"
tmp=$(mktemp -d)
cp -R "$here/Herdr Core.app" "$tmp/"
xattr -dr com.apple.quarantine "$tmp/Herdr Core.app" 2>/dev/null || true
mkdir -p "$HOME/.local/bin"
core="$tmp/Herdr Core.app/Contents/MacOS/herdr-core"
if [ -x "$HOME/.local/bin/herdr-core" ]; then
  "$core" --hc-install-bundle "$core" "$HOME/.local/bin/herdr-core"
  "$HOME/.local/bin/herdr-core" server restart >/dev/null 2>&1 || true
else
  "$core" --hc-install-bundle "$core" "$HOME/.local/bin/herdr-core"
fi
[ -e "$HOME/.local/bin/hc" ] || ln -s herdr-core "$HOME/.local/bin/hc"
"$HOME/.local/bin/herdr-core" --version
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) echo "提示：把 ~/.local/bin 加到 PATH 才能在终端里用 hc";; esac
echo "完成，可以从「应用程序」打开 Herdr。"
