# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rock_paper_scissors_emoji/version'

Gem::Specification.new do |spec|
  spec.name          = "rock_paper_scissors_emoji"
  spec.version       = RockPaperScissorsEmoji::VERSION
  spec.authors       = ["yxlau"]
  spec.email         = ["yixuan.lau@gmail.com"]

  spec.summary       = %q{Play rock, paper, scissors with emoji.}
  spec.description   = %q{Play against the computer or play against another human being. Choose the number of games that must be won for the ultimate winner. Have fun.}
  spec.homepage      = "https://github.com/yxlau/rock_paper_scissors_emoji"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
