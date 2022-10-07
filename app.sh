#!/bin/bash

directory=/home/zidni/Downloads
folder=review

rm -rf $directory/$folder
mkdir $directory/$folder

filename=$(node /home/zidni/projects/setup-submission-review/getFilename.js)
echo "filename: $filename"

mv $directory/$filename.zip $directory/$folder/

unzip $directory/$folder/$filename.zip -d $directory/$folder/$filename

projectFolder=$(node /home/zidni/projects/setup-submission-review/getFolderProject.js)

code $directory/$folder/$filename
cp /home/zidni/Documents/env/env $projectFolder/.env
konsole --workdir $projectFolder -e npm i 

node /home/zidni/projects/setup-submission-review/dropTable.js
