require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "simple_publisher"
    gem.summary = %Q{Defines a simple pub/sub layer for interaction with the Starling message queue.}
    gem.description = <<-DESC
More often than not you don't need a full fledged message queue like ActiveMQ
or RabbitMQ with a full size message format. For simple asynchronous distribution
tasks a very light weight persistent message queue like starling will be fine.
Nevertheless you want a more sophisticated interface to interact with than a
memcache interface. Simple Publisher tries to achieve exactly this: While using
Starling as the queuing system in the background we provide a messaging terminology 
well know and understood. The terminology is strongly inspired by JMS which is
kind a defacto standard for messaging on the API-level.
    DESC
    gem.email = "dirk@galaxycats.com"
    gem.homepage = "http://github.com/galaxycats/simple_publisher"
    gem.authors = ["Dirk Breuer"]
    
    gem.add_dependency "starling"
    
    gem.add_development_dependency "rspec", ">= 1.2.9"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "simple_publisher #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
