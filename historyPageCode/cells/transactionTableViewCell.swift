//
//  transactionTableViewCell.swift
//  historyPageCode
//
//  Created by user on 6/14/22.
//

import UIKit

class transactionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!{
        didSet{
            cellView.layer.borderWidth = 0.5
            cellView.layer.borderColor = UIColor.gray.cgColor
            cellView.layer.cornerRadius = 30
        }
    }
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var name1: UILabel!{
        didSet{
            name1.sizeToFit()
        }
    }
    
    @IBOutlet weak var name2: UILabel!{
        didSet{
            name2.sizeToFit()
        }
    }
    
    @IBOutlet weak var contact: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    @IBOutlet weak var favourite: UIImageView!
    
    @IBOutlet weak var thumbNail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
