//
//  ViewController.swift
//  StaqoDemo
//
//  Created by Priyanka Kapasiya on 07/12/20.
//  
//

import UIKit
import AVKit
import CoreData

 let kAppDelegate =
  UIApplication.shared.delegate as! AppDelegate
class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    private var allUserDetail : [UserDetails] = []
    var limit = 0
    var totalEnteries = 0
    var page = 1
    var totalPages = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if  self.fetchData().count > 0 {
            self.tblView.reloadData()
        } else {
            self.getReqForUserList(page: page)

        }
    }
    
    
    //MARK:- Private methods
    private func getReqForUserList(page:Int) {
        
        ApiManager.shared.callApi(ApiUrl.reqUrl + "\(page)", methodType: .GET , params: [:], successClosure: { (data) in
            self.totalEnteries = data["total"] as? Int ?? 0
            self.limit         = data["per_page"] as? Int ?? 0
            self.totalPages    = data["total_pages"] as? Int ?? 0
            if let results = data["data"] as? [JSONDict] {
                var index = 0
                while index < self.limit {
                    self.allUserDetail.append(UserDetails.init(with: results[index]))
                    self.save(name: self.allUserDetail[index].fullName, email: self.allUserDetail[index].email ?? "", img: self.allUserDetail[index].avatar ?? "")
                    index = index + 1
                }
            }
            DispatchQueue.main.async {
                self.tblView.reloadData()
            }
        }) { (err) in
            CommonFunction.sharedInstance.showAlert(view: self, msg: err)
            return
        }
    }
    
    func fetchData() -> [UserDetails] {
         //1
       
         
         let managedContext =
            kAppDelegate.persistentContainer.viewContext
         
         //2
         let fetchRequest =
           NSFetchRequest<NSManagedObject>(entityName: "User")
         
         //3
         do {
           let user = try managedContext.fetch(fetchRequest)
            for i in user {
                let u_email = i.value(forKey: "email") as? String ?? ""
                let u_name  = i.value(forKey: "fullName") as? String ?? ""
                let u_img   = i.value(forKey: "avatar") as? String ?? ""
                self.allUserDetail.append(UserDetails(with: ["email":u_email,"fullName":u_name,"avatar":u_img]))
            }
            return allUserDetail

         } catch let error as NSError {
           print("Could not fetch. \(error), \(error.userInfo)")
         }
        return []
    }
    
    func save(name:String,email:String,img:String) {
     
      // 1
      let managedContext =
        kAppDelegate.persistentContainer.viewContext
      // 2
      let entity =
        NSEntityDescription.entity(forEntityName: "User",
                                   in: managedContext)!
      
      let user = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
        user.setValue(img, forKeyPath: "avatar")
        user.setValue(name, forKeyPath: "fullName")
        user.setValue(email, forKeyPath: "email")
      do {
        try managedContext.save()
      } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
      }
    }

    @IBAction func nextBtnClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let obj = storyboard
                       .instantiateViewController(withIdentifier: "HorizontalListVC") as! HorizontalListVC
        obj.allUserDetail = self.allUserDetail
        self.navigationController?.pushViewController(obj, animated: true)
               

    }
    
}


extension ViewController : UITableViewDataSource ,UITableViewDelegate{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allUserDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tblView.dequeueReusableCell(withIdentifier: "UserTVCell", for: indexPath) as! UserTVCell
        cell.configureCell(data: self.allUserDetail[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.allUserDetail.count - 1 {
            if self.allUserDetail.count < totalEnteries {
                page = page + 1
                self.getReqForUserList(page: page)
            }
        }
    }
  

}

