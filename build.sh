
# sed -i '' 's#/#/#g' 'grep ../../static -rl .test/a.md'


# 移动typra 的 assets图片到static/img 下面
cp content/posts/assets/* static/img
# 替换路径
find ./content/ -type f -print0 | xargs -0 sed -i '' 's#../../static/#/#g'
find ./content/ -type f -print0 | xargs -0 sed -i '' 's#assets/#/img/#g'