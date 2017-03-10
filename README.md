# WDKeyboardManagerSwift
This library enables you to setup automatic moving content to prevent keyboard to cover UITextField and UITextView, and to close keyboard on simple touch. You have to write only one line of code (only one) and you don't have to setup anything in Storyboard.

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/WDKeyboardManagerSwift.svg)](http://cocoapods.org/pods/WDKeyboardManagerSwift)
[![License](https://img.shields.io/cocoapods/l/WDKeyboardManagerSwift.svg?style=flat)](http://cocoapods.org/pods/WDKeyboardManagerSwift)
[![Platform](https://img.shields.io/cocoapods/p/WDKeyboardManagerSwift.svg?style=flat)](http://cocoapods.org/pods/WDKeyboardManagerSwift)

For ObjectiveC version of this library, look at [WDKeyboardManager](https://github.com/VladimirDinic/WDKeyboardManager)

![GitHub Logo](https://github.com/VladimirDinic/WDKeyboardManager/blob/master/Docs/WDKeyboardManager.gif)

#Installation:
##Manual:
Download this project and add WDKeyboardManagerSwift folder (with WDKeyboardManagerSwift.swift file) to your project

##CocoaPods:
```Ruby
target '<TargetName>' do
    use_frameworks!
    pod 'WDKeyboardManagerSwift', ' ~> 0.0.2'
end
```

# Usage
After you include this library in your project, just open AppDelegate, include WDKeyboardManagerSwift library add this single line in inside didFinishLaunchingWithOptions method:
```Swift
let _:WDKeyboardManagerSwift = WDKeyboardManagerSwift.sharedInstance
```
Example:
```Swift
import WDKeyboardManagerSwift
...
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    ...
    let _:WDKeyboardManagerSwift = WDKeyboardManagerSwift.sharedInstance
    ...
}
```

# Note
Library is working and will be updated regularly and documentation is in preparation
