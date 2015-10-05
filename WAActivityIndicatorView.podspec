#
#  Be sure to run `pod spec lint WATokenFieldView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "WAActivityIndicatorView"
  s.version      = "1.0"
  s.authors      = { "Wendy Abrantes" => "abranteswendy@gmail.com" }
  s.homepage     = "https://github.com/wendyabrantes/WAActivityIndicatorView"
  s.summary      = "Swift Library using CAReplicator to make nice loading spinnner animation"
  s.source       = { :git => "https://github.com/wendyabrantes/WAActivityIndicatorView.git",
                     :tag => '1.0' }
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.platform = :ios, '8.0'
  s.source_files = "WAActivityIndicatorView/**/*.swift"

  s.requires_arc = true
  
  s.ios.deployment_target = '8.0'
  s.ios.frameworks = ['UIKit', 'Foundation']
end