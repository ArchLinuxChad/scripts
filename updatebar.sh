#!/bin/bash

kill $(pstree -lp | grep "\-bar" | awk -F "(" '{print $4}' | sed 's/)//')
