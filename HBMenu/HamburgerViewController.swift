//
//  HamburgerViewController.swift
//  HBMenu
//
//  Created by Deepti Chinta on 10/4/15.
//  Copyright © 2015 DeeptiChinta. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var feedView: UIView!

    var menuViewController: MenuViewController!
    var feedViewController: FeedViewController!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var navController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("FeedViewController") as! FeedViewController
        
        feedView = navController.view
        view.addSubview(feedView)
        view.bringSubviewToFront(feedView)
        
        addChildViewController(navController)
        navController.didMoveToParentViewController(self)
        
        
        
        //let panGesture = UIPanGestureRecognizer(target: self, action: "onSwipe:")
        //view.addGestureRecognizer(panGesture)
        
        var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
        
        // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
       view.addGestureRecognizer(panGestureRecognizer)


    }


    
    func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
        var translation = panGestureRecognizer.translationInView(self.view)
        var point = panGestureRecognizer.locationInView(self.view)
        var velocity = panGestureRecognizer.velocityInView(self.view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
           // print("Gesture began at: \(point)")

        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
           // print("Gesture changed at: \(point)")
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
           // print("Gesture ended at: \(point)")
            
            if (velocity.x > 0){
                print ("Right")
                let navController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MenuViewController") as! MenuViewController
                menuView = navController.view
                menuView.frame = CGRectMake(0, 0, 270, 568)

                view.addSubview(menuView)
              //  view.bringSubviewToFront(feedView)
              //  addChildViewController(navController)
              //  navController.didMoveToParentViewController(self)
            } else {
                print ("Left")
                let navController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("FeedViewController") as! FeedViewController
                feedView = navController.view
                view.addSubview(feedView)
                view.bringSubviewToFront(feedView)
                addChildViewController(navController)
                navController.didMoveToParentViewController(self)
            }
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addView(viewController: UIViewController) {
        addChildViewController(viewController)
        
        // In this case, we're adding the child view controller to the main view. However, you might also be adding the child view controller to another view that you've defined in the container view.
        view.addSubview(viewController.view)
        viewController.didMoveToParentViewController(self)
    }
    

    func deleteView(viewController: UIViewController) {
        viewController.willMoveToParentViewController(nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParentViewController()
    }

}
