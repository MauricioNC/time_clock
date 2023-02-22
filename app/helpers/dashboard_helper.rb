module DashboardHelper
  def get_total_employees_by_department department_name
    department = Department.find_by(department: department_name)
    department.employees.count
  end

  def get_total_employees
    Employee.all.count
  end

  def get_total_absences
    Absence.all.count
  end

  def get_total_employee_schedules
    EmployeeSchedule.joins(:employee)
  end

  def avg_early
    employee_schedules = get_total_employee_schedules
    total_late_arrivals = employee_schedules.select { |e| (e.check_in.strftime("%H:%M:%S") > "09:00:00" && e.check_in.strftime("%H:%M:%S %z") < "09:16:00") == false }
    days_of_current_month = Time.days_in_month(Time.now.month, Time.now.year) - 8
    total_arrivals = (get_total_employees * days_of_current_month)
    ((total_late_arrivals.count * 100) / total_arrivals)
  end

  def get_gender_percentage(gender)
    female = Employee.where(gender: "Female").count
    male = Employee.where(gender: "Male").count

    return (female * 100) / get_total_employees if gender == "Female"
    return (male * 100) / get_total_employees if gender == "Male"
  end

  def punctuality_percentage employee_id
    employee = Employee.find(employee_id)
    days_of_current_month = Date.new(2023, 02, -1).day

    early_arrivals = employee.employee_schedules.count
    @puntc_percentage = (early_arrivals * 100) / days_of_current_month
  end
end
