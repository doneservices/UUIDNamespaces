Pod::Spec.new do |s|
  s.name         = "UUIDNamespaces"
  s.version      = %x(git describe --tags --abbrev=0).chomp
  s.summary      = "Namespace extensions for the built-in UUID class"
  s.description  = "This is a microlibrary for computing namespaced UUIDs (v3 and v5)"
  s.homepage     = "https://github.com/doneservices/UUIDNamespaces"
  s.license      = "MIT"
  s.author       = { "Linus Unnebäck" => "linus@folkdatorn.se" }

  s.swift_version         = "5.1"
  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/doneservices/UUIDNamespaces.git", :tag => "#{s.version}" }
  s.source_files = "Sources/UUIDNamespaces"
end
