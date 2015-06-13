#!/bin/bash

branch=master
output=commits.csv
commits=$(git rev-list --remove-empty $branch)

echo "commit,time,files,blank,comment,code" > $output

for commit in $commits
do
	git checkout -q $commit
	time=`git show -s --pretty='%ci' $commit`
	cloc --quiet --sum-one . | grep SUM: | tr -s ' ' | sed "s/ /,/g" | sed "s/SUM:/$commit,$time/g" >> $output
done

git checkout $branch
