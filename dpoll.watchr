watch( '.*\.rb' ) do
  system 'rake rubocop spec'
end
