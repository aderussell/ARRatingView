#
# Be sure to run `pod lib lint ARRatingView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = "ARRatingView"
s.version          = "1.1.0"
s.summary          = "A rating control for iOS."
s.description      = "This CocoaPod provides an interactive control for giving a star based rating."

s.homepage         = "https://github.com/aderussell/ARRatingView"

# s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"

s.license          = 'MIT'

s.author           = { "aderussell" => "adrianrussell@me.com" }
s.social_media_url = 'https://twitter.com/ade177'

s.source           = { :git => "https://github.com/aderussell/ARRatingView.git", :tag => s.version.to_s }


s.platform     = :ios, '7.0'
s.requires_arc = true

s.source_files = 'ARRatingView/*'
s.frameworks = 'UIKit'

end
