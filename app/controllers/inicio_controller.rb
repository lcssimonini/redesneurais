# -*- encoding : utf-8 -*-
class InicioController < ApplicationController

	def index
		@tabela = TabelaVerdade.all
	end

	def salva_tabela
		@tabela = TabelaVerdade.new(vars: params[:vars], nome: params[:nome])
		@tabela.save
		redirect_to :back
	end

	def show_tabela
		@tabela = TabelaVerdade.find params[:id]
	end
end