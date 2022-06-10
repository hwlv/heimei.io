
# sed -i '' 's#/#/#g' 'grep ../../static -rl .test/a.md'

find ./content/ -type f -print0 | xargs -0 sed -i '' 's#../../static/#/#g'