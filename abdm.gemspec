# frozen_string_literal: true

require_relative "lib/abdm_api/version"

Gem::Specification.new do |spec|
  spec.name = "abdm"
  spec.version = AbdmAPI::VERSION
  spec.authors = ["Vijendra Rao"]
  spec.email = ["vijendrakarkala@gmail.com"]

  spec.summary = "The Ayushman Bharat Digital Mission has developed building blocks and APIs to offer a seamless digital healthcare experience for all stakeholders – health facilities, patients and healthcare workers. The digital infrastructure developed is now accessible to health facilities and health tech players for integration."
  spec.description = "The Ayushman Bharat Digital Mission has developed building blocks and APIs to offer a seamless digital healthcare experience for all stakeholders – health facilities, patients and healthcare workers. The digital infrastructure developed is now accessible to health facilities and health tech players for integration."
  spec.homepage = "http://github.com/vijendra"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.1.8"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://github.com/vijendra"
  spec.metadata["changelog_uri"] = "http://github.com/vijendra"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  
  spec.add_dependency "faraday", "~>0.8.0"
end
