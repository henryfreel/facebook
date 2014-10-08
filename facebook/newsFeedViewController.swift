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
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        
        var window = UIApplication.sharedApplication().keyWindow
        
        var frame = window.convertRect(imageViewToSegue.frame, fromView: newsFeedScrollView)
        var copyImageView = UIImageView(frame: frame)

        
        if (isPresenting) {
            toViewController.view.alpha = 0
            
            copyImageView.image = imageViewToSegue.image
            copyImageView.contentMode = UIViewContentMode.ScaleAspectFill
            copyImageView.clipsToBounds = true
            
            window.addSubview(copyImageView)
            
            containerView.addSubview(toViewController.view)

            UIView.animateWithDuration(0.4, animations: { () -> Void in
                
                copyImageView.frame.size.width = 320
                copyImageView.frame.size.height = 320 * (copyImageView.image!.size.height / copyImageView.image!.size.width)
                copyImageView.center.x = 320 / 2
                copyImageView.center.y = 568 / 2
                toViewController.view.alpha = 1

                
                }) { (finished: Bool) -> Void in
                    
                    copyImageView.removeFromSuperview()
                    transitionContext.completeTransition(true)
                    
            }
        } else {
            
            
            let vc = fromViewController as DetailViewController
            
            copyImageView.image = vc.detailImageView.image
            copyImageView.frame = window.convertRect(vc.detailImageView.frame, fromView: vc.photoScrollView)
            copyImageView.contentMode = UIViewContentMode.ScaleAspectFill
            copyImageView.clipsToBounds = true
            
            window.addSubview(copyImageView)
            
            //toViewController.view.alpha = 0
            //fromViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                
                //toViewController.view.alpha = 1
                fromViewController.view.alpha = 0
                
                copyImageView.frame = window.convertRect(self.imageViewToSegue.frame, fromView: self.newsFeedScrollView)
                
                }, completion: { (finished: Bool) -> Void in
                    
                    copyImageView.removeFromSuperview()
                    transitionContext.completeTransition(true)
                    
            })
            
        }
    }

    
    
    
    
}












//            copyImageView.image = imageViewToSegue.image
//            copyImageView.contentMode = UIViewContentMode.ScaleAspectFill
//            copyImageView.clipsToBounds = true
//            copyImageView.frame.size.width = 320
//            copyImageView.frame.size.height = 320 * (copyImageView.image!.size.height / copyImageView.image!.size.width)
//            copyImageView.center.x = 320 / 2
//            copyImageView.center.y = 568 / 2



