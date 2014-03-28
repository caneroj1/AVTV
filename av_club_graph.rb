

require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require 'mechanize'
   
 

#page = Nokogiri::HTML(open('http://www.avclub.com/tv/'))   
agent = Mechanize.new

#array = Hash.new # stores 2 dimensional array in hash, uses coordinates as hash function

=begin # erase this line and the line that starts with =end to get the class back
class Graph
	@show 
	@url
	@grades = Array.new

	def initialize
		#@url = "http://www.avclub.com/tvclub/breaking-bad-pilot-17025"
		#puts "Enter the name of a television show"
		#@show = gets.chomp


	end

	def print
		puts "blah"
	end
end
=end

#tvGraph = Graph.new

#tvGraph.print





# AV Club Grades: A, A-, B+, B, B-, C+, C, C-, D+, D, D-, F
# on metacritic, they correspond with: 100, 91, 83, 80, 75, 70, 67, 60, 58, 50, 42, 40 (SKIP), 33, 25, 16, 0

# Put these lines back in afterwards
#puts "Enter the name of a television show (be sure to capitalize)"
#_show = gets.chomp
_show = 'Breaking Bad'

agent.get('http://www.avclub.com/tv/') do |page|
  search_result = page.form_with(:action => '/search/') do |search|
    search.q = _show
  end.submit

  reviews = search_result.link_with(text: _show).click


  grades = Array.new
  graph = Hash.new

  #puts "season 1"
  season = reviews.link_with(class: "badge season-1").click.search('.grade.letter.tv').reverse
  season.pop # the latest episode is at the top of every page, remove it from the list
  season = season.reverse
  while season.length > 0 do
  	grades.push(season.pop.inner_text())
  end

  #puts "season 2"
  season = reviews.link_with(class: "badge season-2").click.search('.grade.letter.tv').reverse
  season.pop # the latest episode is at the top of every page, remove it from the list
  season = season.reverse
  while season.length > 0 do
  	grades.push(season.pop.inner_text())
  end

  #puts "season 3"
  season = reviews.link_with(class: "badge season-3").click.search('.grade.letter.tv').reverse
  season.pop # the latest episode is at the top of every page, remove it from the list
  season = season.reverse
  while season.length > 0 do
  	grades.push(season.pop.inner_text())
  end

  #puts "season 4"
  season = reviews.link_with(class: "badge season-4").click.search('.grade.letter.tv').reverse
  season.pop # the latest episode is at the top of every page, remove it from the list
  season = season.reverse
  while season.length > 0 do
  	grades.push(season.pop.inner_text())
  end

  #puts "season 5"
  season = reviews.search('.grade.letter.tv').reverse
  season.pop # the latest episode is at the top of every page, remove it from the list
  season = season.reverse
  while season.length > 0 do
  	grades.push(season.pop.inner_text())
  end

  #puts grades

  while grades.length > 0 do
  	case grades.pop
  	when "A"
  		puts "11"
  	when "A-"
  		puts "10"
  	when "B+"
  		puts "9"
  	when "B"
  		puts "8"
  	when "B-"
  		puts "7"
  	when "C+"
  		puts "6"
  	when "C"
  		puts "5"
  	when "C-"
  		puts "4"
  	when "D+"
  		puts "3"
  	when "D"
  		puts "2"
  	when "D-"
  		puts "1"
  	when "F"
  		puts "0"
  	else
  		puts "test"
  	end
  end

  
  
  
  




end
