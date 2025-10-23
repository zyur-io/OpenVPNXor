#
# Be sure to run `pod lib lint OpenVPNXor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OpenVPNXor'
  s.version          = '2.3.1'
  s.summary          = 'Library for simple connection via OpenVPN protocol with Xor patch.'

  s.description      = <<-DESC
OpenVPNXor is a library that allows to configure and establish VPN connection using OpenVPN protocol easily. It is based on the original openvpn3 library so it has every feature the library has.
The library is designed to use in conjunction with NetworkExtension framework and doesn't use any private Apple API. Compatible with iOS and macOS and also Swift friendly.
Built from source for Swift 6.2 compatibility.
                       DESC

  s.homepage         = 'https://github.com/zyur-io/OpenVPNXor'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zyur Team' => 'contact@zyur.io' }

  s.platform         = :ios, "12.0"
  s.ios.deployment_target = '12.0'
  
  # Build from source instead of using precompiled binary
  s.source           = { :git => 'https://github.com/zyur-io/OpenVPNXor.git', :branch => 'main' }
  s.source_files     = 'Sources/**/*.{h,m,mm,cpp,c,swift}'
  s.public_header_files = 'Sources/**/*.h'
  s.preserve_paths   = 'Sources/**/*'
  
  s.libraries        = 'c++', 'z', 'resolv'
  s.frameworks       = 'NetworkExtension', 'SystemConfiguration', 'CoreFoundation', 'CFNetwork', 'Security'
  s.requires_arc     = true
  
  s.xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'SWIFT_VERSION' => '6.2',
    'OTHER_CFLAGS' => '-DUSE_ASIO -DASIO_STANDALONE -DASIO_NO_DEPRECATED -DHAVE_LZ4'
  }
  
  s.pod_target_xcconfig = { 
    'SWIFT_VERSION' => '6.2',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES'
  }
  s.user_target_xcconfig = { 
    'SWIFT_VERSION' => '6.2'
  }
end
