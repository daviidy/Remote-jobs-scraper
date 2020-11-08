require '../lib/scraper.rb'
require 'httparty'
require 'nokogiri'
require 'json'

describe 'Remote Jobs Scraper' do
  describe Scraper do
    let(:scraper) { Scraper.new }
    let(:unparsed_page) { HTTParty.get('https://remotive.io/remote-jobs/software-dev') }
    let(:parsed_page) { Nokogiri::HTML(unparsed_page) }
    describe '#initialize' do
      it 'scraper.url is a string' do
        expect(scraper.url.is_a?(String)).to eql(true)
      end
      it 'scraper.num is an integer' do
        expect(scraper.num.is_a?(Integer)).to eql(true)
      end
      it 'scraper.start is an integer' do
        expect(scraper.start.is_a?(Integer)).to eql(true)
      end
      it 'scraper.end_number is an integer' do
        expect(scraper.end_number.is_a?(Integer)).to eql(true)
      end
    end

    describe '#get_all_jobs' do
      it 'should return true if this method retura Nokogiri instance' do
        expect(scraper.get_all_jobs.is_a?(Nokogiri::HTML::Document)).to eql(true)
      end
    end

    describe '#count_jobs' do
      it 'should return an integer' do
        expect(scraper.count_jobs(parsed_page).is_a?(Integer)).to eql(true)
      end
    end

    describe '#continue?' do
      it 'should return true if first param < second param' do
        expect(scraper.continue?(20, 300)).to eql(true)
      end

      it 'should return false if first param > second param' do
        expect(scraper.continue?(400, 300)).to eql(false)
      end
    end

    describe '#parse_result' do
      it 'should return an array' do
        expect(scraper.parse_result(parsed_page, 1, []).is_a?(Array)).to eql(true)
      end
    end
  end
end
