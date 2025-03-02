#!/bin/bash
USER=Max

date +%D
echo "Hello $USER!"
echo "Я работаю из директории: $(pwd)"
echo "Количество процессов bioset: $(ps -ef | grep bioset | grep -v grep | wc -l)"
echo "Права на файл /etc/passwd: $(ls -la /etc/passwd | awk '{print $1}')"
