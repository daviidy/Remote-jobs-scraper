# rubocop:disable all
require 'httparty'
require 'nokogiri'
require 'json'

class Scraper

  def initialize
    @url = "https://remotive.io/remote-jobs/software-dev"
    @num = 20
    @start = 1
    @end_number = 20
  end
  attr_accessor :url
  attr_accessor :num
  attr_accessor :start
  attr_accessor :end_number

  def get_all_jobs(num = 20, start = 1, end_number = 20)
    unparsed_page = HTTParty.get('https://remotive.io/remote-jobs/software-dev')
    parsed_page = Nokogiri::HTML(unparsed_page)

    total_jobs = parsed_page.css('a.job-tile-title').map(&:text).count
    
  end #end function get_all_jobs

  def continue?(end_number, total_jobs)
    return true if end_number < total_jobs
    false
  end

  def parse_result(parsed_page, start, end_number)
    records = []
    for i in start...end_number
      job = parsed_page.css("a.job-tile-title").map(&:text)[i]
      link = parsed_page.css("a.job-tile-title").map{|item| item.attribute('href').value}[i]
      employer = parsed_page.css('p.tw-text-xs').map(&:text)[i]
      employer = employer.split("\n").map{|sub| sub.strip}.join("")
      record_hash = {
        "title": job,
        "employer": employer,
        "link": link,
      }
      records << record_hash
      puts "#{i}- #{records[i - 1][:title]}: #{records[i - 1][:employer]}\nLink: https://remotive.io#{records[i - 1][:link]}"
    end
  end

end # end of class
