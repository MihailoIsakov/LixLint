#! /bin/bash

elixirc main.ex | sort -u | awk '{print length, $0}' | sort -n
