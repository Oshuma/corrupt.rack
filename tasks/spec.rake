require 'spec/rake/spectask'

desc 'Run the specs'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_opts  = ['--options', 'spec/spec.opts']
  t.spec_files = FileList['spec/**/*_spec.rb']
end

desc 'Run the specs with autotest'
task :autotest do
  ENV['RSPEC'] = 'true'
  sh "autotest"
end
