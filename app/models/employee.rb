class Employee < ApplicationRecord
  belongs_to :wages
  belongs_to :employee_schedules
  belongs_to :department
end
