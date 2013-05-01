
task :post do
  now = Time.new
  title = ENV['title']
  file_title = title.downcase.gsub(' ', '-')
  filename = '_posts/%d-%02d-%02d-%s.md' % [now.year, now.month, now.day, file_title]
  mkdir '_posts' unless Dir.exists?('_posts')
  File.open(filename, 'w') do |f|
    f.puts '---'
    f.puts 'layout: post'
    f.puts "title: #{title}"
    f.puts '---'
    f.puts
  end
end
