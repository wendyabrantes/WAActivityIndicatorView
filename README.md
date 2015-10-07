# WAActivityIndicatorView
Swift Library using CAReplicator to make nice loading spinnner animation. 
The idea was inspired from Danil Gontovnik Objective-c repo https://github.com/gontovnik/DGActivityIndicatorView


![alt tag](https://raw.githubusercontent.com/wendyabrantes/WAActivityIndicatorView/master/WAActivityIndicatorPreview.gif)

## Requirements
* Xcode 6 or higher
* Swift 
* Apple LLVM compiler
* iOS 8.0 or higher (May work on previous versions, i just didnt test on it, feel free to edit)
* ARC

## Tutorial 
CAReplicator tutorial can be found at:
http://iostuts.io/2015/10/04/the-power-of-careplicatorlayer/

## Demo

Open and run the WAActivityIndicatorViewExample project in Xcode to see WAActivityIndicatorView in action. The example show how different animation.

## Installation

### Cocoapods

Install Cocoapods if it is not installed yet:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```

Add WAActivityIndicatorView to Podfile:

``` bash
pod 'WAActivityIndicatorView'
```

Call 'pod install':

``` bash
pod install
```

### Manual install

All you need to do is drop WATokenFieldView folder into your project and include headers.

## Example usage

``` swift
        pulseView = WAActivityIndicatorView(frame: CGRect(x: 50, y: itemSize, width: itemSize, height: itemSize),
                indicatorType: ActivityIndicatorType.Pulse,
                tintColor: UIColor.whiteColor(),
                indicatorSize: itemSize)

        view.addSubview(pulseView)
        
        pulseView.startAnimating()
```

## Type of animation

``` swift
enum ActivityIndicatorType{
    case Pulse
    case ThreeDotsScale
    case DotTriangle
    case GridDots
    
    func animation() -> WAActivityIndicatorProtocol {
        switch self {
        case .Pulse:
            return PulseAnimation();
        case .ThreeDotsScale:
            return ThreeDotsScaleAnimation();
        case .DotTriangle:
            return DotTriangleAnimation();
        case .GridDots:
            return GridDotsAnimation();
        }
    }
}
```

## Contact

Wendy Abrantes

- https://github.com/wendyabrantes
- https://twitter.com/wendyabrantes
- http://iostuts.io/
- abranteswendy@gmail.com

## License

The MIT License (MIT)

Copyright (c) 2015 Wendy Abrantes

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
