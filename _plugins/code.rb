module Jekyll
  class CodeTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
    end

    def render(context)
      filename = context.environments.first["page"]["#{@text}"]
      folder = context.environments.first["page"]["category"]
      root = Dir.pwd
      
      case @text
        when "scss"
          file = root + "/assets/styles/" + folder + "/" + filename
        when "html"
          file = root + "/_includes/" + folder + "/" + filename
        when "js"
          file = root + "/assets/scripts/" + folder + "/" + filename
      end
      
      File.open(file, 'r') { |f| f.read } if File.exist? file
    end
  end
end

Liquid::Template.register_tag('code', Jekyll::CodeTag)