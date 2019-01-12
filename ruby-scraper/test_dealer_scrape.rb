require "minitest/autorun"
require "pry"
require_relative "dealer_scrape"

class TestDealerScrape < Minitest::Test
  def setup
    @ds = DealerScrape.new
    @fake_html = <<-EOS
      <html>
        <head><title>Some Title</title></head>
        <body>Some Content</body>
      </html>
    EOS
  end

  def test_dealer_scrape_instantiation
    assert_instance_of DealerScrape, @ds
  end

  def test_max_parse_pages
    assert_equal 5, @ds.max_parse_pages
  end

  def test_extract_page_number
    assert_equal 169, @ds.extract_page_number("< prev12...169next >")
  end

  def test_noko_parse
    assert_instance_of Nokogiri::HTML::Document, @ds.noko_parse(@fake_html)
  end

  def test_extract_rating_as_float
    assert_equal 4.8, @ds.extract_rating("rating-static hidden-xs rating-48 margin-center")
  end

end
