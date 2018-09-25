Pod::Spec.new do |s|

  s.name         = "STAlertController"
  s.version      = "0.0.2"
  s.summary      = "A subclass of UIAlertController that can be presented one by one in a queue."
  s.homepage     = "https://github.com/shien7654321/STAlertController"
  s.author       = { "Suta" => "shien7654321@163.com" }
  s.source       = { :git => "https://github.com/shien7654321/STAlertController.git", :tag => s.version.to_s }
  s.platform     = :ios, "8.0"
  s.requires_arc = true
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.frameworks   = "Foundation", "UIKit"
  s.source_files = "STAlertController/*.{swift}"
  s.compiler_flags = "-fmodules"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
  s.description    = <<-DESC
  STAlertController is a subclass of UIAlertController that can be presented one by one in a queue.
                       DESC

end
