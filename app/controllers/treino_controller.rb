# -*- encoding : utf-8 -*-
class TreinoController < ApplicationController

	def treino_tabela
		@tabela = TabelaVerdade.find params[:id]
	end

	def treinar
		@tabela = TabelaVerdade.find params[:id]
		@tabela.treino_tabela.treinar
		@tabela_treino = @tabela.treino_tabela.tabela_treino
		@tabela.save
	end
end