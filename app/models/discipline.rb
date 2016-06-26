class Discipline < ActiveRecord::Base
  #model discipline
  has_many :teaching_plans
  has_many :program_contents
  accepts_nested_attributes_for :program_contents, reject_if: lambda { |a| a[:content].blank? || a[:ement].blank? } , allow_destroy: true
  validates :name, presence: {message: 'O nome do curso não pode ser deixado em branco'}
end
