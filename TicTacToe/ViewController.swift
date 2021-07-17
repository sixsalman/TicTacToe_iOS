//
//  ViewController.swift
//  TicTacToe
//
//  Created by Salman on 16/07/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var playBtns: [UIButton]!
    @IBOutlet var resultLabel: UILabel!
    
    var playerSign: String?
    var botSign: String?
    var empSpots: Set<Int> = []
    var gameEnded: Bool?
    
    @IBAction func btnStAsX() {
        playerSign = "X"
        botSign = "O"
        
        startCommon()
    }
    
    @IBAction func btnStAsO() {
        playerSign = "O"
        botSign = "X"
        
        startCommon()
    }
    
    func startCommon() {
        resultLabel.text = nil
        
        empSpots.removeAll()
        
        for i in 0..<playBtns.count {
            playBtns[i].isEnabled = true
            playBtns[i].setTitle(nil, for: .normal)
            playBtns[i].setTitleColor(UIColor.systemBackground, for: .normal)
            playBtns[i].backgroundColor = UIColor.systemOrange
            
            empSpots.insert(i)
        }
        
        gameEnded = false
    }
    
    @IBAction func playBtnTouch(_ sender: UIButton) {
        if sender.title(for: .normal) == nil && gameEnded! == false {
            sender.setTitle("\(playerSign!)", for: .normal)
            
            empSpots.remove(sender.tag)

            if (checkWin(playerSign!)) {
                resultLabel.text = "YOU WON!"
                gameEnded = true
                return
            }
            
            botTurn()
            
            if (checkWin(botSign!)) {
                resultLabel.text = "BOT WON"
                gameEnded = true
                return
            }
            
            if(empSpots.count == 1) {
                resultLabel.text = "IT'S A DRAW"
                gameEnded = true
            }
        }
    }
    
    func botTurn() {
        if (playBtns[0].title(for: .normal) == playerSign && playBtns[2].title(for: .normal) == playerSign || playBtns[0].title(for: .normal) == botSign && playBtns[2].title(for: .normal) == botSign) && empSpots.contains(1) {
            playBtns[1].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(1)
        } else if (playBtns[3].title(for: .normal) == playerSign && playBtns[5].title(for: .normal) == playerSign || playBtns[3].title(for: .normal) == botSign && playBtns[5].title(for: .normal) == botSign) && empSpots.contains(4) {
            playBtns[4].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(4)
        } else if (playBtns[6].title(for: .normal) == playerSign && playBtns[8].title(for: .normal) == playerSign || playBtns[6].title(for: .normal) == botSign && playBtns[8].title(for: .normal) == botSign) && empSpots.contains(7) {
            playBtns[7].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(7)
        } else if (playBtns[0].title(for: .normal) == playerSign && playBtns[6].title(for: .normal) == playerSign || playBtns[0].title(for: .normal) == botSign && playBtns[6].title(for: .normal) == botSign) && empSpots.contains(3) {
            playBtns[3].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(3)
        } else if (playBtns[1].title(for: .normal) == playerSign && playBtns[7].title(for: .normal) == playerSign || playBtns[1].title(for: .normal) == botSign && playBtns[7].title(for: .normal) == botSign) && empSpots.contains(4) {
            playBtns[4].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(4)
        } else if (playBtns[2].title(for: .normal) == playerSign && playBtns[8].title(for: .normal) == playerSign || playBtns[2].title(for: .normal) == botSign && playBtns[8].title(for: .normal) == botSign) && empSpots.contains(5) {
            playBtns[5].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(5)
        } else if (playBtns[0].title(for: .normal) == playerSign && playBtns[8].title(for: .normal) == playerSign || playBtns[0].title(for: .normal) == botSign && playBtns[8].title(for: .normal) == botSign) && empSpots.contains(4) {
            playBtns[4].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(4)
        } else if (playBtns[2].title(for: .normal) == playerSign && playBtns[6].title(for: .normal) == playerSign || playBtns[2].title(for: .normal) == botSign && playBtns[6].title(for: .normal) == botSign) && empSpots.contains(4) {
            playBtns[4].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(4)
        } else if (playBtns[0].title(for: .normal) == playerSign && playBtns[1].title(for: .normal) == playerSign || playBtns[0].title(for: .normal) == botSign && playBtns[1].title(for: .normal) == botSign) && empSpots.contains(2) {
            playBtns[2].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(2)
        } else if (playBtns[3].title(for: .normal) == playerSign && playBtns[4].title(for: .normal) == playerSign || playBtns[3].title(for: .normal) == botSign && playBtns[4].title(for: .normal) == botSign) && empSpots.contains(5) {
            playBtns[5].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(5)
        } else if (playBtns[6].title(for: .normal) == playerSign && playBtns[7].title(for: .normal) == playerSign || playBtns[6].title(for: .normal) == botSign && playBtns[7].title(for: .normal) == botSign) && empSpots.contains(8) {
            playBtns[8].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(8)
        } else if (playBtns[0].title(for: .normal) == playerSign && playBtns[3].title(for: .normal) == playerSign || playBtns[0].title(for: .normal) == botSign && playBtns[3].title(for: .normal) == botSign) && empSpots.contains(6) {
            playBtns[6].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(6)
        } else if (playBtns[1].title(for: .normal) == playerSign && playBtns[4].title(for: .normal) == playerSign || playBtns[1].title(for: .normal) == botSign && playBtns[4].title(for: .normal) == botSign) && empSpots.contains(7) {
            playBtns[7].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(7)
        } else if (playBtns[2].title(for: .normal) == playerSign && playBtns[5].title(for: .normal) == playerSign || playBtns[2].title(for: .normal) == botSign && playBtns[5].title(for: .normal) == botSign) && empSpots.contains(8) {
            playBtns[8].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(8)
        } else if (playBtns[1].title(for: .normal) == playerSign && playBtns[2].title(for: .normal) == playerSign || playBtns[1].title(for: .normal) == botSign && playBtns[2].title(for: .normal) == botSign) && empSpots.contains(0) {
            playBtns[0].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(0)
        } else if (playBtns[4].title(for: .normal) == playerSign && playBtns[5].title(for: .normal) == playerSign || playBtns[4].title(for: .normal) == botSign && playBtns[5].title(for: .normal) == botSign) && empSpots.contains(3) {
            playBtns[3].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(3)
        } else if (playBtns[7].title(for: .normal) == playerSign && playBtns[8].title(for: .normal) == playerSign || playBtns[7].title(for: .normal) == botSign && playBtns[8].title(for: .normal) == botSign) && empSpots.contains(6) {
            playBtns[6].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(6)
        } else if (playBtns[3].title(for: .normal) == playerSign && playBtns[6].title(for: .normal) == playerSign || playBtns[3].title(for: .normal) == botSign && playBtns[6].title(for: .normal) == botSign) && empSpots.contains(0) {
            playBtns[0].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(0)
        } else if (playBtns[4].title(for: .normal) == playerSign && playBtns[7].title(for: .normal) == playerSign || playBtns[4].title(for: .normal) == botSign && playBtns[7].title(for: .normal) == botSign) && empSpots.contains(1) {
            playBtns[1].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(1)
        } else if (playBtns[5].title(for: .normal) == playerSign && playBtns[8].title(for: .normal) == playerSign || playBtns[5].title(for: .normal) == botSign && playBtns[8].title(for: .normal) == botSign) && empSpots.contains(2) {
            playBtns[2].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(2)
        } else if (playBtns[0].title(for: .normal) == playerSign && playBtns[4].title(for: .normal) == playerSign || playBtns[0].title(for: .normal) == botSign && playBtns[4].title(for: .normal) == botSign) && empSpots.contains(8) {
            playBtns[8].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(8)
        } else if (playBtns[4].title(for: .normal) == playerSign && playBtns[8].title(for: .normal) == playerSign || playBtns[4].title(for: .normal) == botSign && playBtns[8].title(for: .normal) == botSign) && empSpots.contains(0) {
            playBtns[0].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(0)
        } else if (playBtns[6].title(for: .normal) == playerSign && playBtns[4].title(for: .normal) == playerSign || playBtns[6].title(for: .normal) == botSign && playBtns[4].title(for: .normal) == botSign) && empSpots.contains(2) {
            playBtns[2].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(2)
        } else if (playBtns[2].title(for: .normal) == playerSign && playBtns[4].title(for: .normal) == playerSign || playBtns[2].title(for: .normal) == botSign && playBtns[4].title(for: .normal) == botSign) && empSpots.contains(6) {
            playBtns[6].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(6)
        } else {
            let markAt = empSpots.randomElement()
            playBtns[markAt!].setTitle("\(botSign!)", for: .normal)
            empSpots.remove(markAt!)
        }
    }
    
    func checkWin(_ sign: String) -> Bool {
        if playBtns[0].title(for: .normal) == sign && playBtns[1].title(for: .normal) == sign && playBtns[2].title(for: .normal) == sign {
            highlightBoxes(0, 1, 2);
            return true;
        } else if playBtns[3].title(for: .normal) == sign && playBtns[4].title(for: .normal) == sign && playBtns[5].title(for: .normal) == sign {
            highlightBoxes(3, 4, 5);
            return true;
        } else if playBtns[6].title(for: .normal) == sign && playBtns[7].title(for: .normal) == sign && playBtns[8].title(for: .normal) == sign {
            highlightBoxes(6, 7, 8);
            return true;
        } else if playBtns[0].title(for: .normal) == sign && playBtns[3].title(for: .normal) == sign && playBtns[6].title(for: .normal) == sign {
            highlightBoxes(0, 3, 6);
            return true;
        } else if playBtns[1].title(for: .normal) == sign && playBtns[4].title(for: .normal) == sign && playBtns[7].title(for: .normal) == sign {
            highlightBoxes(1, 4, 7);
            return true;
        } else if playBtns[2].title(for: .normal) == sign && playBtns[5].title(for: .normal) == sign && playBtns[8].title(for: .normal) == sign {
            highlightBoxes(2, 5, 8);
            return true;
        } else if playBtns[0].title(for: .normal) == sign && playBtns[4].title(for: .normal) == sign && playBtns[8].title(for: .normal) == sign {
            highlightBoxes(0, 4, 8);
            return true;
        } else if playBtns[2].title(for: .normal) == sign && playBtns[4].title(for: .normal) == sign && playBtns[6].title(for: .normal) == sign {
            highlightBoxes(2, 4, 6);
            return true;
        }

        return false;
    }
    
    func highlightBoxes (_ i: Int, _ j: Int, _ k: Int) {
        playBtns[i].backgroundColor = UIColor.systemBackground
        playBtns[i].setTitleColor(UIColor.systemOrange, for: .normal)

        playBtns[j].backgroundColor = UIColor.systemBackground
        playBtns[j].setTitleColor(UIColor.systemOrange, for: .normal)

        playBtns[k].backgroundColor = UIColor.systemBackground
        playBtns[k].setTitleColor(UIColor.systemOrange, for: .normal)

    }
    
}
