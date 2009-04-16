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

  desc 'Clean, rebuild and install the gem'
  task :install => [ :clean, :build ] do
    gem = FileList["#{ROOT_DIR}/*.gem"].first
    sudo = RUBY_PLATFORM !~ /win32/ ? "sudo" : ""
    begin
    sh "#{sudo} gem uninstall corrupt"
    rescue
    end
    sh "#{sudo} gem install #{gem}"
  end

  desc 'Clean and rebuild the gem'
  task :rebuild => [ :clean, :build ]
end
