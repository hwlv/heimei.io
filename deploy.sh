#/bin/bash
echo "start deploy..."
# hugo -D 
# git add .
# git commit -m "nromal publish"
# git push
# scp -r /Users/apple/dev/mygithub/heimei.io/public root@144.48.243.96:/usr/share/nginx/html
# heimei.io

git pull

cd /usr/share/nginx/html
rm -rf *

cp /app/heimei.io/public/* /usr/share/nginx/html