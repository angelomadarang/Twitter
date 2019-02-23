//
//  LoginViewController.swift
//  Twitter
//
//  Created by Ervy on 2/22/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //check if app has been opened
    //bool check
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    
    
    @IBAction func onLogInButton(_ sender: Any) {
        //when button is pressed go to this site
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        //checker if success or failur
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            
            //remember login -> made a varuable "suerloggedin" set to true
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
            
            
            
            
        }, failure: { (Error) in
            print("Could not log in!")
        })
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
