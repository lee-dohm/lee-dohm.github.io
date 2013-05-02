
require 'rake/clean'

CLEAN.include('_site')

desc 'Create a new post, must supply title='
task :post do
  fail 'Must supply a title!  Example: rake post title="Best Title Evar!!!"' unless ENV['title']
  title = ENV['title']

  now = Time.new
  file_title = title.downcase.gsub(' ', '-')
  filename = '_posts/%d-%02d-%02d-%s.md' % [now.year, now.month, now.day, file_title]

  mkdir '_posts' unless Dir.exists?('_posts')
  File.open(filename, 'w') do |f|
    f.puts '---'
    f.puts 'layout: post'
    f.puts "title: #{title}"
    f.puts 'published: false'
    f.puts 'tags: '
    f.puts "date: #{now}"
    f.puts '---'
    f.puts
  end
end

desc 'Start the Jekyll server for local validation'
task :server do
  sh 'jekyll --server --auto'
end
