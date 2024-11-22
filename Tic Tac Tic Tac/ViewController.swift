//
//  ViewController.swift
//  Tic Tac Tic Tac
//
//  Created by Диас Акберген on 04.11.2024.
//

import UIKit

class ViewController: UIViewController {

    var player = 1
    
    var arrayBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winArray = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func game(_ sender: UIButton) {
        print(sender.tag)
        
        if arrayBoard[sender.tag - 1] != 0 {
            return
        }
        
        arrayBoard[sender.tag - 1] = player
        
        if player == 1 {
            
            sender.setBackgroundImage(UIImage(named: "Avocado"), for: .normal)
            player = 2
        } else {
            sender.setBackgroundImage(UIImage(named: "Bars"), for: .normal)
            player = 1
        }
        
        var winnerFound = false
        for win in winArray {
            if arrayBoard[win[0]] == arrayBoard[win[1]] && arrayBoard[win[1]] == arrayBoard[win[2]] && arrayBoard[win[2]] == 1 {
                print("Эрик гей ок win")
                winnerFound = true
                let alert = UIAlertController(title: "X Эрик гей win", message: "X Эрик гей win", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { UIAlertAction in self.clearBoard()
                }))
                present(alert, animated: true)
            } else if arrayBoard[win[0]] == arrayBoard[win[1]] && arrayBoard[win[1]] == arrayBoard[win[2]] && arrayBoard[win[2]] == 2 {
                print ("O Адиль гей win")
                winnerFound = true
                let alert = UIAlertController(title: "O Адиль гей win", message: "O Адиль гей win", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { UIAlertAction in self.clearBoard()
                }))
                present(alert, animated: true)
            }
        }
        if !winnerFound && !arrayBoard.contains(0){
            print ("Победила Дружба!")
            
            let alert = UIAlertController(title: "Победила Дружба!", message: "Победила Дружба!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { UIAlertAction in self.clearBoard()
            }))
            present(alert, animated: true)
        }
    }
    
    func clearBoard(){
        for i in 0...8{
            let Button = view.viewWithTag(i+1) as! UIButton
            Button.setBackgroundImage(nil, for: .normal)
            
            arrayBoard[i]=0
        }
    }
}

