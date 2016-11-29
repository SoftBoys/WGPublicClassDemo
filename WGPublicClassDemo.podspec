
Pod::Spec.new do |s|

  s.name         = "WGPublicClassDemo"
  s.version      = "0.0.3"
  s.summary      = "A short description of WGPublicClassDemo."

  s.homepage     = "https://github.com/SoftBoys/WGPublicClassDemo"

  s.license      = "MIT"

  s.author       = { "SoftBoys" => "gjw_1991@163.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/SoftBoys/WGPublicClassDemo.git", :tag => "#{s.version}" }

  s.source_files  = "WGPublicClass", "WGPublicClass/**/*.{h,m}"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
