# encoding: utf-8

require 'rubygems'
require 'sanitize'
require 'CSV'

terms = Hash.new
terms = {'\xe1' => 'á', '\xe9' => 'é', '\xed' => 'í', '\xfa' => 'ú', '\xf3' => 'ó'} 

def removeaccent(word, terms)
   terms.each do |code, termino| 
       word = word.gsub(code, termino)
   end
   return word
end

file_clean = File.open("lanacion.com.ar.csv.data.clean", "w")

CSV.foreach("lanacion.com.ar.csv.data", encoding: 'UTF-8' ) do |row|
    #title
    title = removeaccent(Sanitize.clean(row[1]).force_encoding('UTF-8'), terms)
    #content
    content = removeaccent(Sanitize.clean(row[0]).force_encoding('UTF-8'), terms)
    #csv
    csv_string = [title, content].to_csv
    file_clean.write(csv_string)
end


