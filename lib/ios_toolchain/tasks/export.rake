include IosToolchain::Helpers

desc 'builds the app'
namespace :export do
  task :archive, [:xcarchive_path, :ipa_path] do |t, args|
    args.with_defaults(:xcarchive_path => 'archive', :ipa_path => 'archive')

    puts '===================================='
    puts "=== Input Archive Path: in #{args[:xcarchive_path]}"
    puts "=== Output IPA Path: in #{args[:ipa_path]}"
    puts '===================================='


    build_cmd = []
    build_cmd << 'xcodebuild -project Core.xcodeproj'
    build_cmd << '-exportArchive'
	  build_cmd << "-archivePath #{args[:xcarchive_path]}/DongleData.xcarchive"
	  build_cmd << "-exportPath #{args[:ipa_path]}/DongleData.ipa"
    system(build_cmd.join(' '))
  end
end
