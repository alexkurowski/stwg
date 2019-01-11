require_relative 'lib/engine'


print "Cleanup previous compilation...\n"
cleanup


print "Converting styles...\n"
style 'index/index.sass'


print "Compile scripts...\n"
scripts


print "Copying assets...\n"
assets


print "Loading stored data...\n"
data 'data.yml'


print "Writing templates...\n"
route '/', template: 'projects'
Store['projects'].each do |project|
  route "/#{ project['slug'] }",
    template: 'project',
    locals: { project: project }
end
