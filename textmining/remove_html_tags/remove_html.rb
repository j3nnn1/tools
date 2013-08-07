# encoding: utf-8

require 'rubygems'
require 'sanitize'
require 'csv'

terms = Hash.new
terms = {'\xe1' => 'á', '\xe9' => 'é', '\xed' => 'í', '\xfa' => 'ú', '\xf3' => 'ó'} 

def removeaccent(word, terms)
   terms.each do |code, termino| 
       word = word.gsub(code, termino)
   end
   return word
end

file_clean = File.open("infobae_finanza.csv.data.clean", "w")

CSV.foreach("infobae_finanza.csv", encoding: 'UTF-8' ) do |row|
    #title
    title = removeaccent(Sanitize.clean(row[1]).force_encoding('UTF-8'), terms)
    #content
    content = removeaccent(Sanitize.clean(row[0]).force_encoding('UTF-8'), terms)
    #csv
    csv_string = [title, content].to_csv
    #csv_string = [content].to_csv
    file_clean.write(csv_string)
end


