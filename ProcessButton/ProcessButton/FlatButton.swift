//
//  FlatButton.swift
//  ProcessButton
//
//  Created by Vidar Ottosson on 2/7/15.
//  Copyright (c) 2015 Vidar Ottosson. All rights reserved.
//

import UIKit

@objc protocol FlatButtonDelegate {
  func showSuccess()
  func showError()
}

class FlatButton: UIButton {

  enum Colors {
    static let Success = UIColor(red: 153 / 255.0, green: 204 / 255.0, blue: 0 / 255.0, alpha: 1.0)
    static let Error = UIColor(red: 255 / 255.0, green: 68 / 255.0, blue: 68 / 255.0, alpha: 1.0)
  }

  var delegate: FlatButtonDelegate?

  override init(frame: CGRect) {
    super.init(frame: frame)
    prepareView()
  }

  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    prepareView()
  }

  private func prepareView() {
    titleLabel?.font = UIFont.boldSystemFontOfSize(36.0)
    setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
    setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
    setTitleColor(UIColor.whiteColor(), forState: UIControlState.Disabled)
  }
  
  private func showSuccess(text: String, seconds: Double) {
    delegate?.showSuccess()
    enabled = false

    var tempBackground = backgroundColor
    backgroundColor = Colors.Success
    var tempText = titleLabel?.text
    setTitle(text, forState: UIControlState.Normal)

    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
    dispatch_after(delayTime, dispatch_get_main_queue()) {
      self.backgroundColor = tempBackground
      self.setTitle(tempText, forState: UIControlState.Normal)
      self.enabled = true
    }
  }
  
  private func showError(text: String, seconds: Double) {
    delegate?.showError()
    enabled = false

    var tempBackground = backgroundColor
    backgroundColor = Colors.Error
    var tempText = titleLabel?.text
    setTitle(text, forState: UIControlState.Normal)

    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
    dispatch_after(delayTime, dispatch_get_main_queue()) {
      self.backgroundColor = tempBackground
      self.setTitle(tempText, forState: UIControlState.Normal)
      self.enabled = true
    }
  }
  
  func setBackgroundColor(normalState: UIColor, highlightedState: UIColor) {
    backgroundColor = normalState
    setBackgroundImage(ProcessButtonUtil.imageWithColor(highlightedState), forState: UIControlState.Highlighted)
  }

  func showSuccessText(text: String, seconds: Double) {
    showSuccess(text, seconds: seconds)
  }

  func showSuccessText(text: String) {
    showSuccess(text, seconds: ProcessButtonUtil.Length.Short)
  }

  func showErrorText(text: String, seconds: Double) {
    showError(text, seconds: seconds)
  }

  func showErrorText(text: String) {
    showError(text, seconds: ProcessButtonUtil.Length.Long)
  }
}
