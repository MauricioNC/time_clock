module DashboardHelper
  def get_total_employees_by_department department_name
    department = Department.find_by(department: department_name)
    department.employees.count
  end
end
