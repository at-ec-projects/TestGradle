#!/bin/bash
#title           :gradletask.sh
#description     :set system java home variable and run gradle task
#author          :Abhishek Tiwari
#date            :07072020
#version         :1.0
#usage           :sh gradletask.sh


echo "Enter the source directory path:"
read src
if [ "$src" == "" ]
then
 echo "Kindly enter the path"
 exit
else
 echo "Src directory path is : $src"
 if [ -d $src ]
 then
   echo "Src directory found in the system"
   ls -l $src/
 else
   echo "No Src directory found in the system"
   exit
 fi
fi

echo "Enter the destination directory path:"
read dest
if [ "$dest" -eq "" ]
then
 echo "Kindly enter the path"
 exit
else
 echo "Dest directory path is : $dest"
 if [ -d $dest ]
 then
   echo "Dest directory found in the system" 
 else
   echo "No Dest directory found in the system"
 fi
fi

echo "Set system java home variable"
export JAVA_HOME=/usr/java/jdk1.8.0_131
export PATH=$PATH:$JAVA_HOME/bin
echo $PATH

echo "performing the gradle task"

gradlew copy -Psrc=$src -Pdest=$dest 2>error.txt

if [ $? -eq 0 ]
then
 echo "Gradle task completed"
 echo "Content of $dest directory is"
 ls -l $dest/
else
 echo "Gradle task has error, kindly check the error in ${PWD}/error.txt"
fi


