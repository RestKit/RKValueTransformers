namespace :test do
  task :prepare do
    sh(%Q{mkdir -p "Tests/RKValueTransformersTests.xcodeproj/xcshareddata/xcschemes" && cp Tests/Schemes/*.xcscheme "Tests/RKValueTransformersTests.xcodeproj/xcshareddata/xcschemes/"})
  end

  desc "Run the RKValueTransformers Tests for iOS"
  task :ios => :prepare do
    $ios_success = system("xcodebuild -workspace RKValueTransformers.xcworkspace -scheme 'iOS Tests' -sdk iphonesimulator platform='iOS Simulator',name='iPhone Retina (4-inch)' clean test | xcpretty -c; exit ${PIPESTATUS[0]}")
  end

  desc "Run the RKValueTransformers Tests for Mac OS X"
  task :osx => :prepare do
    $osx_success = system("xcodebuild -workspace RKValueTransformers.xcworkspace -scheme 'OS X Tests' -sdk macosx clean test | xcpretty -c; exit ${PIPESTATUS[0]}")
  end
end

desc "Run the RKValueTransformers Tests for iOS & Mac OS X"
task :test => ['test:ios', 'test:osx'] do
  puts "\033[0;31m! iOS unit tests failed" unless $ios_success
  puts "\033[0;31m! OS X unit tests failed" unless $osx_success
  if $ios_success && $osx_success
    puts "\033[0;32m** All tests executed successfully"
  else
    exit(-1)
  end
end

task :default => 'test'
