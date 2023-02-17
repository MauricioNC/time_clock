class Employee < ApplicationRecord
  has_secure_password

  belongs_to :department, class_name: "Department", foreign_key: "department_id"
  has_many :employee_schedules
  has_many :absences

  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
end

