//
//  DetailViewController.swift
//  facebook
//
//  Created by Henry Freel on 10/4/14.
//  Copyright (c) 2014 Henry Freel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var image : UIImage!
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var photoScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoScrollView.contentSize = CGSizeMake(320, 600)

        detailImageView.image = image
        
        detailImageView.center = CGPoint(x: view.center.x, y: view.center.y)
        //detailImageView.
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapDoneButton(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}
