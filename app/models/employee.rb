class Employee < ApplicationRecord
  has_secure_password

  belongs_to :wages
  belongs_to :employee_schedules
  belongs_to :department
end
