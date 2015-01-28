require 'pygments'
require 'redcarpet'

# Custom Redcarpet Markdown renderer.
class CustomRenderer < Redcarpet::Render::HTML
  include Redcarpet::Render::SmartyPants

  # Customized code syntax highlighting.
  #
  # Includes support for line numbers.
  def block_code(code, language)
    Pygments.highlight(code, lexer: language, options: { lineanchors: 'line' })
  end
end

# rubocop:disable Style/ClassAndModuleChildren

# Custom Markdown converter.
class Jekyll::Converters::Markdown::CustomConverter
  # Initializes a new instance of the custom converter.
  def initialize(config)
    @config = config
  end

  # Convert the content using the custom Redcarpet renderer.
  #
  # @param content Content to convert.
  # @return [String] Generated HTML.
  def convert(content)
    renderer = Redcarpet::Markdown.new(CustomRenderer, config_to_hash)
    renderer.render(content)
  end

  private

  # rubocop:disable Style/EachWithObject

  # Converts the standard Redcarpet extensions array from the `_config.yml` into the options hash
  # that Redcarpet expects.
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
