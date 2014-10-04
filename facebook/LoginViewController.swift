//
//  LoginViewController.swift
//  facebook
//
//  Created by Henry Freel on 9/17/14.
//  Copyright (c) 2014 Henry Freel. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loadingActivityView: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }

    @IBAction func onLoginButton(sender: UIButton) {
        
        loadingActivityView.startAnimating()
        loginButton.selected = true
        
        delay(2, closure: { () -> () in
            self.loadingActivityView.stopAnimating()
            self.loginButton.selected = false
        })
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
