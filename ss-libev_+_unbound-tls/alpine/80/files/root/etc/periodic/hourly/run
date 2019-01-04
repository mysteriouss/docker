#!/bin/sh

# fix unbound memory leak by reload every day for now...
kill -USR1 `ps aux |grep unbound | grep -v grep | grep -v s6 | awk '{print $1}'`
