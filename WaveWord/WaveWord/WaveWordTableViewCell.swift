//
//  WaveWordTableViewCell.swift
//  WaveWord
//
//  Created by Nash Clinton on 11/5/24.
//

import UIKit

class WaveWordTableViewCell: UITableViewCell {

    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var dateOfPost: UILabel!
    @IBOutlet weak var titleOfPost: UILabel!
    @IBOutlet weak var bodyOfPost: UILabel!
    @IBOutlet weak var commentsOnPost: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func update(with post: Post) {

        userProfileImage.image = User.image
        userName.text = User.name

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateOfPost.text = dateFormatter.string(from: post.date)
        
        titleOfPost.text = post.postTitle
        bodyOfPost.text = post.postDescription
        var commentsFormatted: String = "Comments: \n"
        for (index, comment) in post.comments.enumerated() {
            commentsFormatted = commentsFormatted + ("\(index+1).  \(comment)" + "\n")
            print(commentsFormatted)
        }
        commentsOnPost.text = commentsFormatted
    }

}
