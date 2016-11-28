
Pod::Spec.new do |s|

  s.name         = "SQAppMediator"
  s.version      = "0.0.1"
  s.summary      = "iOS组件化架构"




  s.homepage     = "https://github.com/CoderSQ/SQAppMediator.git"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "CoderSQ" => "steven_shuang@126.com" }
  # Or just: s.author    = "CoderSQ"
  # s.authors            = { "CoderSQ" => "steven_shuang@126.com" }
  # s.social_media_url   = "http://twitter.com/CoderSQ"


  # s.platform     = :ios
  s.platform     = :ios, "7.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/CoderSQ/SQAppMediator.git", :tag => "#{s.version}" }

  s.source_files  = "SQAppMediator", "*.{h,m}"
  #s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  s.framework  = "UIKit"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
