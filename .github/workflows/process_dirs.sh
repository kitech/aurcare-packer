#!/bin/bash
if [ ! -f "$RUNNER_TEMP/changed_dirs.txt" ]; then
    echo "not exist, $RUNNER_TEMP/changed_dirs.txt"
    exit
fi

resfiles=""
dirs=$(cat "$RUNNER_TEMP/changed_dirs.txt")
for dir in $dirs; do
    echo "Processing directory: $dir"
    resfile="$dir-result.txt.gz"
    if [ ! -f "$resfile" ] ; then
	touch "$resfile"
    fi
    dstr=`date`
    echo "$dir $dstr" >> $resfile
    resfiles="$resfiles $resfile"
done

echo "result_file=$resfiles" >> $GITHUB_OUTPUT
echo "artifact_name=release-$(date +%Y%m%d)" >> $GITHUB_OUTPUT
