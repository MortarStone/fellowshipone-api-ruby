Gem::Specification.new do |s|
  PROJECT_GEM = 'fellowshipone-api'
  PROJECT_GEM_VERSION = '0.2.0'
  
  s.name = PROJECT_GEM
  s.version = PROJECT_GEM_VERSION
  s.platform = Gem::Platform::RUBY

  s.homepage = 'https://github.com/weshays/fellowshipone-api-ruby'
  s.rubyforge_project = 'Project on www.github.com'
  s.authors = ['Wes Hays', 'Chad Feller']
  s.email = ['weshays@gbdev.com','feller@cs.unr.edu']

  s.summary = 'Ruby gem/plugin to interact with the FellowshipOne API (https://developer.fellowshipone.com/).'
  s.description = 'Ruby gem/plugin to interact with the FellowshipOne API (https://developer.fellowshipone.com/). Checkout the project on github for more detail.'

  s.add_dependency('typhoeus', '0.5.1')
  #s.add_dependency('oauth', '0.4.7')


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
