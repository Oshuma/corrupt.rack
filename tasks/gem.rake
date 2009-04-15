ROOT_DIR = File.expand_path(File.join(File.dirname(__FILE__), '..'))
GEMSPEC  = ROOT_DIR + '/corrupt.gemspec'

namespace :gem do
  desc 'Build the gem'
  task :build do
    sh "gem build #{GEMSPEC}"
  end

  desc 'Clean the built gem'
  task :clean do
    sh "rm -f #{ROOT_DIR}/*.gem"
  end

  desc 'Clean and rebuild the gem'
  task :rebuild => [ :clean, :build ]
end
