#/bin/bash
echo -e "\033[41;37m start package ... \033[0m"
hugo -D ;
echo -e "\033[41;37m start git push ... \033[0m"

git add . ;
git commit -m "nromal publish" ;
git push ;
# scp -r /Users/apple/dev/mygithub/heimei.io/public root@144.48.243.96:/usr/share/nginx/html
# heimei.io

echo -e "\033[41;37m start exec deploy.sh \033[0m"
sshpass -p '57987a2a09e'  ssh root@144.48.243.96 > /dev/null 2>&1 <<sshoffmark ;

cd /app/heimei.io
git checkout .
git pull
chmod 777 deploy.sh
./deploy.sh
echo "deploy end..."

exit
sshoffmark