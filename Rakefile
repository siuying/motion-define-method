# -*- coding: utf-8 -*-
require "bundler/gem_tasks"

$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler'
Bundler.require :default, :development

Motion::Project::App.setup do |app|
  app.name = 'define-method'
  app.files += ['lib/define-method/module_ext.rb']
end

desc "Build the gem"
task :gem do
  sh "bundle exec gem build motion-define-method.gemspec"
  sh "mkdir -p pkg"
  sh "mv *.gem pkg/"
end