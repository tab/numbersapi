require_relative 'lib/numbersapi/version'

Gem::Specification.new do |spec|
  spec.name          = "numbersapi"
  spec.version       = Numbersapi::VERSION
  spec.authors       = ["tab"]
  spec.email         = ["tukhfatullin@gmail.com"]

  spec.summary       = %q{Numbersapi client}
  spec.description   = %q{Numbersapi client}
  spec.homepage      = "https://github.com/tab/numbersapi"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency('httparty', '>= 0.18.1')
  spec.add_dependency('hashie', '>= 4.1.0')
end
