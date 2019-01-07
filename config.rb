require_relative 'lib/engine'


print "Cleanup previous compilation...\n"
cleanup


print "Converting styles...\n"
style 'index.sass'


print "Compile scripts...\n"
scripts


print "Loading stored data...\n"
data 'data.yml'


print "Writing templates...\n"
route '/', template: 'index'
route '/if', template: 'if', layout: 'if'
