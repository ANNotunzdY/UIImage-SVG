Pod::Spec.new do |s|

  s.name         = "UIImage+SVG"
  s.version      = "0.1"
  s.summary      = "SVG images for iOS. Category on UIKit's UIImage to display SVG files."

  s.description  = <<-DESC
                   SVG images for iOS. Category on UIKit's UIImage to display SVG files.

                   * Image Cache
                   * Fill with color
                   DESC

  s.homepage     = "http://docs.label305.com/uiimage-svg/master"
  s.license      = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author       = { "Freddie Tilley", "Thijs Scheepers" => "thijs@label305.com" }

  s.source       = { :git => "https://github.com/Label305/UIImage-SVG", :tag => "0.1" }


  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Classes/*.{h,m}'
  s.dependency 'RaptureXML', '~>1.0.1'

end
