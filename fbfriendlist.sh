#!/bin/bash
#Lists all the friends of whoever's graph api friends with access token has been used as $url and saves it to a file FBfriends.txt
#run the file with ur access token ex: sh ./fbfriendlist.sh $accesstoken

url="https://graph.facebook.com/me/friends?access_token="$1
sample=`curl $url`
name=`echo $sample | grep -Eo '\/[[:digit:]]{2,}' | tr -d '\/'`
user_url="https://graph.facebook.com/"$name
user_name=`curl $user_url | grep -Eo "\"name\":\"[^\"]{1,}\"" | sed s/\"name\":\"//g | tr -d '\"' | tr -d ' '`
echo $user_name
filename=$user_name"FBfriends.txt"
echo $sample | grep -Eo "\"name\":\"[^\"]{1,}\"" | sed s/\"name\":\"//g | tr -d '\"'  > $filename
clear
echo "FRIENDS LIST SAVED TO "$filename


