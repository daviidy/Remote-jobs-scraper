# rubocop:disable Security/Open

require 'open-uri'
require 'nokogiri'
require 'json'

class Scraper
  def initialize
    @url = 'https://remotive.io/remote-jobs/software-dev'
    @num = 20
    @start = 1
    @end_number = 20
  end
  attr_reader :url
  attr_reader :num
  attr_reader :start
  attr_reader :end_number

  def get_all_jobs(_num = 20, _start = 1, _end_number = 20)
    parsed_page = Nokogiri::HTML(open(@url))
    parsed_page
  end

  def count_jobs(parsed_page)
    total_jobs = parsed_page.css('a.job-tile-title').map(&:text).count
    total_jobs
  end

  def continue?(end_number, total_jobs)
    return true if end_number < total_jobs

    false
  end

  def parse_result(parsed_page, index, records)
    job = parsed_page.css('a.job-tile-title').map(&:text)[index]
    link = parsed_page.css('a.job-tile-title').map { |item| item.attribute('href').value }[index]
    employer = parsed_page.css('p.tw-text-xs').map(&:text)[index]
    employer = employer.split("\n").map(&:strip).join('')
    record_hash = {
      "title": job,
      "employer": employer,
      "link": link
    }
    records << record_hash
    records
  end
end

# rubocop:enable Security/Open
