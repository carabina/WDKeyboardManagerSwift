Pod::Spec.new do |s|

s.platform = :ios
s.name             = "WDKeyboardManagerSwift"
s.version          = "0.0.1"
s.summary          = "WDKeyboardManagerSwift is a keyboard manager for iOS apps."

s.description      = <<-DESC
This fantastic library enables you to setup automatic moving content to prevent keyboard to cover UITextField and UITextView, and to close keyboard on simple touch. You don't have to write any single line of code or to setup anything in Storyboard. Just import this library in project.
DESC

s.homepage         = "https://github.com/VladimirDinic/WDKeyboardManagerSwift"
s.license          = { :type => "MIT", :file => "LICENSE" }
s.author           = { "Vladimir Dinic" => "vladimir88dev@gmail.com" }
s.source           = { :git => "https://github.com/VladimirDinic/WDKeyboardManagerSwift.git", :tag => "#{s.version}"}

s.ios.deployment_target = "10.0"
s.source_files = "WDKeyboardManagerSwift/WDKeyboardManagerSwift/WDKeyboardManagerSwift/*"

end
