class Employee < ApplicationRecord
  has_secure_password

  belongs_to :department, class_name: "Department", foreign_key: "department_id"
end

