require 'csv'
require 'json'

options = Hash.new
options[:col_sep] = ';'
options[:headers] = false


tweet = CSV.read('data/manyeye.csv', options).to_a 

#tweetheader = tweet.headers
tweetheader = ['source','location','followers_count']
tweets = Array.new


tweet.to_a.each { |row|
      tweetHash = Hash.new
      tweetHash['source'] = row[0]
      tweetHash['location'] = row[1]
      tweetHash['followers_count'] = row[2]
      tweets.push(tweetHash)
}
puts tweets.to_json

