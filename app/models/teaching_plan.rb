class TeachingPlan < ActiveRecord::Base
  belongs_to :discipline
  has_many :programmings
  has_many :teaching_procedures
  accepts_nested_attributes_for :programmings, reject_if: lambda { |a| a[:day_month_week].blank? || a[:content_classes].blank? || a[:number_classes].blank? } , allow_destroy: true
  accepts_nested_attributes_for :teaching_procedures, reject_if: lambda { |a| a[:theoretical_classes].blank? || a[:practical_classes].blank? || a[:aps].blank? || a[:activies_distance].blank? || a[:apcc].blank? } , allow_destroy: true

  validates :teacher, presence: {message: ': -> O nome do professor é essencial'}
  validates :team, presence: {message: ': -> O nome do professor é essencial'}
  validates :semester, presence: {message: ': -> Preencha o semestre'}
  validates :evaluation, presence: {message: ': -> Preencha o métodos de avaliação'}
  validates :references, presence: {message: ': -> Coloque as referências'}
  validates :guidelines, presence: {message: ': -> De as orientações gerais'}
end
