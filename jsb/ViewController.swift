//
//  ViewController.swift
//  jsb
//
//  Created by 李开元 on 2020/2/3.
//  Copyright © 2020 李开元. All rights reserved.
//

import UIKit

enum Turn {
    case P1_TURN
    case P2_TURN
    case END_TURN
}

class ViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var p1Image: UIImageView!
    @IBOutlet weak var p2Image: UIImageView!
    @IBOutlet weak var actionButton: UIButton!
    
    private var _turn: Turn = Turn.P1_TURN
    var turn: Turn {
        get {
            return _turn
        }
        set {
            switch newValue {
            case Turn.P1_TURN:
                statusLabel.text = "玩家1回合"
                actionButton.setTitle("玩家1拼脸", for: .normal)
                break
            case Turn.P2_TURN:
                statusLabel.text = "玩家2回合"
                actionButton.setTitle("玩家2拼脸", for: .normal)
                break
            case Turn.END_TURN:
                if figure1 > figure2 {
                    statusLabel.text = "玩家1获胜"
                } else if figure1 < figure2 {
                    statusLabel.text = "玩家2获胜"
                } else if figure1 == figure2 {
                    statusLabel.text = "平手"
                }
                actionButton.setTitle("下一回合", for: .normal)
                break
            }
            _turn = newValue
        }
    }
    
    private var _figure1: Figure = Figure()
    var figure1: Figure {
        get {
            return _figure1
        }
        set {
            p1Image.image = newValue.image
            _figure1 = newValue
        }
    }
    
    private var _figure2: Figure = Figure()
    var figure2: Figure {
        get {
            return _figure2
        }
        set {
            p2Image.image = newValue.image
            _figure2 = newValue
        }
    }
    
    let figures: [Figure] = [Rock(), Paper(), Scissors()]
    
    @IBAction func actionButtonPrimaryAction(_ sender: Any) {
        switch turn {
        case Turn.P1_TURN:
            figure1 = figures.randomElement()!
            turn = Turn.P2_TURN
            break
        case Turn.P2_TURN:
            figure2 = figures.randomElement()!
            turn = Turn.END_TURN
            break
        case Turn.END_TURN:
            figure1 = Figure()
            figure2 = Figure()
            turn = Turn.P1_TURN
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        turn = Turn.P1_TURN
    }


}

