class Stock < ApplicationRecord

	require 'uri'
	require 'net/http'
	require 'openssl'

	def self.current_price(identifier)
		
		url = URI("https://latest-stock-price.p.rapidapi.com/price?Indices=NIFTY%20500&Identifier=#{identifier}")

		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Get.new(url)
		request["X-RapidAPI-Key"] = '844f7b65bbmsh746825b5701af35p1a7212jsn471c25133ea6'
		request["X-RapidAPI-Host"] = 'latest-stock-price.p.rapidapi.com'

		response = http.request(request)
		puts response.read_body
	end

end
