# -*- encoding : utf-8 -*-
class TabelaVerdade
	include MongoMapper::Document
	key :nome, String
	key :vars, Integer
	key :linhas, Array
	key :saida_esperada, Array

	one :treino_tabela

end
