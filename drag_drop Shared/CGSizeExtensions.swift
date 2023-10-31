//
//  CGSizeExtensions.swift
//  drag_drop
//
//  Created by Bradley Boyd on 10/30/23.
//
import UIKit
extension CGSize {
    func asepctFill(_ target: CGSize) -> CGSize {
        return CGSize(width: Int(self.width*0.8), height: Int(self.height*0.8))

        //let baseAspect = self.width / self.height
        //let targetAspect = target.width / target.height
        //if baseAspect > targetAspect {
        //    return CGSize(width: (target.height * width) / height, height: target.height)
        //} else {
        //    return CGSize(width: target.width, height: (target.width * height) / width)
        //}
    }
}
