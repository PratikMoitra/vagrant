#!/bin/bash


# This is a Case testing script.
case "${1}" in
  start)
    echo "starting..."
  ;;
  stop)
    echo "OK Stoping..."
    X=0
     while [[ "${X}" != 10 ]]
    do
      echo "$X # : ${RANDOM}"
      #echo ${X}
      ((X++));
      #echo "After Increment : $X"
      # sleep 1
    done
    echo "Stopped!"
  ;;
  status|state|--state|--status)
    echo "${1} is ... :"
  ;;
  *)
    echo "This is not  valid option. Please provide a valid option" >&2
    exit 1
    ;;
  esac
