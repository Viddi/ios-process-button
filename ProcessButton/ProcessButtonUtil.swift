//
//  ProcessButtonUtil.swift
//  ProcessButton
//
//  Created by Vidar Ottosson on 2/14/15.
//  Copyright (c) 2015 Vidar Ottosson. All rights reserved.
//

import UIKit

class ProcessButtonUtil {
  
  enum Length {
    static let Short: Double = 1.5
    static let Long: Double = 3.0
  }
  
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
  
}
