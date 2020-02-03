//
//  Rock.swift
//  jsb
//
//  Created by 李开元 on 2020/2/3.
//  Copyright © 2020 李开元. All rights reserved.
//

import Foundation
import UIKit

class Rock: Figure {
    override var name: String {
        return "Rock"
    }
    
    override var image: UIImage {
        return UIImage(named: "rock")!
    }
}
