#!/bin/bash
#title           :gradletask.sh
#description     :set system java home variable and run gradle task
#author          :Abhishek Tiwari
#date            :07072020
#version         :1.0
#usage           :sh gradletask.sh


echo "source directory path is:"
echo $1
echo "destination directory path is:"
echo $2

echo "Set system java home variable"
export JAVA_HOME=/usr/java/jdk1.8.0_131
export PATH=$PATH:$JAVA_HOME/bin
echo $PATH

echo "performing the gradle task"

/usr/local/bin/gradlew copy -Psrc=$1 -Pdest=$2 2>error.txt

if [ $? -eq 0 ]
then
 echo "Gradle task completed"
 echo "Content of $dest directory is"
 ls -l $2/
else
 echo "Gradle task has error, kindly check the error in ${PWD}/error.txt"
fi


