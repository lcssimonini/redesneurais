# -*- encoding : utf-8 -*-
class TreinoController < ApplicationController

	def treino_tabela
		@tabela = TabelaVerdade.find params[:id]
	end

	def treinar
		@tabela = TabelaVerdade.find params[:id]
		if @tabela.letra?
			@tabela.treino_tabela.treinar_letra
		else
			@tabela.treino_tabela.treinar
		end
		@tabela_treino = @tabela.treino_tabela.tabela_treino
		@vars = @tabela.vars
		@tabela.save
	end

	def testar
		@tabela = TabelaVerdade.find params[:id]
		if @tabela.letra?
			arg = params[:linha].map{|x| x.to_i}
			@net, @saida = @tabela.treino_tabela.testar_letra arg
		else
			@net, @saida = @tabela.treino_tabela.testar
		end
	end
end