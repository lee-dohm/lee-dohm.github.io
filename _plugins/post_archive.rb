#
# Copyright (c) 2013, 2015 by Lifted Studios. All Rights Reserved.
#

module Jekyll
  class PostArchiveTag < Liquid::Tag
    def render(context)
      docs = context.registers[:site].documents

      render_years(docs)
    end

    def render_years(posts)
      lines = []
      lines << '<!-- Rendering years -->'

      years = posts.map { |post| post.date.year }.uniq.sort { |x, y| y <=> x }
      years.each do |year|
        lines << "<h1><p class=\"text-center\">#{year}</p></h1>"
        lines << render_year(year, posts)
      end

      lines.flatten.join("\n")
    end

    def render_year(year, posts)
      lines = []
      lines << "<!-- Rendering year #{year} -->"
      lines << '<!-- Rendering months -->'

      months = posts.select { |post| post.date.year == year }
                    .sort { |x, y| y.date.month <=> x.date.month }
                    .map { |post| [post.date.month, post.date.strftime('%B')] }.uniq
      months.each do |month|
        lines << "<h2>#{month.last}</h2>"
        lines << render_month(year, month.first, posts)
      end

      lines
    end

    def render_month(year, month, posts)
      lines = []
      lines << "<!-- Rendering month #{month} #{year} -->"
      lines << '<!-- Rendering posts -->'

      ps = posts.select { |post| post.date.year == year && post.date.month == month }
                .sort { |x, y| y.date <=> x.date }

      lines << '<ul>'
      ps.each do |post|
        lines << "<li><a href=\"#{post.url}\">#{post.data["title"]}</a></li>"
      end
      lines << '</ul>'

      lines
    end
  end
end

Liquid::Template.register_tag('post_archive', Jekyll::PostArchiveTag)
