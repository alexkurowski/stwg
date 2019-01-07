task default: ['compile', 'serve']

task :compile do
  ruby 'config.rb'
end

task c: :compile

task :serve do
  print "Running at: http://localhost:3000\n"
  ruby '-run -e httpd dist -p 3000'
end

task s: :serve

task :deploy do
  `surge dist kurowski.surge.sh`
end
