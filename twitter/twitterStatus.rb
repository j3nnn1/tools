# 180 por 15min
# 720 por hora
#require 'xmlsimple'
require 'twitter'
#require 'pp'

filename ='gatsby_5-7.xml'
tweet_ids = Array.new

#filename to save CSV
fileout = File.open("twitter_flisol2011-2012.csv", "w")

filein  = File.open("idsflisol2012.txt");

#saving ID's tweets
filein.each_line do |line|
    tweet_ids << line.to_s().chomp
end


#This is you app devs info. sign in in https://dev.twitter.com/ with your twitter account and fill this.
Twitter.configure do |config|
  config.consumer_key = ''
  config.consumer_secret = ''
  config.oauth_token = ''
  config.oauth_token_secret = ''
end

def addquote(word)
    return "\"#{word}\""
end

save = Array.new

#fields to save.  if remove here, remove too in header CSV
#remove text
save = ["id", "source" ];
save_user = ["screen_name", "location","followers_count", "friends_count", "listed_count", "time_zone","lang"]


#header CSV
header = 'id; source; screen_name; location; followers_count; friends_count; listed_count; time_zone; lang'

save_list = Array.new
#writing header in file
fileout.write(header)

#search all id's info in twitter
tweet_ids.each do |val|
	#fetch status
    begin   	
	    tweet = Twitter.status(val, {include_entities: "1"})
	    sleep(5)
	    #saving
	    save.each do |val|
	       save_list.push(addquote(tweet[val].to_s().gsub('\n', '').chomp))
	    end 

	    save_user.each do |val|
	       save_list.push(addquote(tweet["user"][val].to_s().gsub('\n', '').chomp))
	    end 

	    line = save_list.join(';')

	    line = line + "\n"

	    print line

	    fileout.write(line)

	    save_list.clear()
    rescue Exception => msg
        puts "#{msg} id #{val}"

    end
end
fileout.close();
