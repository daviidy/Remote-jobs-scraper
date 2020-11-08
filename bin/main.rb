#!/usr/bin/env ruby
# rubocop:disable Metrics/MethodLength
# rubocop:disable Layout/LineLength
require_relative '../lib/scraper'

class Main
  def initialize
    @scraper = Scraper.new
  end

  def run
    puts "Hello, what's your name?"

    name = gets.chomp

    puts "#{name} here is the list of available remote software developement jobs on remote.io!"
    puts 'How many jobs do you want to see per page ? Choose a number > 0'

    num = gets.chomp.to_i

    while num.to_i <= 0
      puts 'Please choose a number > 0'
      num = gets.chomp.to_i
    end
    separator = "
    ======================================
    "
    start = 1
    end_number = num
    parsed_page = @scraper.get_all_jobs(num, start, end_number)
    total_jobs = @scraper.count_jobs(parsed_page)
    puts 'Loading...'
    records = []
    while @scraper.continue?(end_number, total_jobs)
      (start..end_number).each do |index|
        parse_result = @scraper.parse_result(parsed_page, index, records)
        puts "#{index}- #{parse_result[index - 1][:title]}: #{parse_result[index - 1][:employer]}\nLink: https://remotive.io#{parse_result[index - 1][:link]}\n#{separator}"
      end
      puts 'Continue ? yes(y) or no(n)'
      answer = gets.chomp
      break unless %w[yes y].include?(answer)

      start += (end_number - 1)
      end_number += num
    end
  end
end

main = Main.new
main.run

# rubocop:enable Metrics/MethodLength
# rubocop:enable Layout/LineLength
