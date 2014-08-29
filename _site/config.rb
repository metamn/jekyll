# Require any additional compass plugins here.
require 'sass-globbing'
require 'harsh'

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "assets/styles"
sass_dir = "assets/styles"
images_dir = "assets/images"
javascripts_dir = "assets/scripts"
fonts_dir = "assets"

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed
output_style = :compact

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
line_comments = false


# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass assets scss && rm -rf sass && mv scss sass



watch "#{sass_dir}/**/*.liquid" do |project_dir, relative_path|
  if File.exists?(File.join(project_dir, relative_path))
    # project_dir: /home/cs/work/jekyll
    # relative_path: _site/assets/styles/atoms/test.liquid
    
    if File.extname(relative_path) == ".liquid"
      # replace .liquid with .scss
      #=> _site/assets/styles/atoms/test.scss
      scss = relative_path.sub ".liquid", ".scss"
      
      # remove .liquid
      liquid = relative_path.sub ".liquid", ""
      
      # replace _site with project dir
      #=> /home/cs/work/jekyll/assets/styles/atoms/test.scss
      filename = scss.sub "_site", project_dir

      
      # write new file to destination
      FileUtils.cp(relative_path, filename)
      # rename the .liquid file in order to avoid endless re-generations
      FileUtils.mv(relative_path, liquid)
    end
  end
end