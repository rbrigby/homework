require 'nokogiri'
require 'http'
require 'ostruct'
require 'artii'

puts `artii 'DealerScrape'`

class DealerScrape

  attr_accessor :dealer_reviews, :max_parse_pages

  dealer_domain = 'https://www.dealerrater.com'
  dealer_link = '/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/'
  REVIEW_LINK = "#{dealer_domain}#{dealer_link}"

  def initialize()
    @dealer_reviews = []
    @max_parse_pages = 5
  end

  def scrape
    page_count = parse_page_count
    get_reviews(page_count)
    top_reviews
  end

  def top_reviews
    puts self.dealer_reviews.sort_by {|review| [review.score, review.content_length] }.last(3)
  end

  def noko_parse(response)
    Nokogiri::HTML(response)
  end

  def parse_page_count
    res = HTTP.get(REVIEW_LINK).to_s
    extract_page_number(noko_parse(res).xpath("//div[@class='sliding_pagination clearfix']").text)
  end

  def extract_page_number(paginator_text)
    /\.\.\.(\d+)/.match(paginator_text)[1].to_i
  end

  def get_reviews(page_count)
    handle_paginator(page_count)
  end

  def handle_paginator(page_count)
    page_count > 0 ? get_review_pages(page_count) : 'no reviews'
  end

  def get_review_pages(page_count)
    Range.new(1, @max_parse_pages).each do |page_number|
     puts "Scraping page #{page_number}/#{page_count}"
     get_review_page(page_number)
    end
  end

  def get_review_page(page_number)
    page_link = "#{REVIEW_LINK}page#{page_number}"
    parse_review_page(page_link, page_number)
  end

  def parse_review_page(page_link, page_number)
    res = HTTP.get(page_link).to_s
    doc = noko_parse(res)
    review_nodes = doc.xpath('//div[@class="review-entry col-xs-12 text-left pad-none pad-top-lg  border-bottom-teal-lt"]')
    review_nodes.each_with_index do |rn, idx|
      rev_struct = OpenStruct.new
      rev_struct.page = page_number
      rev_struct.review = idx
      rev_struct.score = parse_review_score(rn)
      rev_struct.content_length = parse_review_content_length(rn)
      @dealer_reviews << rev_struct
    end
  end

  def parse_review_score(review_node)
    rating_classes = review_node.children[3].children[3].children[3].values[0]
    extract_rating(rating_classes)
  end

  def extract_rating(rating_classes)
    /\d+/.match(rating_classes)[0].to_i/10.to_f
  end

  def parse_review_content_length(review_node)
    review_node.children[5].children[7].text.length
  end

end
