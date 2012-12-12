# -*- encoding : utf-8 -*-
class InicioController < ApplicationController

	def index
		@tabela = TabelaVerdade.all
	end

	def salva_tabela
		@tabela = TabelaVerdade.new(vars: params[:vars], nome: params[:nome])
		@tabela.linhas = cria_linhas_tabela @tabela.vars
		@tabela.save
		redirect_to :back
	end

	def show_tabela
		@tabela = TabelaVerdade.find params[:id]
	end

	def cria_linhas_tabela vars
		nl = 2**vars
		tabela = Array.new
		for num in 0..(nl-1) do
		   linha = Array.new
		   string = sprintf "%0#{vars}b", num
		   string.each_char do |c| linha << c.to_i end
		   linha = linha.map{|x| x == 0 ? x = -1 : x}
		   tabela << linha
		end
		return tabela
	end
end