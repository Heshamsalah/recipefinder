class Recipe
	include HTTParty #this command includes the HTTParty module from the HTTParty file required before
#ENV['FOOD2FORK_SERVER_AND_PORT'] ||
	key_value = ENV['FOOD2FORK_KEY']
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'food2fork.com'
	base_uri "http://#{hostport}/api"
	default_params key: key_value #a key(q:) => value("search")
	format :json #symbole

	def self.for(keyword)
		@myHash = Hash.new
		@myHash = get("/search",query: {q: keyword})
		@myHash["recipes"]
	end
end