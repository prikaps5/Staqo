//
//  CommonFunctions.swift
//  StaqoDemo
//
//  Created by Priyanka Kapasiya on 08/12/20.
//

import Foundation
import UIKit


class CommonFunction:NSObject {
    static let sharedInstance = CommonFunction()

    func showAlert(view: UIViewController,msg:String) {
        let alert = UIAlertController( title: "StaqoDemo", message: msg, preferredStyle: UIAlertController.Style.alert)
              alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
              view.present(alert, animated: true, completion: nil)
    }
}
 

