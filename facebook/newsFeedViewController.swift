//
//  newsFeedViewController.swift
//  facebook
//
//  Created by Henry Freel on 9/15/14.
//  Copyright (c) 2014 Henry Freel. All rights reserved.
//

import UIKit

class newsFeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true
    
    var imageViewToSegue : UIImageView!

    @IBOutlet weak var newsFeedScrollView: UIScrollView!
    @IBOutlet weak var homeFeedImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsFeedScrollView.contentSize = homeFeedImage.image!.size
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapPhoto(sender: UITapGestureRecognizer) {
        
        imageViewToSegue = sender.view as UIImageView
        performSegueWithIdentifier("detailSegue", sender: self)
        
    }
    
    
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        var destinationViewController = segue.destinationViewController as DetailViewController
        destinationViewController.image = self.imageViewToSegue.image

        
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 1.0
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            toViewController.view.alpha = 0
            
            
            var window = UIApplication.sharedApplication().keyWindow

            var frame = window.convertRect(imageViewToSegue.frame, fromView: newsFeedScrollView)
            var copyImageView = UIImageView(frame: frame)
            copyImageView.image = imageViewToSegue.image
            copyImageView.contentMode = UIViewContentMode.ScaleAspectFill
            copyImageView.clipsToBounds = true
            
            window.addSubview(copyImageView)
            
            containerView.addSubview(toViewController.view)

            UIView.animateWithDuration(1, animations: { () -> Void in
                
                copyImageView.center = CGPoint(x: 160, y: 284)
                copyImageView.frame.size.width = 320
                
                }) { (finished: Bool) -> Void in
                    
                    toViewController.view.alpha = 1
                    copyImageView.hidden = true
                    transitionContext.completeTransition(true)
                    
            }
        } else {
            
            UIView.animateWithDuration(1, animations: { () -> Void in
                
                fromViewController.view.alpha = 0
                
                }) { (finished: Bool) -> Void in
                    
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
                    
            }
        }
    }

    
    
    
    
}




