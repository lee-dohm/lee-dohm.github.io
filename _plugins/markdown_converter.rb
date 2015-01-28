require 'pygments'
require 'redcarpet'

# Custom Redcarpet Markdown renderer.
class CustomRenderer < Redcarpet::Render::HTML
  include Redcarpet::Render::SmartyPants

  def block_code(code, language)
    Pygments.highlight(code, lexer: language, options: { lineanchors: 'line' })
  end
end

# rubocop:disable Style/ClassAndModuleChildren

# Custom Markdown converter.
class Jekyll::Converters::Markdown::CustomConverter
  def initialize(config)
    @config = config
  end

  def convert(content)
    renderer = Redcarpet::Markdown.new(CustomRenderer, config_to_hash)
    renderer.render(content)
  end

  # rubocop:disable Style/EachWithObject

  def config_to_hash
    extensions = @config['redcarpet']['extensions']
    extensions.reduce({}) do |hash, ext|
      hash[ext.to_sym] = true
      hash
    end
  end

  # rubocop:enable Style/EachWithObject
end

# rubocop:enable Style/ClassAndModuleChildren
