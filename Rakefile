require "bundler/gem_tasks"
require "rake"
require "rake/testtask"

Rake::TestTask.new(:test) do |test|
	test.libs << 'lib' << 'test'
	test.pattern = 'test/*.rb'
end