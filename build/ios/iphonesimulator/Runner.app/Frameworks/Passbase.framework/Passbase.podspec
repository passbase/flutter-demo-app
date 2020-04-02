#
#  Be sure to run `pod spec lint Passbase.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

    spec.name           = 'Passbase'
    spec.version        = '1.7.10'
    spec.summary        = 'Passbase helps you to uniquely identify your users.'
    spec.description    = 'Passbase completes a facial recognition and checks for a valid government identification document to uniquely identify people.'
    spec.homepage       = 'https://www.passbase.com'
    spec.license        = { type: 'custom', text: 'Passbase is Copyright 2019 Passbase, Inc.  It may not be modified.' }
    spec.author         = { 'Mathias J. Klenk' => 'mathias@passbase.com' }
    spec.platform       = :ios, '10.0'
    spec.swift_version  = '4.2'
    spec.source       = { :git => 'https://github.com/passbase/passbase-sdk.git', :tag => spec.version.to_s }
    spec.requires_arc = true
    spec.source_files  = 'Passbase/**/*.{swift}'
    spec.resource_bundles = {
        'Passbase' => ['Passbase/**/*.{storyboard,png,gif,xcassets,ttf,xib,json,strings}']
    }

    spec.dependency 'ZoomAuthenticationHybrid', '~> 7.0.18'
    spec.dependency 'Sentry'
    spec.vendored_frameworks = 'Passbase.framework'

end
