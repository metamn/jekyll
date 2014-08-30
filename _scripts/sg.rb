require 'filewatcher'
require 'fileutils'

root = Dir.pwd
destination = '_site/assets/styles'
extension = '.liquid'

puts "Watching #{extension} files in #{destination}"

FileWatcher.new(["#{destination}/*#{extension}", "#{destination}/**/*#{extension}"]).watch do |filename|
  # filename: ./_site/assets/styles/atoms/test.liquid
  puts "Updated " + filename
  
  # replace ./_site with absolute path
  absolute = filename.sub "./", "#{root}/"
  
  # add .scss to .liquid
  scss = absolute.sub ".liquid", ".liquid.scss"
  
  # copy .liquid to .liquid.scss
  FileUtils.cp_r absolute, scss
  
  # recompile screen.css with compass
  # puts system('sudo compass compile')
end