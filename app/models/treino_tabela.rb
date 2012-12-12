# -*- encoding : utf-8 -*-
class TreinoTabela
	include MongoMapper::Document
	key :tabela_treino, Array
	key :pesos, Array	

	belongs_to :tabela_verdade

	def treinar
		tabela_completa = Array.new
		deltaWtotal = Array.new
		wtotal = Array.new
		vars = self.tabela_verdade.vars+1
		anterioresLinha = Array.new(vars){0}
		linhas = self.tabela_verdade.linhas
		targets = self.tabela_verdade.saida_esperada

		# linhas.each_with_index do |linha, i|
		for i in 0..(linhas.size-1)
			linhaDeltaW = []
			linhaW = []
			for j in 0..(linhas[i].size-1)
			# linha[].each_with_index do |coluna, j|
				deltaW = linhas[i][j]*targets[i]
				linhaDeltaW << deltaW
				w = anterioresLinha[j]+deltaW
				anterioresLinha[j] = w
				linhaW << w
			end
			deltaWtotal << linhaDeltaW
			wtotal << linhaW
			tabela_completa << (linhaDeltaW + linhaW)
		end
		self.pesos = wtotal.last
		self.tabela_treino = tabela_completa
		self.save
	end
end