#!/usr/bin/env bash

ram_usage() {
  FREE_RAM=$(free -h | grep Mem | awk '{print $4}') 
}

cpu_usage() {

  
}

main() {
  ram_usage
}

# run the script
main
