# DealerScrape

This project is a simple ruby class that uses the nokogiri and http ruby gems to scrape an auto dealer website. It currently determines the number of pages via a paginator on the page.  The initializer is currently coded to only scrape the first 5 pages using the paginator and pull a few points of data and determine which reviews may be potentially fraudulent.

![DealerScrape](https://github.com/rbrigby/homework/blob/master/2018-8-20-scraper/how-to.png?raw=true)

# Ruby Gem Dependencies
- nokogiri
- http
- artii

# How to Use From Console
- irb
- scraper = DealerScrape.new
- scraper.scrape

# How to Test
- ruby -ilib:test test_dealer_scrape.rb
