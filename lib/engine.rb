def cleanup
  `rm -rf dist/*`
end

def scripts
  `webpack --mode development`
end

def style(src)
  dest = src[0 ... src.index('.')]

  `sass src/styles/#{src} dist/#{dest}.css`
end

def route(r, opts, &block)
  Template.new r, opts
end

