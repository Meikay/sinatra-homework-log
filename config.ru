require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# add a line of code here to send 'PATCH' and 'DELETE' requests
use Rack::MethodOverride
# mount controllers here with 'use'
use HomeworkAssignmentsController
use UsersController
run ApplicationController
