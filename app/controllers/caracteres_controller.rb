# -*- encoding : utf-8 -*-
class CaracteresController < ApplicationController

	def index
		@letras = TabelaVerdade.where(letra: true).all
	end

	def salva_letra
		linha = Array.new
		linha = params[:linha]
		linha = linha.map{|x| x.to_i}
		linha << 1
		@letra = TabelaVerdade.new(
				letra: true,
				linhas: linha,
				nome: params[:nome],
				saida_esperada: [1],
				vars: 25
			)
		@letra.treino_tabela = TreinoTabela.new
		@letra.save
		respond_to do |format|
			format.json{render json: {id: @letra.id}}
		end
	end

	def show
		@letra = TabelaVerdade.find params[:id]
	end
end