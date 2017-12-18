require 'rails_helper'

rake RAILS_ENV=test db:drop
rake RAILS_ENV=test db:create
rake RAILS_ENV=test db:migrate
rake RAILS_ENV=test db:seed