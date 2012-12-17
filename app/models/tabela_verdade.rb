# -*- encoding : utf-8 -*-
class TabelaVerdade
	include MongoMapper::Document
	key :nome, String
	key :vars, Integer
	key :linhas, Array
	key :saida_esperada, Array
	key :letra, Boolean

	one :treino_tabela

	def letra?
		letra
	end

end
