# frozen_string_literal: true

Pod::Spec.new do |s|
  s.name = 'TwilioVideoIosCapacitor'
  s.version = '0.1.0'
  s.summary = 'This plugin is used to make video calls using Twilio Video platform on iOS'
  s.license = 'MIT'
  s.homepage = 'https://github.com/agodin3z/twilio-video-ios-capacitor'
  s.author = 'agodin3z'
  s.source = { git: 'https://github.com/agodin3z/twilio-video-ios-capacitor', tag: s.version.to_s }
  s.source_files = 'ios/Plugin/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
  s.resource_bundles = {
    'Plugin' => [
      'ios/Plugin/Plugin/*.xib'
    ]
  }
  s.ios.deployment_target = '11.0'
  s.dependency 'Capacitor'
  s.dependency 'TwilioVideo', '~> 3.6'
end
