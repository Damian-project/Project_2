//
//  ViewController.swift
//  Project2
//
//  Created by PC on 06/05/2020.
//  Copyright © 2020 db. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
    
        askQuestion(action: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(showScore))
      
    }
     
    @objc func showScore() {
        let scoreAlert = UIAlertController(title: "SCORE", message: nil, preferredStyle: .actionSheet)
        scoreAlert.addAction(UIAlertAction(title: "Your current score is: \(score)", style: .default, handler: nil))
        
        present(scoreAlert, animated:  true)
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        
        title = countries[correctAnswer].uppercased()
    }
    
    func startNewGame(action: UIAlertAction) {
        score = 0
        questionAsked = 0
        
        askQuestion(action: nil)
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        //Animation
        if button1.isTouchInside {
        UIView.animate(withDuration: 0.6,
            animations: {
                self.button1.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)} ,
            completion: {_ in
                UIView.animate(withDuration: 0.6) {
                    self.button1.transform = CGAffineTransform.identity }
        }) } else if button2.isTouchInside {
            UIView.animate(withDuration: 0.6,
            animations: {
                self.button2.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)} ,
            completion: {_ in
                UIView.animate(withDuration: 0.6) {
                    self.button2.transform = CGAffineTransform.identity }
            }) } else if button3.isTouchInside {
            UIView.animate(withDuration: 0.6,
            animations: {
                self.button3.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)} ,
            completion: {_ in
                UIView.animate(withDuration: 0.6) {
                    self.button3.transform = CGAffineTransform.identity }
            }) }
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        questionAsked += 1
        
        if questionAsked < 10 {
        let ac = UIAlertController(title: title, message: "Your score is: \(score).", preferredStyle: .alert)
         ac.addAction(UIAlertAction(title: "Contiune", style: .default, handler: askQuestion))
         present(ac, animated: true)
        } else {
            let fa = UIAlertController(title: "Game over!", message: "Your score is: \(score).", preferredStyle: .alert)
            fa.addAction(UIAlertAction(title: "Start New Game", style: .default, handler: startNewGame))
                    present(fa, animated: true)
        }
    }
 
    
}

