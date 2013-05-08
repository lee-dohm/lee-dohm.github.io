
require 'rake/clean'
require 'yaml'

CLEAN.include('_site')

# Creates draft path out of the title.
#
# @param [String] title Title of the post.
# @return [String] Path to the draft.
def draft_filename(title)
  File.join('_drafts', file_title(title) + '.md')
end

# Creates a post path out of the title and the post timestamp.
#
# @param [String] title Title of the post.
# @param [Time] now Timestamp of the post.
# @return [String] Path to the post.
def filename(title, now)
  File.join('_posts', '%d-%02d-%02d-%s.md' % [now.year, now.month, now.day, file_title(title)])
end

# Converts a post title into a filename-formatted title.
#
# @param [String] title Title of the post.
# @return [String] Title of the post formatted for use in a filename.
def file_title(title)
  title.downcase.gsub(' ', '-')
end

# Reads a post and returns its metadata and content.
#
# @param [String] path Path to the post.
# @return [Array<Hash, String>] Hash containing the metadata and String containing the content.
def read_post(path)
  chunks = IO.read(path).split(/^---\s*$/)

  metadata = YAML::load("---\n" + chunks[1])

  [metadata, chunks[2]]
end

desc 'Create a new draft, must supply title='
task :draft do
  fail 'Must supply a title!  Example: rake post title="Best Title Evar!!!"' unless ENV['title']
  title = ENV['title']

  path = draft_filename(title)

  metadata = {
    'layout' => 'post',
    'title' => title,
    'tags' => nil
  }

  mkdir '_drafts' unless Dir.exists?('_drafts')
  File.open(path, 'w') do |f|
    f.puts metadata.to_yaml
    f.puts '---'
    f.puts
  end
end

desc 'Publish a draft, must supply title='
task :publish do
  fail 'Must supply a title!  Example: rake post title="Best Title Evar!!!"' unless ENV['title']
  title = ENV['title']

  now = Time.new
  draft_path = draft_filename(title)
  path = filename(title, now)

  metadata, content = read_post(draft_path)

  metadata['date'] = now

  mkdir '_posts' unless Dir.exists?('_posts')
  File.open(path, 'w') do |f|
    f.puts metadata.to_yaml
    f.puts '---'
    f.puts content
  end

  rm draft_path
end

desc 'Start the Jekyll server for local validation'
task :server => :clean do
  sh 'jekyll serve --watch --drafts'
end
