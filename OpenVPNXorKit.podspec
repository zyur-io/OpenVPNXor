#
# Be sure to run `pod lib lint OpenVPNXor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OpenVPNXorKit'
  s.version          = '2.3.1'
  s.summary          = 'Library for simple connection via OpenVPN protocol with Xor patch.'
  s.module_name      = 'OpenVPNXorKit'

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
  s.swift_versions   = ['6.0', '6.1', '6.2']
  
  # Build from source instead of using precompiled binary
  s.source           = { :git => 'https://github.com/zyur-io/OpenVPNXor.git', :branch => 'main' }
  
  # All source files (Swift, Objective-C, C++)
  s.source_files     = 'Sources/Managers/*.swift', 
                       'Sources/*.swift',
                       'Sources/OpenVPNAdapter/**/*.{h,m,mm,cpp}',
                       'Sources/MMWormhole/*.{h,m}'
  
  # Public headers
  s.public_header_files = 'Sources/OpenVPNAdapter/Umbrella-Header.h',
                          'Sources/OpenVPNAdapter/*.h',
                          'Sources/MMWormhole/*.h'
  
  # Preserve vendor libraries
  s.preserve_paths   = 'Sources/OpenVPNAdapter/Libraries/**/*'
  s.vendored_libraries = 'Sources/OpenVPNAdapter/Libraries/Vendors/lz4/lib/ios/liblz4.a',
                         'Sources/OpenVPNAdapter/Libraries/Vendors/mbedtls/lib/ios/libmbedcrypto.a',
                         'Sources/OpenVPNAdapter/Libraries/Vendors/mbedtls/lib/ios/libmbedtls.a',
                         'Sources/OpenVPNAdapter/Libraries/Vendors/mbedtls/lib/ios/libmbedx509.a'
  
  # Configure build settings
  s.libraries        = 'c++', 'z', 'resolv'
  s.frameworks       = 'NetworkExtension', 'SystemConfiguration', 'CoreFoundation', 'CFNetwork', 'Security'
  s.requires_arc     = true
  
  s.pod_target_xcconfig = { 
    'DEFINES_MODULE' => 'YES',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'HEADER_SEARCH_PATHS' => '$(PODS_TARGET_SRCROOT)/Sources/OpenVPNAdapter/Libraries/Vendors/asio/asio/include $(PODS_TARGET_SRCROOT)/Sources/OpenVPNAdapter/Libraries/Vendors/openvpn $(PODS_TARGET_SRCROOT)/Sources/OpenVPNAdapter/Libraries/Vendors/lz4/include $(PODS_TARGET_SRCROOT)/Sources/OpenVPNAdapter/Libraries/Vendors/mbedtls/include',
    'OTHER_CFLAGS' => '-DUSE_ASIO -DASIO_STANDALONE -DASIO_NO_DEPRECATED -DHAVE_LZ4 -DUSE_MBEDTLS',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'GCC_WARN_INHIBIT_ALL_WARNINGS' => 'YES'
  }
end
