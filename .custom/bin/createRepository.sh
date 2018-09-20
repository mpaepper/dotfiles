#!/bin/bash
if [ $# -ne 2 ]; then
    echo "usage is to first enter the repository name to create e.g. shop/lemundo and then the folder to clone it to (relative to home directory)"
    exit 1
fi
TYPE=${1:0:4}
echo $TYPE
cd ~/gitolite-admin
echo "repo $1" >> ~/gitolite-admin/conf/gitolite.conf
echo "	RW+ = @super-devs @junior-devs" >> ~/gitolite-admin/conf/gitolite.conf
echo "  R   = @all-team" >> ~/gitolite-admin/conf/gitolite.conf
git add conf/gitolite.conf
git commit -m"Added new repository $1"
git push
cd ~/
git clone git@lemundo.de:$1 $2
cd ~/$2
touch README
echo "New repository $1" >> README
if [ $TYPE == "shop" ]; then
   touch modman
   cp /usr/local/bin/composerTemplate.json composer.json 
   git add composer.json
   git add modman
fi
git add README
git remote add master git@lemundo.de:$1
git commit -m"Adding readme"
git push origin master
echo "Created new repository, README file and branch master"
