#!/bin/bash

CheckRoot()
{
   if [ `id -u` != 0 ]
   then
      echo "ERROR: You must be root user to run this program"
      exit
   fi  
}


