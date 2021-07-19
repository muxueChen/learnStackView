//
//  VCModel.swift
//  UIStackViewActualCombat
//
//  Created by 陈学明 on 2021/7/18.
//

import Foundation
import UIKit

struct VCModel {
    var className: UIViewController.Type
    var title: String
    func getVc() -> UIViewController {
        return className.init()
    }
}
