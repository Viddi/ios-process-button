//
//  ViewController.swift
//  ProcessButton
//
//  Created by Vidar Ottosson on 2/7/15.
//  Copyright (c) 2015 Vidar Ottosson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  enum Colors {
    static let PurpleDefault = UIColor(red: 171 / 255.0, green: 91 / 255.0, blue: 190 / 255.0, alpha: 1.0)
    static let PurplePressed = UIColor(red: 153 / 255.0, green: 81 / 255.0, blue: 170 / 255.0, alpha: 1.0)
  }

  @IBOutlet weak var btnSignIn: ProcessButton!

  override func viewDidLoad() {
    super.viewDidLoad()

    btnSignIn.backgroundColor = Colors.PurpleDefault
    btnSignIn.setBackgroundImage(Util.imageWithColor(Colors.PurplePressed), forState: UIControlState.Highlighted)
  }

  @IBAction func signIn(sender: AnyObject) {
    btnSignIn.animate(true)

    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(Util.randomProcessTime() * Double(NSEC_PER_SEC)))
    dispatch_after(delayTime, dispatch_get_main_queue()) {
      if Util.randomResponse() {
        self.btnSignIn.showSuccess("Success", seconds: ProcessButton.Length.Short)
      } else {
        self.btnSignIn.showError("Error", seconds: ProcessButton.Length.Long)
      }
    }
  }

}