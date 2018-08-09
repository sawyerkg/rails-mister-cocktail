# http://ruby-doc.org/stdlib-2.0.0/libdoc/open-uri/rdoc/OpenURI.html
require 'open-uri'
# https://github.com/flori/json
require 'json'
# http://stackoverflow.com/questions/9008847/what-is-difference-between-p-and-pp
require 'pp'

# Construct the URL we'll be calling
request_uri = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

# Actually fetch the contents of the remote URL as a String.
buffer = open(request_uri).read

result = JSON.parse(buffer)

result["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end



