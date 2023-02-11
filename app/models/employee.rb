class Employee < ApplicationRecord
  has_secure_password

  belongs_to :department, class_name: "Department", foreign_key: "department_id"
  has_one :employee_schedule

  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
end

