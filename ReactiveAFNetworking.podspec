#
# Be sure to run `pod lib lint ReactiveAFNetworking.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ReactiveAFNetworking'
  s.version          = '1.1.0'
  s.summary          = 'Wrapping AFNetworking with ReactiveObjC'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Using AFNetworking 4 and update ReactiveObjc, hopefully will become replacement for popular AFNetworking+RACExtension
                       DESC

  s.homepage         = 'https://github.com/ibnusina/ReactiveAFNetworking'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ibnu Sina' => 'ibnu.sina009@gmail.com' }
  s.source           = { :git => 'https://github.com/ibnusina/ReactiveAFNetworking.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'ReactiveAFNetworking/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ReactiveAFNetworking' => ['ReactiveAFNetworking/Assets/*.png']
  # }

  s.public_header_files = 'ReactiveAFNetworking/Classes/*.h'
  s.dependency 'AFNetworking', '~> 4'
  s.dependency 'ReactiveObjC', '>= 1'
end
