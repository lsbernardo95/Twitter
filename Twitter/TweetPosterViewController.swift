//
//  TweetPosterViewController.swift
//  Twitter
//
//  Created by Laurence Bernardo on 11/3/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetPosterViewController: UIViewController {

    @IBOutlet weak var tweetContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func postTweet(_ sender: Any) {
        if (!tweetContent.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetContent.text, success:{ self.dismiss(animated: true, completion: nil)}, failure: { (error) in
                print("Could not post tweet \(error)")
            })
        }
        else {
            print("Cannot post empty text")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelTweet(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
