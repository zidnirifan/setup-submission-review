#!/bin/bash

directory=/home/zidni/Downloads
folder=review

echo "> Delete directory $directory/$folder"
rm -rf $directory/$folder
mkdir $directory/$folder

filename=$(node /home/zidni/projects/setup-submission-review/getFilename.js)
echo "> Filename: $filename.zip"

echo "> Move $filename.zip to $directory/$folder/"
mv $directory/$filename.zip $directory/$folder/

echo "> Unzip $filename.zip"
konsole -e unzip $directory/$folder/$filename.zip -d $directory/$folder/$filename

projectFolder=$(node /home/zidni/projects/setup-submission-review/getFolderProject.js)

echo "> Open VSCode on directory: $directory/$folder/$filename"
code "$projectFolder"

echo "> Copy env to $projectFolder/.env"
cp /home/zidni/Documents/env/env "$projectFolder/.env"

echo "> Install dependency on folder: $projectFolder"
konsole --workdir "$projectFolder" -e npm i 

node /home/zidni/projects/setup-submission-review/dropTable.js
