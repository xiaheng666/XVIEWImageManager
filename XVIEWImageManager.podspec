#
# Be sure to run `pod lib lint XVIEWImageManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XVIEWImageManager'
  s.version          = '0.1.9'
  s.summary          = '多图选择'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/xiaheng666/XVIEWImageManager'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xiaheng666' => 'key@xiaheng.net' }
  s.source           = { :git => 'git@github.com:xiaheng666/XVIEWImageManager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'XVIEWImageManager/Classes/XVIEWMultiImageManager/*.h','XVIEWImageManager/Classes/HXPhotoPicker/*.{h,m}','XVIEWImageManager/Classes/XVIEWMultiImageManager/*.{h,m}','XVIEWImageManager/Classes/YYWebImage/**/*.{h,m}','XVIEWImageManager/Classes/YYWebImage/*.{h,m}'
  
  #   s.resource_bundles = {
  #    'XVIEWImageManager' => ['XVIEWImageManager/Assets/*']
  #}

   s.ios.vendored_libraries = 'XVIEWImageManager/Classes/XVIEWMultiImageManager/*.a'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  #s.libraries = 'stdc++'
  #  s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'YYWebImage','1.0.5'
#s.dependency 'RITLPhotos', '~> 2.2.0'
end
