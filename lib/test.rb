require 'rubygems'
require 'nokogiri'
require 'open-uri'






def get_townhall_urls
  @index_of_95 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
@array_townhall_url = []
@array_townhall_name = []
  @index_of_95.xpath('//p/a/@href').each do |urls|
  @array_townhall_url << "#{urls}".sub('.',"http://annuaire-des-mairies.com")
  end
  @index_of_95.xpath('//p/a/@href').each do |name|
    @array_townhall_name << name.text
  end

  @array_townhall_names=[]
  @array_townhall_name.each do |i|
  @array_townhall_names<< i[5..-6]
  end
 return @hash_townhall_name_url = @array_townhall_names.zip(@array_townhall_url).to_h

end

def get_townhall_email(townhall_url)



array_townhall_email = []
townhall_url.each  do |url|

@townhall_page = Nokogiri::HTML(open(url))
@townhall_page.xpath('//section[2]/div/table/tbody/tr[4]/td[2]').each do |townhall_email|
array_townhall_email << townhall_email.text

end
end
hashage_final_city_email= get_townhall_urls.keys.zip(array_townhall_email).to_h
return hashage_final_city_email

end


def perform

result =get_townhall_email(get_townhall_urls.values)

return result

end

perform
