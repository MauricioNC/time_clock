class Employee < ApplicationRecord
  has_secure_password

  belongs_to :department, class_name: "Department", foreign_key: "department_id"
  has_one :employee_schedule, through: :join_association, source: :join_association_table_foreign_key_to_employee_schedule_table

  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
end

