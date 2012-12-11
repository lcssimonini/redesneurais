# -*- encoding : utf-8 -*-
require "mongo"
require "uri"
if ENV['MONGOLAB_URI'] then
	MongoMapper.config = { 
	Rails.env => { 'uri' => ENV['MONGOLAB_URI'] } }
	MongoMapper.connect(Rails.env)

	uri  = URI.parse(ENV['MONGOLAB_URI'])
    connection = Mongo::Connection.from_uri(ENV['MONGOLAB_URI'])
    db   = connection.db(uri.path.gsub(/^\//, ''))

else
	MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
	MongoMapper.database = "#redesneurais"

	connection = Mongo::Connection.new("localhost", 27017)
    db = connection.db("#redesneurais")
end
