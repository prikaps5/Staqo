//
//  UserTVCell.swift
//  StaqoDemo
//
//  Created by Priyanka Kapasiya on 07/12/20.
//  
//

import UIKit

class UserTVCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgUser.makeRounded()
        self.mainView.setBorder()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configureCell(data : UserDetails)  {
        self.lblName.text = data.fullName
        self.lblEmail.text = data.email
        self.imgUser.loadImageUsingCacheWithURLString(data.avatar ?? "", placeHolder: nil, completion: { (result) in
           // print(result)
        })
  
    }

}
