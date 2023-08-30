#!/bin/bash

Max_files=2
Subtract_files=0
Files_dir="../"

Files_count () {
    local files_count=$(ls -p $Files_dir | grep -v / | wc -l)

    local sum=$(expr $files_count - $Subtract_files)

    echo "[ $(date) ]: $sum files were found." >> ./output.log

    return $sum
}

Check_files() {
    local Files=( $( ls -ptr $Files_dir | grep -v / ) )

    for i in $(seq 0 $1)
    do
        echo "[ $(date) ]: File ${Files[$i]} was deleted." >> ./output.log
        rm -f $Files_dir${Files[$i]}
    done
}

echo "[ $(date) ]: --- Job started ---" >> ./output.log
echo "Max files: $Max_files" >> ./output.log
echo "Subtract files: $Subtract_files" >> ./output.log
echo "Work dir: $Files_dir" >> ./output.log
echo "Executed by user: $(id --user)" >> ./output.log

Files_count

Found_files=$?

if [ $Found_files -gt $Max_files ]; then

    Del_files=$(expr $Found_files - $Max_files)

    echo "[ $(date) ]: $Del_files must be deleted." >> ./output.log

    Check_files $(expr $Del_files - 1)
else
    echo "[ $(date) ]: No file was deleted, the task was skipped." >> ./output.log
fi

echo "[ $(date) ]: --- Job stopped ---" >> ./output.log