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

		for i in 0..(linhas.size-1)
			linhaDeltaW = []
			linhaW = []
			for j in 0..(linhas[i].size-1)
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

	def treinar_letra
		tabela_completa = Array.new
		deltaWtotal = Array.new
		wtotal = Array.new
		vars = self.tabela_verdade.vars+1
		anterioresLinha = Array.new(vars){0}
		linha = self.tabela_verdade.linhas
		target = self.tabela_verdade.saida_esperada[0]

		for i in 0..(linha.size-1)
			linhaDeltaW = []
			linhaW = []
			deltaW = linha[i]*target
			deltaWtotal << deltaW
			w = anterioresLinha[i]+deltaW
			wtotal << w
		end
		tabela_completa = (deltaWtotal + wtotal)
		self.pesos = wtotal
		self.tabela_treino = tabela_completa
		self.save
		
	end

	def testar
		linhas = self.tabela_verdade.linhas
		limiar = 0
		net = Array.new
		saida = Array.new
		pesos = self.pesos
		for i in 0..(linhas.size-1)
			soma = 0
			for j in 0..(linhas[i].size-1)
				soma += linhas[i][j]*pesos[j]
			end
			net << soma
			if soma < limiar
				s = -1
			else
				s = 1
			end
			saida << s
		end
		return net, saida
	end

	def testar_letra arrayEntrada
		linhas = arrayEntrada
		limiar = 20
		net = Array.new
		saida = Array.new
		pesos = self.pesos
		soma = 0
		for j in 0..(linhas.size-1)
			soma += linhas[j]*pesos[j]
		end
		net << soma
		if soma < limiar
			s = -1
		else
			s = 1
		end
		saida << s
		return net, saida
	end
end