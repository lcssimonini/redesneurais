
class TabelaVerdade
	include MongoMapper::Document
	key :nome, String
	key :vars, Integer
	key :linhas, Array
	key :target, Array

end
