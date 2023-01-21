class Wage < ApplicationRecord
  has_many :employees, class_name: "employee", foreign_key: "reference_id"
end
