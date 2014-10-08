//
//  DetailViewController.swift
//  facebook
//
//  Created by Henry Freel on 10/4/14.
//  Copyright (c) 2014 Henry Freel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    var image : UIImage!
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var photoScrollView: UIScrollView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var photoActionBarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImageView.image = image
        detailImageView.frame.size.width = 320
        detailImageView.frame.size.height = 320 * (detailImageView.image!.size.height / detailImageView.image!.size.width)
    
        detailImageView.hidden = true
        
        photoScrollView.contentSize = CGSizeMake(320, 600)
        photoScrollView.delegate = self
        
        
        detailImageView.center = CGPoint(x: view.center.x, y: view.center.y)
        //detailImageView.
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        detailImageView.hidden = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapDoneButton(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = Float(photoScrollView.contentOffset.y)
        //println("offset is \(offset)")

        var backgroundAlphaUp = convertValue(offset, r1Min: 0, r1Max: 50, r2Min: 1, r2Max: 0)
        var backgroundAlphaDown = convertValue(offset, r1Min: 0, r1Max: -50, r2Min: 1, r2Max: 0)
        
        
        if offset > 0 {
            
            //println("alpha up is \(backgroundAlphaUp)")
            backgroundView.alpha = CGFloat(backgroundAlphaUp)
            photoActionBarImageView.alpha = CGFloat(backgroundAlphaUp)
            doneButton.alpha = CGFloat(backgroundAlphaUp)

            
        } else if offset < 0 {
            
            //println("alpha down is \(backgroundAlphaDown)")
            backgroundView.alpha = CGFloat(backgroundAlphaDown)
            photoActionBarImageView.alpha = CGFloat(backgroundAlphaDown)
            doneButton.alpha = CGFloat(backgroundAlphaDown)
            
        }
        
    }
    
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        var offset = Float(photoScrollView.contentOffset.y)
        println("offset is \(offset)")
        
        var backgroundAlphaUp = convertValue(offset, r1Min: 0, r1Max: 140, r2Min: 1, r2Max: 0)
        var backgroundAlphaDown = convertValue(offset, r1Min: 0, r1Max: -140, r2Min: 1, r2Max: 0)
        
        if offset > 50 && offset > 0{
            
            println("greater than 50")
            detailImageView.hidden = true
            dismissViewControllerAnimated(true, completion: nil)
            backgroundView.alpha = CGFloat(backgroundAlphaDown)
            
        } else if offset < -50 && offset < 0 {
            
            println("less than 50")
            detailImageView.hidden = true
            dismissViewControllerAnimated(true, completion: nil)
            backgroundView.alpha = CGFloat(backgroundAlphaDown)
            
        }
        
       
    }
    
    
    @IBAction func didPinchPhoto(sender: UIPinchGestureRecognizer) {

        var width = detailImageView.frame.size.width

        
        if sender.state == UIGestureRecognizerState.Began {
            
//            width = detailImageView.frame.size.width
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
//            width = detailImageView.frame.size.width
                
            detailImageView.transform = CGAffineTransformScale(detailImageView.transform, sender.scale, sender.scale)
            sender.scale = 1
            
            println("Message \(width)")
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            
            if width < 320 {
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.detailImageView.transform = CGAffineTransformIdentity
                    
                })
                
            } else if width > 960 {
            
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.detailImageView.transform = CGAffineTransformMakeScale(3, 3)
            
                })
            
            }
            
            
        }
        
    }
    
    
    
    
    
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }

    

}
