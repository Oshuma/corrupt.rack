namespace :notes do
  desc 'List all TODO notes'
  task :fixme do
    sh 'find ./ -type f -exec grep -Hn --color FIXME {} \;'
  end

  desc 'List all TODO notes'
  task :todo do
    sh 'find ./ -type f -exec grep -Hn --color TODO {} \;'
  end
end
