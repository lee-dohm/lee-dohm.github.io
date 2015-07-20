require 'jekyll'
require 'rake/clean'
require 'tmpdir'
require 'yaml'

CLEAN.include('_site')

GITHUB_REPONAME = 'lee-dohm/lee-dohm.github.io'

# Deletes a draft when it is no longer needed.
#
# First ensures that it is deleted from Git and then ensures it is removed from the filesystem.
#
# @param [String] filename Name of the draft file to be deleted.
# @return [nil]
def delete_draft(filename)
  sh "git rm #{filename}" if `git ls-files #{filename}` != ''
  File.delete(filename) if File.exist?(filename)

  nil
end

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
  File.join('_posts', format('%d-%02d-%02d-%s.md', now.year, now.month, now.day, file_title(title)))
end

# Converts a post title into a filename-formatted title.
#
# @param [String] title Title of the post.
# @return [String] Title of the post formatted for use in a filename.
def file_title(title)
  title.downcase.gsub(/\s+/, '-').gsub(/-{2,}/, '-').gsub(':', '')
end

# Gets the title passed on the command line.
#
# @param [String] task_name Name of the currently executing Rake task
#                           for the error message if a
#                           title wasn't supplied.
# @returns [String] Title for the post.
# @raise [StandardError] When a title is not passed on the command line.
def get_title(task_name)
  unless ENV['title']
    fail "Must supply a title!  Example: rake #{task_name} title=\"Best #Title Evar!!!\""
  end

  ENV['title']
end

def get_url(task_name)
  unless ENV['url']
    fail "Must supply a URL! Example: rake #{task_name} url=\"http://www.example.com\""
  end

  ENV['url']
end

def open_post(path)
  sh("atom #{path}")
end

# Reads a post and returns its metadata and content.
#
# @param [String] path Path to the post.
# @return [Array(Hash, String)] The metadata and the content of the post.
def read_post(path)
  chunks = IO.read(path).split(/^---\s*$/)

  metadata = YAML.load("---\n" + chunks[1])

  [metadata, chunks[2]]
end

# Writes the post to the given path.
#
# @param [String] path Path to which to write the post.
# @param [Hash] metadata Metadata for the post.
# @param [String] content Content for the post.
def write_post(path, metadata, content = nil)
  File.open(path, 'w') do |f|
    f.puts metadata.to_yaml
    f.puts '---'
    f.puts content
  end
end

desc 'Create a new draft, must supply title='
task :draft do |task_name|
  title = get_title(task_name)

  metadata = {
    'layout' => 'post',
    'title' => title
  }

  path = draft_filename(title)
  mkdir '_drafts' unless Dir.exist?('_drafts')
  write_post(path, metadata)
  open_post(path)
end

desc 'Publish a draft, must supply title='
task :publish do |task_name|
  title = get_title(task_name)

  now = Time.new
  path = filename(title, now)

  draft_path = draft_filename(title)
  metadata, content = read_post(draft_path)
  metadata['date'] = now

  mkdir '_posts' unless Dir.exist?('_posts')
  write_post(path, metadata, content)

  delete_draft(draft_path)
end

task :link do |task_name|
  title = get_title(task_name)
  url = get_url(task_name)

  now = Time.new

  metadata = {
    'layout' => 'link',
    'title' => title,
    'address' => url,
    'date' => now
  }

  path = filename(title, now)
  mkdir '_posts' unless Dir.exist?('_posts')
  write_post(path, metadata)
  open_post(path)
end

desc 'Start the Jekyll server for local validation'
task server: [:clean] do
  sh 'jekyll serve --watch --drafts'
end

desc 'Generate blog files'
task :generate do
  Jekyll::Site.new(Jekyll.configuration({})).process
end

desc 'Prints the entire processed configuration'
task :dump_config do
  puts Jekyll.configuration({}).to_yaml
end

task push: [:publish] do
  puts "The `push` task is deprecated. Use `publish` instead."
end

desc 'Generate and push blog'
task publish: [:generate] do
  Dir.mktmpdir do |tmp|
    cp_r '_site/.', tmp
    Dir.chdir tmp
    sh 'git init'
    sh 'git add .'
    message = "Site updated at #{Time.now.utc}"
    sh "git commit -m #{message.shellescape}"
    sh "git remote add origin git@github.com:#{GITHUB_REPONAME}.git"
    sh 'git push origin master --force'
  end
end

desc 'Copy emoji to the Rails `public/images/emoji` directory'
task :emoji do
  require 'emoji'

  target = "#{Rake.original_dir}/images/emoji"

  mkdir_p "#{target}"
  Dir["#{Emoji.images_path}/emoji/*.png"].each do |src|
    cp src, "#{target}/"
  end

  mkdir_p "#{target}/unicode"
  Dir["#{Emoji.images_path}/emoji/unicode/*.png"].each do |src|
    cp src, "#{target}/unicode/"
  end
end
