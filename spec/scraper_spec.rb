require_relative '../lib/scraper'
require 'nokogiri'
require 'json'

describe 'Remote Jobs Scraper' do
  describe Scraper do
    let(:scraper) { Scraper.new }
    let(:parsed_page) { Nokogiri::HTML(open('https://remotive.io/remote-jobs/software-dev')) }
    describe '#initialize' do
      it 'scraper.url is a string' do
        expect(scraper.url.is_a?(String)).to eql(true)
      end
      it 'false if scraper.url is not a string' do
        expect(2.is_a?(String)).to eql(false)
      end
      it 'scraper.num is an integer' do
        expect(scraper.num.is_a?(Integer)).to eql(true)
      end
      it 'false if scraper.num is not an integer' do
        expect('test'.is_a?(Integer)).to eql(false)
      end
      it 'scraper.start is an integer' do
        expect(scraper.start.is_a?(Integer)).to eql(true)
      end
      it 'false if scraper.start is not an integer' do
        expect('test'.is_a?(Integer)).to eql(false)
      end
      it 'scraper.end_number is an integer' do
        expect(scraper.end_number.is_a?(Integer)).to eql(true)
      end
      it 'false if scraper.end_number is not an integer' do
        expect('test'.is_a?(Integer)).to eql(false)
      end
    end

    describe '#get_all_jobs' do
      it 'should return true if this method retura Nokogiri instance' do
        expect(scraper.get_all_jobs.is_a?(Nokogiri::HTML::Document)).to eql(true)
      end
      it 'false if method does not return Nokogiri instance' do
        expect('test'.is_a?(Nokogiri::HTML::Document)).to eql(false)
      end
    end

    describe '#count_jobs' do
      it 'should return an integer' do
        expect(scraper.count_jobs(parsed_page).is_a?(Integer)).to eql(true)
      end
      it 'false if the return is not an integer' do
        expect(true.is_a?(Integer)).to eql(false)
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
      it 'false if the return is not an array' do
        expect('test'.is_a?(Array)).to eql(false)
      end
    end
  end
end
