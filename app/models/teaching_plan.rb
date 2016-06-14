class TeachingPlan < ActiveRecord::Base
	belongs_to :discipline
  has_many :programmings
  has_many :teaching_procedures
  accepts_nested_attributes_for :programmings, reject_if: lambda { |a| a[:day_month_week].blank? || a[:content_classes].blank? || a[:number_classes].blank? } , allow_destroy: true
  
  accepts_nested_attributes_for :teaching_procedures, reject_if: lambda { |a| a[:theoretical_classes].blank? || a[:practical_classes].blank? || a[:aps].blank? || a[:activies_distance].blank? || a[:apcc].blank? } , allow_destroy: true
end
