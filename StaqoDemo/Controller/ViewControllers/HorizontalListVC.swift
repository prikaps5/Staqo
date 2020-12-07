//
//  HorizontalListVC.swift
//  StaqoDemo
//
//  Created by Priyanka Kapasiya on 08/12/20.
//

import UIKit

class HorizontalListVC: UIViewController {

     var allUserDetail : [UserDetails] = []

    @IBOutlet weak var collectiobVw: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectiobVw.delegate = self
        self.collectiobVw.dataSource = self
    }

}

extension HorizontalListVC:UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allUserDetail.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCollectionCell", for: indexPath) as! HorizontalCollectionCell
        cell.configureCell(data: self.allUserDetail[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectiobVw.frame.width, height: self.collectiobVw.frame.height)
    }
}
