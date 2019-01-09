require_relative 'lib/engine'


print "Cleanup previous compilation...\n"
cleanup


print "Converting styles...\n"
style 'index/index.sass'
style 'if/if.sass'


print "Compile scripts...\n"
scripts


print "Copying assets...\n"
assets


print "Loading stored data...\n"
data 'data.yml'


print "Writing templates...\n"
route '/', template: 'index'
route '/if', template: 'if', layout: 'if'

route '/portfolio', template: 'projects', layout: 'portfolio'
Store['projects'].each do |project|
  route "/portfolio/#{ project['slug'] }",
    template: 'project',
    layout: 'portfolio',
    locals: { project: project }
end
