# STAlertController

[![Language](https://img.shields.io/badge/language-Swift-limegreen.svg?style=flat)](http://cocoapods.org/pods/STAlertController)
[![Platform](https://img.shields.io/cocoapods/p/STAlertController.svg?style=flat)](http://cocoapods.org/pods/STAlertController)
[![Version](https://img.shields.io/cocoapods/v/STAlertController.svg?style=flat)](http://cocoapods.org/pods/STAlertController)
[![License](https://img.shields.io/cocoapods/l/STAlertController.svg?style=flat)](http://cocoapods.org/pods/STAlertController)

## A subclass of UIAlertController that can be presented one by one in a queue

STAlertController is a subclass of UIAlertController that can be presented one by one in a queue. When STAlertController is clicked and disappears, the next STAlertController will be presented.

![STAlertControllerPreview01](https://github.com/shien7654321/STAlertController/raw/master/Preview/STAlertControllerPreview01.gif)

## Requirements

- iOS 8.0 or later
- ARC
- Swift 5.0

## Installation

STAlertController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'STAlertController'
```

## Usage

### Import headers in your source files

In the source files where you need to use the library, import the header file:

```swift
import STAlertController
```

### Initialize STAlertController

Use the following function to initialize the STAlertController:

```swift
let alertController = STAlertController(title: "Title", message: "Message", preferredStyle: .alert)
```

### Initialize STAlertAction

Use the following function to initialize the STAlertAction:

```swift
let alertAction = STAlertAction.createAction(title: "OK", style: .cancel) { action in
    print("Clicked OK")
}
```

### AddAction

Use the following function to add the STAlertAction to the STAlertController:

```swift
alertController.addAction(alertAction)
```

### PresentAlertController

At last, use the following function to present the STAlertController on an instance of UIViewcontroller:

```swift
presentAlertController(alertController)
```

### DismissAlertController

Of course, the following methods can also be used to dimiss the STAlertController:

```swift
dismissAlertController()
```

## Author

Suta, shien7654321@163.com


## License

[MIT]: http://www.opensource.org/licenses/mit-license.php
[MIT license][MIT].