class Discipline < ActiveRecord::Base
  #model discipline
  has_many :program_contents
  accepts_nested_attributes_for :program_contents, reject_if: lambda { |a| a[:content].blank? || a[:ement].blank? } , allow_destroy: true
end
