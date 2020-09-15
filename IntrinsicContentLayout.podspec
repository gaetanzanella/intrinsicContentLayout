#
# Be sure to run `pod lib lint IntrinsicContentLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IntrinsicContentLayout'
  s.version          = '1.0.0'
  s.summary          = 'IntrinsicContentLayout'
  s.swift_version    = "5.0"

  s.description      = 'IntrinsicContentLayout'

  s.homepage         = 'https://github.com/fabernovel/IntrinsicContentLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  # s.author           = { 'IntrinsicContentLayout' => 'IntrinsicContentLayout@fabernovel.com' }
  s.source           = { :git => 'https://github.com/fabernovel/IntrinsicContentLayout.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'Source/Classes/**/*'
end
