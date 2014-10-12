# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Dpoll::Application.load_tasks

task :default => [:all_tests]

task :all_tests do
  start_time = Time.now
  begin
    Rake::Task['db:test:prepare'].invoke
    Rake::Task['cucumber'].invoke
  ensure
    puts "Total build time: #{(Time.now - start_time)/60} minutes"
  end
end
