Pod::Spec.new do |s|
  s.name         = "RS3DSegmentedControl"
  s.version      = "0.2.4"
  s.summary      = "A 3D filter control that gives users a fun way to browse between many segments."
  s.description  = <<-DESC
		A 3D filter control that gives users a fun way to browse between many segments. Easy to use.
                   DESC
  s.homepage     = "https://github.com/rsoffer"
  s.screenshots  = "https://raw.github.com/rsoffer/RS3DSegmentedControl/master/sample.gif"
  s.license      = 'MIT'
  s.author       = { "Ron Soffer" => "rsoffer1@gmail.com" }
  s.source       = { :git => "https://github.com/rsoffer/RS3DSegmentedControl.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'RS3DSegmentedControl'
  s.resources = 'RS3DSegmentedControl.bundle'

  #s.ios.exclude_files = 'Classes/osx'
  #s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  
  s.dependency 'iCarousel'
end
