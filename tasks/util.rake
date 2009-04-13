namespace :util do
  desc 'Setup the development environment'
  task :setup_dev do
    Rake::Task['db:migrate'].invoke
    Rake::Task['util:articles'].invoke
  end

  desc 'Create some test articles'
  task :articles => [ :environment ] do
    10.times do |i|
      attrs = {
        :title => "Article #{i}",
        :content => 'Some content. ' * 100
      }
      Article.create(attrs)
    end
  end
end
