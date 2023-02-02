class EmployeeSchedule < ApplicationRecord
  belongs_to :employee, class_name: "employee", foreign_key: "employee_id"
end
