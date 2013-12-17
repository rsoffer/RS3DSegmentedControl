#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "RS3DSegmentedControl"
  s.version      = "0.1.0"
  s.summary      = "A 3D filter control that gives users a fun way to browse between many segments."
  s.description  = <<-DESC
                    An optional longer description of RS3DSegmentedControl

                    * Markdown format.
                    * Don't worry about the indent, we strip it!
                   DESC
  s.homepage     = "http://EXAMPLE/NAME"
  s.screenshots  = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license      = 'MIT'
  s.author       = { "Ron Soffer" => "rsoffer1@gmail.com" }
  s.source       = { :git => "https://github.com/rsoffer/RS3DSegmentedControl", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'RS3DSegmentedControl'
  s.resources = 'Assets'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  s.dependency 'iCarousel'
end
