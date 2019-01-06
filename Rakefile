task default: ['compile']

task :compile do
  ruby 'config.rb'
end

task :serve do
  ruby '-run -e httpd dist -p 3000'
end

task :deploy do
  `surge dist kurowski.surge.sh`
end

task s: :serve
