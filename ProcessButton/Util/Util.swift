//
//  Util.swift
//  ProcessButton
//
//  Created by Vidar Ottosson on 2/7/15.
//  Copyright (c) 2015 Vidar Ottosson. All rights reserved.
//

import UIKit

class Util {

  /**
    Creates a UIImage from a UIColor to put as a background for UIButton with a state
  
    :param: color The color to convert to UIImage
  
    :returns: UIImage with the color as its image
  */
  class func imageWithColor(color: UIColor) -> UIImage {
    var rect: CGRect = CGRectMake(0.0, 0.0, 1.0, 1.0)
    UIGraphicsBeginImageContext(rect.size)
    var context: CGContextRef = UIGraphicsGetCurrentContext()

    CGContextSetFillColorWithColor(context, color.CGColor)
    CGContextFillRect(context, rect)

    var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return image
  }

  /**
    Randomizes the time it takes for the mocked request to process (2 - 6) seconds
  
    :returns: seconds
  */
  class func randomProcessTime() -> Double {
    return Double(arc4random_uniform(4)) + 2
  }

  /**
    A mocked response. Returns true if the request was successful, or false for error
  
    :returns: A Bool for if the response was successful or not
  */
  class func randomResponse() -> Bool {
    return Int(arc4random_uniform(2)) == 1 ? true : false
  }
}
