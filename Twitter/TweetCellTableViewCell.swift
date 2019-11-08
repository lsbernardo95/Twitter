//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Laurence Bernardo on 11/1/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var favoritedIcon: UIButton!
    @IBOutlet weak var retweetedIcon: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var favorited:Bool = false
    var retweeted:Bool = false
    var tweetId:Int = -1
    
    @IBAction func retweet(_ sender: Any) {
        let toBeRetweeted = !retweeted
        if (toBeRetweeted) {
            TwitterAPICaller.client?.Retweet(tweetId:tweetId, success: {
                self.setRetweet(true)
            }, failure: { (error) in
                print("Retweet did not succeed: \(error)")
            })
        }
        else {
            TwitterAPICaller.client?.unRetweet(tweetId:tweetId, success: {
                self.setRetweet(false)
            }, failure: { (error) in
                print("Retweet did not succeed: \(error)")
            })
        }
    }
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId:tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        }
        else {
            TwitterAPICaller.client?.unFavoriteTweet(tweetId:tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        }
    }
    
    func setRetweet(_ isRetweeted:Bool) {
        retweeted = isRetweeted
        if (retweeted) {
            retweetedIcon.setImage(UIImage(named:"retweet-icon-green"), for:UIControl.State.normal)
        }
        else {
            retweetedIcon.setImage(UIImage(named:"retweet-icon"), for:UIControl.State.normal)
        }
    }
    
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited) {
            favoritedIcon.setImage(UIImage(named:"favor-icon-red"), for:UIControl.State.normal)
        }
        else {
            favoritedIcon.setImage(UIImage(named:"favor-icon"), for:UIControl.State.normal)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
