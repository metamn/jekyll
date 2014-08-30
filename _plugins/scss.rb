module Jekyll
  class ScssTag < Liquid::Tag

    def initialize(tag_name, file, tokens)
      super
      @file = file
    end

    def render(context)
      File.readlines "/home/cs/work/jekyll/assets/styles/atoms/color-constants.scss"
    end
  end
end

Liquid::Template.register_tag('scss', Jekyll::ScssTag)