#!/usr/bin/env bash

exec sudo -E bash -c 'supervisord -c /etc/supervisord.conf -l /var/log/supervisord.log' &
sleep 10

wine 'C:\Program Files\Tencent\WeChat\WeChat.exe' &

sleep 10

#wine 'C:\DllInjector.exe' --process-name WeChat.exe --inject 'C:\wxhelper.dll' 2>&1

wine 'C:\DllInjector64.exe' 'C:\wxhelper.dll' 'WeChat.exe' 2>&1

wait
