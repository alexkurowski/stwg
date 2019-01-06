require 'slim'

require_relative 'lib/engine'
require_relative 'lib/template'
require_relative 'lib/slim_helper'


print "Cleanup previous compilation...\n"
cleanup


print "Converting styles...\n"
style 'index.sass'


print "Compile scripts...\n"
scripts


print "Writing templates...\n"
route '/', template: 'index'
route '/if', template: 'if', layout: 'if'
