#
# Copyright (c) 2014 by Lifted Studios. All Rights Reserved.
#

require 'nokogiri'

module Jekyll
  module LightboxFilter
    def lightboxify(content)
      return false if !content

      doc = Nokogiri::HTML::parse(content)
      doc.css('img').each do |node|
        node['width'] = '100%'
        node.replace(Nokogiri.make("<a href='#{node.attribute('src')}' data-lightbox='#{node.attribute('alt')}' data-title='#{node.attribute('alt')}'>#{node.to_html}</a>"))
      end

      doc.to_html
    end
  end
end

Liquid::Template.register_filter(Jekyll::LightboxFilter)
