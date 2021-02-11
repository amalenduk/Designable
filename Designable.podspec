#
# Be sure to run `pod lib lint Designable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'Designable'
    s.version          = '1.0.1'
    s.summary          = 'Designables are fully customisable subclass of UIView, UIButton, UIImageView'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    'Designables are fully customisable subclass of UIView, UIButton, UIImageView. Designables are @IBDesignable classes so that it\'s rendered in your storyboard, and all its properties are @IBInspectable so that you can customize your UIView, UIButton, UIImageView inside the storyboard in the Attributes inspector.'
    DESC
    
    s.homepage         = 'https://github.com/amalenduk/Designable'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Amalendu Kar' => 'shipraindia.tech@gmail.com' }
    s.source           = { :git => 'https://github.com/amalenduk/Designable.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
    s.ios.deployment_target = '11.0'
    s.swift_versions = ['5.0']
    
    s.source_files = 'Source/**/*'
    
    # s.resource_bundles = {
    #   'Designable' => ['Designable/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
end
