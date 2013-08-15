#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Stacked::Application.load_tasks

desc "reset everything"
task "reset" do
  exec "rake db:drop && rake db:create && rake db:migrate && rake db:seed && rake db:test:prepare && bundle exec annotate"
  puts "Database dropped, created, migrated, seeded, test:prepared, and models annotated"
end