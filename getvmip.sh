#!/usr/bin/env bash
ip n | grep virbr0 | awk '{print $1}'
