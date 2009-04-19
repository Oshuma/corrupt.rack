require 'fileutils'

namespace :corrupt do
  task :vendor_env do
    @destination = 'vendor/corrupt'
    @vendor_dir = File.dirname(__FILE__) + '/../vendor'
  end

  task :clean_vendor => [ :vendor_env ] do
    FileUtils.rm_r(@destination) if File.exists?(@destination)
  end

  desc 'Freeze the Corrupt gem into ./vendor'
  task :freeze => [ :clean_vendor ] do
    `gem unpack corrupt --target #{@vendor_dir}`
    FileUtils.mv(Dir['vendor/corrupt-*'].first, @destination)
  end

  desc 'Un-freeze the Corrupt gem (remove ./vendor/corrupt/)'
  task :unfreeze => [ :clean_vendor ]
end
