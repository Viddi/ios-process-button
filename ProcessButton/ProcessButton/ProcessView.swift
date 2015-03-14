//
//  ProcessView.swift
//  ProcessButton
//
//  Created by Vidar Ottosson on 2/7/15.
//  Copyright (c) 2015 Vidar Ottosson. All rights reserved.
//

import UIKit

class ProcessView: UIView {

  internal enum Colors {
    static let LoadingBlue = UIColor(red: 0 / 255.0, green: 221 / 255.0, blue: 255 / 255.0, alpha: 1.0)
    static let LoadingGreen = UIColor(red: 153 / 255.0, green: 204 / 255.0, blue: 0 / 255.0, alpha: 1.0)
    static let LoadingOrange = UIColor(red: 255.0 / 255.0, green: 187 / 255.0, blue: 51 / 255.0, alpha: 1.0)
    static let LoadingRed = UIColor(red: 255 / 255.0, green: 68 / 255.0, blue: 68 / 255.0, alpha: 1.0)
  }
  
  private let DefaultColors = [Colors.LoadingBlue, Colors.LoadingGreen, Colors.LoadingOrange, Colors.LoadingRed]
  private let DefaultDuration = 0.5

  private var duration: NSTimeInterval!
  private var colors: [UIColor]!
  private var isAnimating: Bool = true
  private var views: [UIView]!
  private var lines: [UIView]!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    if let customColors = ProcessButtonUtil.sharedInstance.colors {
      colors = customColors
    } else {
      colors  = DefaultColors
    }
    
    if let customDuration = ProcessButtonUtil.sharedInstance.duration {
      duration = customDuration
    } else {
      duration = DefaultDuration
    }
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  private func startAnimating() {
    isAnimating = true
    views = []

    for i in 0..<colors.count {
      let view = UIView(frame: lineRect())
      view.backgroundColor = colors[i]
      views.append(view)
    }

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
      var count: Int = 0
      while self.isAnimating {
        if count == self.views.count {
          count = 0
        }

        var next = false
        dispatch_async(dispatch_get_main_queue(), {
          UIView.animateWithDuration(self.duration, delay: 0, options: nil, animations: { () -> Void in
            if self.isAnimating {
              self.addSubview(self.views[count])
              self.views[count].frame.origin = CGPoint(x: self.bounds.origin.x, y: 0)
              self.views[count].frame.size.width = self.frame.width
            }
          }, completion: { (Bool) -> Void in
              if self.isAnimating {
                var lastIndex = count - 1
                if lastIndex < 0 {
                  lastIndex = self.colors.count - 1
                }
                self.views[lastIndex].frame = self.lineRect()
                self.views[lastIndex].removeFromSuperview()
              }
              next = true
          })
        })

        // Let's wait until the current animation is done before moving forward
        while !next {
        }
        count++
      }
    })

  }

  private func stopAnimating() {
    isAnimating = false

    for view in views {
      view.removeFromSuperview()
    }

    views.removeAll(keepCapacity: false)
  }

  private func lineRect() -> CGRect {
    return CGRect(x: bounds.width/2, y: bounds.origin.y, width: 0, height: frame.height)
  }

  func animate(shouldAnimate: Bool) {
    shouldAnimate ? startAnimating() : stopAnimating()
  }
  
}
