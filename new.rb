#!/bin/sh

echo Creating new project $1

lein new $1

cd $1
cp ../template/* .
git init
git add .
git commit -m "initial commit"
mkdir checkouts
git submodule add git@github.com:overtone/overtone.git checkouts/overtone
git submodule add git@github.com:samaaron/clj-monome-serial.git checkouts/monome-serial
git submodule add git@github.com:improcess/polynome.git checkouts/polynome
git submodule add git@github.com:improcess/overtone-contrib.git checkouts/overtone-contrib
git add .
git commit -m "add subprojects as submodules"
./merge-checkout-deps.rb
