# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mythtoplex/version'

Gem::Specification.new do |spec|
  spec.name          = "mythtoplex"
  spec.version       = Mythtoplex::VERSION
  spec.authors       = ["Chris Holmes"]
  spec.email         = ["christopher.holmes@twc-contractor.com"]

  spec.summary       = %q{MythToPlex is a mythtv post processing script}
  spec.description   = %q{Post processing script to transcode from MPEG2 to
                          h.264 and rename shows and add them to plex}
  spec.homepage      = "https://github.com/Holmser/mythtoplex"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'streamio-ffmpeg', '~> 1.0'
  spec.add_runtime_dependency 'awesome_print', '~> 1.6', '>= 1.6.1'
  spec.add_runtime_dependency 'ruby-progressbar', '~> 1.7', '>= 1.7.5'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
