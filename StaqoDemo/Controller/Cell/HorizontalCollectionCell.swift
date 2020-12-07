//
//  HorizontalCollectionCell.swift
//  StaqoDemo
//
//  Created by Priyanka Kapasiya on 08/12/20.
//

import UIKit

class HorizontalCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgUser.makeRounded()
        self.mainView.setBorder()
        
    }
    
    func configureCell(data : UserDetails)  {
        self.lblName.text = data.fullName
        self.lblEmail.text = data.email
        self.imgUser.loadImageUsingCacheWithURLString(data.avatar ?? "", placeHolder: nil, completion: { (result) in
           // print(result)
        })
  
    }
    
}
