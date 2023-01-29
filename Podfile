platform :ios, '13.0'

target 'AnimeApp' do
  use_frameworks!
  pod 'SDWebImage'
  pod 'SwiftLint'
  pod 'RxSwift'
  pod 'Alamofire'
  pod 'RealmSwift', '~>10'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
