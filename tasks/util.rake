namespace :util do
  desc 'Setup the development environment'
  task :setup_dev do
    Rake::Task['db:migrate'].invoke
  end
end
