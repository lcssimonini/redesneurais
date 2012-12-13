# -*- encoding : utf-8 -*-
class TreinoController < ApplicationController

	def treino_tabela
		@tabela = TabelaVerdade.find params[:id]
	end

	def treinar
		@tabela = TabelaVerdade.find params[:id]
		@tabela.treino_tabela.treinar
		@tabela_treino = @tabela.treino_tabela.tabela_treino
		@vars = @tabela.vars
		@tabela.save
	end

	def testar
		@tabela = TabelaVerdade.find params[:id]
		@net, @saida = @tabela.treino_tabela.testar
	end
end