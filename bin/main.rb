#!/usr/bin/env ruby
# rubocop:disable all
require './lib/scraper.rb'

class Main

  def initialize
    @scraper = Scraper.new
  end

  def run

    puts "Hello, what's your name?"

    name = gets.chomp

    puts "#{name} here is the list of available remote software developement jobs on remote.io!"
    puts "How many jobs do you want to see per page ? Choose a number > 0"

    num = gets.chomp.to_i

    while num.to_i <= 0
      puts "Please choose a number > 0"
      num = gets.chomp.to_i
    end
    separator = "
    ======================================
    "
    start = 1
    end_number = num
    parsed_page = @scraper.get_all_jobs(num, start, end_number)
    total_jobs = @scraper.count_jobs(parsed_page)
    puts "Loading..."
    while @scraper.continue?(end_number, total_jobs)
      records = []
      for i in start...end_number
        parse_result = @scraper.parse_result(parsed_page, i, records)
        puts "#{i}- #{parse_result[i - 1][:title]}: #{parse_result[i - 1][:employer]}\nLink: https://remotive.io#{parse_result[i - 1][:link]}\n#{separator}"
      end
      puts "Continue ? yes(y) or no(n)"
      answer = gets.chomp
      if (answer == "yes" || answer == "y")
        start += (end_number - 1)
        end_number += num
      else
        break
      end
    end


  end #end of run method

end # end of class

main = Main.new
main.run
