xcodeproj 'Tests/RKValueTransformersTests'
workspace 'RKValueTransformers'
inhibit_all_warnings!

def import_pods
  pod 'Expecta', '~> 0.2.1'
  pod 'RKValueTransformers', :path => '.'
end

target :ios do
  platform :ios, '5.0'
  link_with 'iOS Tests'
  import_pods
end

target :osx do
  platform :osx, '10.7'
  link_with 'OS X Tests'
  import_pods
end
