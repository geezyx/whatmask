# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'whatmask/version'

Gem::Specification.new do |gem|
  gem.name          = "whatmask"
  gem.version       = Whatmask::VERSION
  gem.summary       = %q{netmask calculator}
  gem.description   = %q{A ruby adaptation of whatmask http://www.laffeycomputer.com/whatmask.html}
  gem.license       = "LGPL-3.0-or-later"
  gem.authors       = ["Mike Gee"]
  gem.email         = "geezyx@gmail.com"
  gem.homepage      = "https://github.com/geezyx/whatmask"

  gem.files         = `git ls-files`.split($/)

  `git submodule --quiet foreach --recursive pwd`.split($/).each do |submodule|
    submodule.sub!("#{Dir.pwd}/",'')

    Dir.chdir(submodule) do
      `git ls-files`.split($/).map do |subpath|
        gem.files << File.join(submodule,subpath)
      end
    end
  end
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 2.3'
  gem.add_development_dependency 'rake', '~> 13.0.6'
  gem.add_development_dependency 'rspec', '~> 3.12'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
  gem.add_development_dependency 'yard', '~> 0.9'
end
