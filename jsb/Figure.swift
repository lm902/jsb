//
//  File.swift
//  jsb
//
//  Created by 李开元 on 2020/2/3.
//  Copyright © 2020 李开元. All rights reserved.
//

import Foundation
import UIKit

protocol PFigure: Comparable {
    var name: String { get }
    var image: UIImage { get }
}

class Figure: PFigure {
    var name: String {
        return "Figure"
    }
    
    var image: UIImage {
        return UIImage()
    }
    
    static func < (lhs: Figure, rhs: Figure) -> Bool {
        return lhs.name == "Rock" && rhs.name == "Paper"
            || lhs.name == "Paper" && rhs.name == "Scissors"
            || lhs.name == "Scissors" && rhs.name == "Rock"
    }
    
    static func == (lhs: Figure, rhs: Figure) -> Bool {
        return lhs.name == rhs.name
    }
    
    
}
