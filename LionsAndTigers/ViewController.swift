//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Craig Martin on 1/7/15.
//  Copyright (c) 2015 MadKitty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    
    var myTigers:[Tiger] = []
    var Lions:[Lion] = []
    var currentIndex = 0
    var LionCubs: [LionCub] = []
    
    var currentAnimal = (species: "Tiger", index: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.age = 3
        myTiger.breed = "Bengal Tiger"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTigers.append(myTiger)
        
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        imageBackground.image = myTiger.image
        
        var secondTiger = Tiger()
        secondTiger.name = "Charlie"
        secondTiger.age = 5
        secondTiger.breed = "IndoChinese Tiger"
        secondTiger.image = UIImage(named: "IndoChineseTiger.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Freddy"
        thirdTiger.age = 12
        thirdTiger.breed = "Malaysan Tiger"
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Jeff"
        fourthTiger.age = 2
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.subspecies = "West African"
        lion.name = "Mufasa"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named:"Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barnaby"
        
        var lioncub = LionCub()
        lioncub.age = 1
        lioncub.isAlphaMale = false
        lioncub.image = UIImage(named:"LionCub1.jpg")
        lioncub.name = "Simba Jr."
        lioncub.subspecies = "Lion"
        
        var femalecub = LionCub()
        femalecub.age = 1
        femalecub.isAlphaMale = false
        femalecub.image = UIImage(named:"LionCub2.jpg")
        femalecub.name = "Sophie"
        femalecub.subspecies = "Lion"
        
        lion.roar()
        lioness.roar()
        lioncub.roar()
        lioncub.rubLionCubsBelly()
        
        Lions += [lion, lioness]
        LionCubs += [lioncub, femalecub]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextTigerButtonPressed(sender: UIBarButtonItem) { 
    
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.updateAnimal()
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.imageBackground.image = tiger.image
                self.nameLabel.text = tiger.name
                self.ageLabel.text = "\(tiger.age)"
                self.breedLabel.text = tiger.breed
            }
            else if self.currentAnimal.species == "Lion" {
                let lion = self.Lions[self.currentAnimal.index]
                self.imageBackground.image = lion.image
                self.nameLabel.text = lion.name
                self.ageLabel.text = "\(lion.age)"
                self.breedLabel.text = lion.subspecies
            }
            else if self.currentAnimal.species == "LionCub" {
                let lioncub = self.LionCubs[self.currentAnimal.index]
                self.imageBackground.image = lioncub.image
                self.nameLabel.text = lioncub.name
                self.ageLabel.text = "\(lioncub.age)"
                self.breedLabel.text = lioncub.subspecies
            }
            }, completion: {
                (finished:Bool) -> () in
        })
        
    }
    func updateAnimal () {
        switch currentAnimal {
        case("Tiger",_):
            let randomIndex = Int(arc4random_uniform(UInt32(Lions.count)))
            currentAnimal = ("Lion", randomIndex)
        case("LionCub",_):
            let randomIndex = Int(arc4random_uniform(UInt32(LionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
        
    }
}

