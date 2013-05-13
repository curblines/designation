namespace :des do
  namespace :db do

    task :migrate_local => :environment do
      puts "*** Migrating Databases... ***"
      Rake::Task["db:migrate"].invoke
      Rake::Task["db:test:prepare"].invoke
      puts "*** Migration Complete! ***"
    end

  end
end