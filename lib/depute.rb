require 'rubygems'
require 'nokogiri'
require 'open-uri'


def loadfile
key=[]
i=0
n=1
user=[]
prenom=[]
nom=[]

pages_url= Nokogiri::HTML(open("https://fr.wikipedia.org/wiki/Liste_des_d%C3%A9put%C3%A9s_de_la_XIVe_l%C3%A9gislature_de_la_Cinqui%C3%A8me_R%C3%A9publique"))
pages_url.xpath('//td[1]/a').each do |name|
   key << name.content
user[i]= key[i]

i+=1
  end


i=0
g=0
prenom={}
nom={}
chiffre=0
while (key[i]!=nil)

  while (user[i][g])

if (user[i][g]==" ")

chiffre=g
end
g+=1

end

prenom["prenom#{i}"]=user[i][0..chiffre]
nom["nom#{i}"]=user[i][chiffre+1..-1]
g=0
i+=1

end









  i=0
  g=0
  ensemble=[]
email={}
name={}
while (key[i]!=nil)
  name["name#{i}"]=key[i]

mail=key[i].downcase+"@assemblee-nationale.fr"
while (mail[g]!=nil)
if(mail[g]==" ")
mail[g]="."

end

g+=1
end
email["email#{i}"]=mail

g=0

i+=1
end

i=0
puts "a = ["
while (key[i]!=nil)


puts "  {"
puts "    firstname => #{nom["nom#{i}"]}"
puts "    last_name => #{prenom["prenom#{i}"]}"
puts "     email => #{email["email#{i}"]}"
puts "  },"
i+=1
end
puts "]"


return 1
end
