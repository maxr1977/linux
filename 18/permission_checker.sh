#!/bin/bash

FILE_LIST=$(find /opt/131224-wdm -type f -name "*.sh")

for FILE in $FILE_LIST
do
        chmod +x "$FILE"
        echo "Добавлены права на исполнение для файла: $FILE"
done

echo "Установка прав завершены!"
