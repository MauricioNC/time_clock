# Cron job to register an absence automatically when an employee doesn't check in in time.
# This cron job will be executed from monday to friday at 09:16 am.
set :output, './log/cron.log'

every '16 9 * * 1-5' do
  runner 'puts Absence.create'
end
