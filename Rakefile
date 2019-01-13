task default: ['compile']

task c: :compile
task :compile do
  ruby 'config.rb'
end

task s: :serve
task :serve do
  print "Running at: http://localhost:3000\n"
  ruby '-run -e httpd dist -p 3000'
end

task d: :deploy
task :deploy do
  Rake::Task['compile'].invoke

  `rm -rf ../alexkurowski.github.io/*`
  `cp -r dist/* ../alexkurowski/github.io`
  print "Files copied\n"
end
