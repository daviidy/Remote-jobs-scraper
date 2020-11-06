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

    num = gets.chomp

    while num.to_i <= 0
      puts "Please choose a number > 0"
    end

    if not num
      puts @scraper.get_all_jobs
    else
      start = 1
      puts @scraper.get_all_jobs(num, start, num)
      puts "Loading..."
      while continue?(end_number, total_jobs)
        parse_result(parsed_page, start, end_number)
        puts "Continue ? yes(y) or no(n)"
        answer = gets.chomp
        if (answer == "yes" || answer == "y")
          start += (end_number - 1)
          end_number += num
        else
          break
        end
      end
    end


  end #end of run method

end # end of class

main = Main.new
main.run
