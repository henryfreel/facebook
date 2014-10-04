//
//  moreViewController.swift
//  facebook
//
//  Created by Henry Freel on 9/15/14.
//  Copyright (c) 2014 Henry Freel. All rights reserved.
//

import UIKit

class moreViewController: UIViewController {

    @IBOutlet weak var moreScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moreScrollView.contentSize = CGSizeMake(320, 1800
        )
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
