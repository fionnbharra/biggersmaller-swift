//
//  ViewController.swift
//  biggersmaller
//
//  Created by Finbar Sheahan on 03/04/2015.
//  Copyright (c) 2015 Finbar Sheahan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let transitionManager = TransitionManager()
    let user = User.sharedInstance
    let animals = Animals.sharedInstance
    
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        println("created view")
        super.viewDidLoad()
        setTitle(animals.getTwoAnimals()[0].name)
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
        let toViewController = segue.destinationViewController as UIViewController
        
        // instead of using the default transition animation, we'll ask
        // the segue to use our custom TransitionManager object to manage the transition animation
        toViewController.transitioningDelegate = self.transitionManager
        
//        println(segue.sourceViewController)
        println("==========")
        setTitle(animals.getTwoAnimals()[0].name)
//        println(segue.destinationViewController)
        
    }
    
    func setTitle(title: String) {
        if(button1 != nil) {
            button1.setTitle(title, forState:
                UIControlState.Normal)
        }
    }

    @IBAction func doButtonTap(sender: AnyObject) {
        user.score++
//        println(user.score)
        println(animals.getTwoAnimals()[0].name)
    }
}

