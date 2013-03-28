# -*- coding: utf-8 -*-
import tweepy
import sys
import os
import time

s = ', '.encode('utf-8')
file = open('tweetabout.csv','w')
file.write('created_at, from_user,from_user_id, from_user_id_str, from_user_name, geo, id, id_str, metadata, parse, parse_list, profile_image_url, profile_image_url_https, source, text');
while True:
    x = tweepy.api.search('somethingToSearch')
    for y in x:
		line = str(y.created_at) + s +str(y.from_user) + s + str(y.from_user_id) + s + y.from_user_name + s + y.id_str + s + y.profile_image_url + s + y.profile_image_url_https + s + y.source + s+ y.text + "\n"
		file.write(line.encode('utf-8'))
		print line.encode('utf-8')
    time.sleep(360)


