class ProgramContent < ActiveRecord::Base
	belongs_to :discipline

	validates :item, presence: {message: ': -> O numero do item não pode ser deixado em branco'}
	validates :ement, presence: {message: ': -> A ementa não pode ser deixado em branco'}
	validates :content, presence: {message: ': -> O conteudo deve ser preenchido'}
end
