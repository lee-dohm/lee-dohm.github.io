#
# Copyright (c) 2013 by Lifted Studios. All Rights Reserved.
#

module Jekyll
  # A Liquid tag for displaying the range of copyright years from the earliest
  # post to the current year.
  class CopyrightRangeTag < Liquid::Tag
    # Returns the text to replace the tag with in the final document.
    #
    # @param  context [Liquid::Context] Current Liquid template engine state.
    # @return [String] Text to put in place of the tag.
    def render(context)
      base_year = calculate_base_year(context)
      this_year = Time.now.year
      base_year == this_year ? base_year : "#{base_year}-#{this_year}"
    end

    # Determines the year of the earliest post.
    #
    # @param context [Liquid::Context] Current Liquid template engine state.
    # @return [Integer] Year of the earliest post.
    def calculate_base_year(context)
      context.registers[:site].documents.map { |post| post.date.year }.min
    end
  end
end

Liquid::Template.register_tag('copyright_range', Jekyll::CopyrightRangeTag)
