module DashboardHelper
  def get_total_employees_by_department department_name
    Employee.limit(Employee.all.count).where(department_id: Department.find_by(department: department_name).id).count
  end
end
