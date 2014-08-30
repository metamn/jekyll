require 'filewatcher'
require 'fileutils'

root = Dir.pwd
destination = '_site/assets/styles'
extension = '.liquid'

puts "Watching #{extension} files in #{destination}"

compile = true

FileWatcher.new(["#{destination}/*#{extension}", "#{destination}/**/*#{extension}"]).watch do |filename|
  if compile 
    # filename: ./_site/assets/styles/atoms/test.liquid
    puts "Updated " + filename

    # replace ./_site with absolute path
    absolute = filename.sub "./", "#{root}/"

    # add .scss to .liquid
    scss = absolute.sub ".liquid", ".liquid.scss"

    # copy .liquid to .liquid.scss
    FileUtils.cp_r absolute, scss

    # recompile screen.css with compass
    puts system('sudo compass compile')
    
    # during the compilation the .liquid will be updated again
    # tell this script do not enter in an endless loop
    compile = false
  else
    compile = true
  end
end