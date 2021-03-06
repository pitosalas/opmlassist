# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{opmlassist}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pito Salas"]
  s.date = %q{2009-02-18}
  s.description = %q{Create and work with OPML files}
  s.email = %q{rps@salas.com}
  s.files = ["README.textile", "VERSION.yml", "lib/opmlassist.rb", "test/opmlassist_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/pitosalas/opmlassist}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
