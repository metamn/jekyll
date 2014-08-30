module Jekyll
  class ScssTag < Liquid::Tag

    def initialize(tag_name, notused, tokens)
      super
    end

    def render(context)
      filename = context.environments.first["page"]["scss"]
      folder = context.environments.first["page"]["category"]
      root = Dir.pwd
      file = root + "/assets/styles/" + folder + "/" + filename
      
      File.open(file, 'r') { |f| f.read }
    end
  end
end

Liquid::Template.register_tag('scss', Jekyll::ScssTag)