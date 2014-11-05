desc 'Before committing code make sure this passes!!'
task precheckin: :environment do |_task|

  start_time = Time.now
  begin
    puts '------------ Running precheckin task'
    ENV['RAILS_ENV'] = 'test'
    Rake::Task['rubocop'].invoke
    Rake::Task['spec'].invoke
    Rake::Task['jasmine:ci'].invoke
    Rake::Task['db:test:prepare'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['cucumber'].invoke
    puts 'Congratulations, you can check in your code : )'
  ensure
    puts "------------ Total build time: #{(Time.now - start_time) / 60} minutes"
  end
end
