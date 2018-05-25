#!/usr/bin/env bash
sudo echo Elevated

cd libglez
git fetch >update.log
if ! git pull origin $(git rev-parse --abbrev-ref HEAD) >>update.log; then
    $DIALOG --title "Error" --backtitle "Updating"  --msgbox "An error occured while updating cathook, check update.log for details. It might have been caused by changes in local files - in that case try resetting local repo." 8 78
    exit
fi
if ! git submodule update --remote --recursive >>update.log; then
    $DIALOG --title "Error" --backtitle "Updating"  --msgbox "An error occured while updating cathook, check update.log for details. It might have been caused by changes in local files - in that case try resetting local repo." 8 78
    exit
fi
cd build; cmake ..; make;sudo make install;cd ..; cd ..

cd libxoverlay
git fetch >update.log
if ! git pull origin $(git rev-parse --abbrev-ref HEAD) >>update.log; then
    $DIALOG --title "Error" --backtitle "Updating"  --msgbox "An error occured while updating cathook, check update.log for details. It might have been caused by changes in local files - in that case try resetting local repo." 8 78
    exit
fi
if ! git submodule update --remote --recursive >>update.log; then
    $DIALOG --title "Error" --backtitle "Updating"  --msgbox "An error occured while updating cathook, check update.log for details. It might have been caused by changes in local files - in that case try resetting local repo." 8 78
    exit
fi
cd build; cmake ..; make;sudo make install;cd ..; cd ..

cd simple-ipc
git fetch >update.log
if ! git pull origin $(git rev-parse --abbrev-ref HEAD) >>update.log; then
    $DIALOG --title "Error" --backtitle "Updating"  --msgbox "An error occured while updating cathook, check update.log for details. It might have been caused by changes in local files - in that case try resetting local repo." 8 78
    exit
fi
if ! git submodule update --remote --recursive >>update.log; then
    $DIALOG --title "Error" --backtitle "Updating"  --msgbox "An error occured while updating cathook, check update.log for details. It might have been caused by changes in local files - in that case try resetting local repo." 8 78
    exit
fi
cd build; cmake ..; make;sudo make install;cd ..; cd ..

cd cathook
git fetch >update.log
if ! git pull origin $(git rev-parse --abbrev-ref HEAD) >>update.log; then
    $DIALOG --title "Error" --backtitle "Updating"  --msgbox "An error occured while updating cathook, check update.log for details. It might have been caused by changes in local files - in that case try resetting local repo." 8 78
    exit
fi
if ! git submodule update --remote --recursive >>update.log; then
    $DIALOG --title "Error" --backtitle "Updating"  --msgbox "An error occured while updating cathook, check update.log for details. It might have been caused by changes in local files - in that case try resetting local repo." 8 78
    exit
fi
cd build; cmake ..; make; cd ..; cd ..


cp -a -u ./cathook/tools/. ./; rm ./README; rm ./updater.sh