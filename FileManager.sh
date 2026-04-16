#!/bin/bash

action=$1

case $action in

# 🔹 Directory Operations
addDir)
    mkdir -p $2/$3
    echo "Directory created: $2/$3"
    ;;

deleteDir)
    rm -r $2/$3
    echo "Directory deleted: $2/$3"
    ;;

listFiles)
    ls -p $2 | grep -v /
    ;;

listDirs)
    ls -p $2 | grep /
    ;;

listAll)
    ls $2
    ;;

# 🔹 File Operations
addFile)
    if [ -z "$4" ]; then
        touch $2/$3
    else
        echo "$4" > $2/$3
    fi
    echo "File created: $2/$3"
    ;;

addContentToFile)
    echo "$4" >> $2/$3
    ;;

addContentToFileBegining)
    temp=$(mktemp)
    echo "$4" > $temp
    cat $2/$3 >> $temp
    cat $temp > $2/$3
    rm $temp
    ;;

showFileBeginingContent)
    head -n $4 $2/$3
    ;;

showFileEndContent)
    tail -n $4 $2/$3
    ;;

showFileContentAtLine)
    head -n $4 $2/$3 | tail -n 1
    ;;

showFileContentForLineRange)
    head -n $5 $2/$3 | tail -n $(($5-$4+1))
    ;;

moveFile)
    mv $2 $3
    ;;

copyFile)
    cp $2 $3
    ;;

clearFileContent)
    > $2/$3
    ;;

deleteFile)
    rm $2/$3
    ;;

*)
    echo "Invalid command"
    ;;

esac
