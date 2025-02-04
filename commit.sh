#!/bin/bash
DATE=$(date +%m-%d)                 # 获取当前日期（格式：02-04）
FILE="docs/$(date +%Y-%m)/${DATE}.md" # 生成文件路径 docs/2025-02/02-04.md

# 如果当天文件不存在
if [ ! -f "$FILE" ]; then
  cp docs/template.md "$FILE"       # 使用模板创建新文件
  sed -i "1i ## $(date +%Y-%m-%d) 修改日志" "$FILE" # 插入带日期的标题
fi

code "$FILE"  # 用VSCode打开文件（需安装VSCode命令行工具）
git add .     # 添加所有修改
git commit -m "Update ${DATE} progress" # 提交
git push      # 推送到GitHub
