


require 'nokogiri'
require 'open-uri'

puts "processing..."


nodeSet = Nokogiri::HTML(open("http://www.despegar.com.ar")) { |config| config.noblanks }

nodeSet = nodeSet.css("body")
nodeSet.css('style', 'script').remove
nodeSet.css(
	'.classsbox-ui-error-msg',
	'.nevo-common-footer-text', 
	'.nevo-common-footer-pdp',
	'.nevo-common-footer-container',
	'.nevo-common-footer-legals',
	'.nevo-common-footer',
	'.mail-offers-legal',
	'.mail-offer-error',
	'.subsc',
	'.mail-offer-mail-sended',
	'.mail-offer-already-subscribed',
	'.nevo-error',
	'.social-form-error',
	'.sbox-hotels-container'
).remove
nodeSet.xpath('//comment()').remove
nodeSet.xpath('//@*').remove  #remove rest of atrributes


mytext = nodeSet.text.gsub("$","").gsub(/#/,"").gsub(/%/,"")
mytext = mytext.gsub(/\d+/,"").squeeze(" ")  #remove nums
mytext = mytext.gsub(/^$\n/,"").strip #remove empty lines
text_array = mytext.split("\n")

p text_array

