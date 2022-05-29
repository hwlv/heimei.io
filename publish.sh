
echo "start deploy..."
# hugo -D 
git add .
git commit -m "nromal publish"
git push
# scp -r /Users/apple/dev/mygithub/heimei.io/public root@144.48.243.96:/usr/share/nginx/html
# heimei.io
# sshpass -p '57987a2a09e' ssh root@144.48.243.96 "cd /home && touch a.txt "


# cd /usr/share/nginx/html
# rm -rf *

echo "deploy end..."
