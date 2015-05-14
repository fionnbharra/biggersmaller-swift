//
//  ViewController.swift
//  biggersmaller
//
//  Created by Finbar Sheahan on 03/04/2015.
//  Copyright (c) 2015 Finbar Sheahan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: RoundRectButton!
    @IBOutlet weak var button2: RoundRectButton!
    @IBOutlet weak var button3: RoundRectButton!
    @IBOutlet weak var button4: RoundRectButton!
    
    let transitionManager = TransitionManager()
    let user = User.sharedInstance
    let animals = Animals.sharedInstance
    

    
    override func viewDidLoad() {
        println("created view")
        super.viewDidLoad()
        setTitles(animals.getRandomAnimals(4))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // this gets a reference to the screen that we're about to transition to
        let toViewController = segue.destinationViewController as! UIViewController
        
        // instead of using the default transition animation, we'll ask
        // the segue to use our custom TransitionManager object to manage the transition animation
        toViewController.transitioningDelegate = self.transitionManager
        println("==========")
        setTitles(animals.getRandomAnimals(4))
        
    }
    
    func setTitles(animals: [Animal]) {
        let buttons = [button1, button2, button3, button4]
        var i = 0
        
        for button in buttons {
            if(button != nil) {
                button.setButtonTitle(animals[i].name)
            }
            i++
        }
    }
    
    
    @IBAction func doButtonTap(sender: RoundRectButton) {
        println(sender.someString)
        user.score++
    }
}

