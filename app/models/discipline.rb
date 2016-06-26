class Discipline < ActiveRecord::Base
  #model discipline
  has_many :teaching_plans
  has_many :program_contents
  accepts_nested_attributes_for :program_contents, reject_if: lambda { |a| a[:content].blank? || a[:ement].blank? } , allow_destroy: true
  validates :name, presence: {message: ': -> O nome da disciplina não pode ser deixado em branco'}
  validates :cod, presence: {message: ': -> O código do curso não pode ser deixado em branco'}
  validates :matrix, presence: {message: ': -> A matriz do curso não pode ser deixado em branco'}
  validates :course, presence: {message: ': -> O nome do curso não pode ser deixado em branco'}
  validates :substantiation, presence: {message: ': -> A fundamentação legal não pode ser deixado em branco'}
  validates :goals, presence: {message: ': -> Os objetivos não podem ser deixado em branco'}
  validates :ement, {length: { minimum: 30, message: ': -> A ementa deve conter pelo menos 30 caracteres'}}
  validates :period, presence: {message: ': -> Peíodo não pode ser deixado em branco'}
  validates :at, presence: {message: ': -> At não pode ser deixado em branco'}
  validates :ad, presence: {message: ': -> Ad não pode ser deixado em branco'}
  validates :aps, presence: {message: ': -> Aps não pode ser deixado em branco'}
  validates :apcc, presence: {message: ': -> Apcc não pode ser deixado em branco'}
  
  
end
