//
//  ProcessButton.swift
//  ProcessButton
//
//  Created by Vidar Ottosson on 2/7/15.
//  Copyright (c) 2015 Vidar Ottosson. All rights reserved.
//

import UIKit

class ProcessButton: FlatButton, FlatButtonDelegate {
  
  let LineHeight: CGFloat = 5.0

  var processView: ProcessView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    prepareView()
  }

  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    prepareView()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    processView.frame = CGRect(x: 0, y: frame.height - LineHeight, width: frame.width, height: LineHeight)
  }

  private func prepareView() {
    delegate = self
    processView = ProcessView(frame: CGRect(x: 0, y: frame.height - LineHeight, width: frame.width, height: LineHeight))
    addSubview(processView)
  }

  func animate(shouldAnimate: Bool) {
    if shouldAnimate {
      enabled = false
    } else {
      enabled = true
    }
    processView.animate(shouldAnimate)
  }

  func showSuccess() {
    animate(false)
  }

  func showError() {
    animate(false)
  }
}
