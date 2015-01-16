# -*- coding: utf-8 -*-
import tweepy
import sys
import os
import time

file = open('allmyfavorites.csv','a')

consumer_key = ''
consumer_secret = ''
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
key = ''
secret = ''
auth.set_access_token(key, secret)
api = tweepy.API(auth)

i = 94

while True:
    favorites =  api.favorites(page=i)

    for f in favorites:
        tweet = f.text.rstrip("\r\n")
        tweet = f.text.rstrip("\n")
        print(str(i)+';'+str(f.id) + ';' +  tweet)
        file.write(str(i)+';'+str(f.id) + ';' +  tweet);
        file.write("\n")

    i = i + 1
    if not favorites:
        print('Todos los favoritos se guardaron en allmyfavorires.csv')
        break;
    time.sleep(60)


