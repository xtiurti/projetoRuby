class ExceptionalDate < ActiveRecord::Base
	validates :event, presence: {message: ': -> O nome da disciplina não pode ser deixado em branco'}
end
