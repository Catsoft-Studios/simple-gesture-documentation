#!/bin/bash
echo -e "commit message:"
read 

git add --all
git commit -m "$REPLY"
git push origin master