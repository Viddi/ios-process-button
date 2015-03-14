# ProcessButton

iOS Buttons that animate while an action is being processed. Written in Swift.

![](ProcessButton.gif)

This library was extracted from an iOS application that I was working on at the time. It's used for any sort of action that is processed asynchronously, and shows a loading-like animation until the action is done.

## Usage

Basic asynchronous task animation

```
@IBOutlet weak var btnSignIn: ProcessButton!

btnSignIn.animate(true)

// Do some some asynchronous stuff here
// and display result from callback

if callbackSuccess {
  self.btnSignIn.showSuccessText("Success", seconds: ProcessButtonUtil.Length.Short)
} else {
  self.btnSignIn.showErrorText("Error", seconds: ProcessButtonUtil.Length.Long)
}
```

**Optional** To change the colors of the lines and the duration

```
// App wide customization
let colors = [UIColor.blueColor(), UIColor.redColor(), UIColor.greenColor()]
let duration: NSTimeInterval = 0.3
    
ProcessButtonUtil.sharedInstance
  .setColors(colors) // The colors for the animating lines. Can be any number of colors
  .setDuration(duration) // The time for each line to animate. Default is 0.5
```

Take a look at the project to see a full example.

## Requirements

* iOS 8 or later
* Xcode 6 or later

## Author
Vidar Ottosson, viddi@nplexity.com

## License

ProcessButton is available under the MIT license. See the LICENSE file for more info.