require_relative "lib/marksmith/version"

Gem::Specification.new do |spec|
  spec.name        = "marksmith"
  spec.version     = Marksmith::VERSION
  spec.authors     = [ "Adrian Marin" ]
  spec.email       = [ "adrian@adrianthedev.com" ]
  spec.homepage    = "https://github.com/avo-hq/marksmith"
  spec.summary     = "Marksmith is a GitHub-style markdown editor for Ruby on Rails applications."
  spec.description = "Marksmith is a GitHub-style markdown editor for Ruby on Rails applications."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/avo-hq/marksmith"
  spec.metadata["changelog_uri"] = "https://github.com/avo-hq/marksmith/releases"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.0.1"
  spec.add_dependency "redcarpet"
  spec.add_dependency "rouge"
end
