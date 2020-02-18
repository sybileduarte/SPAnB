# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Specie.destroy_all

require 'open-uri'
require 'nokogiri'

Race.destroy_all
Specie.destroy_all

url = "https://www.woopets.fr/chien/races/"

chien = Specie.create(name: 'chien')

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("span[data-toggle='tooltip']").each do |element|
  race = Race.new(name: element.text.strip)
  race.specie = chien
  race.save!
end


chat = Specie.create(name: 'chat')
url = "https://www.woopets.fr/chat/races/"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.css("span[data-toggle='tooltip']").each do |element|
  race = Race.new(name: element.text.strip)
  race.specie = chat
  race.save!
end

puts "completed"
