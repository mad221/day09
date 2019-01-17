require 'rubygems'
require 'nokogiri'
require 'open-uri'



def crazy_scraper
  @page = Nokogiri::HTML(open("https://coinmarketcap.com/"))
    key = []
    value = []
  @page.xpath('//td[2]/a').each do |name|
    key << name.content
    end
  @page.xpath('//a[@class="price"]/@data-usd').each do |price|
    value << price.content
    end
array=[]
  hashage = key.zip(value).to_h
array=[hashage]
puts array
return hashage
end
