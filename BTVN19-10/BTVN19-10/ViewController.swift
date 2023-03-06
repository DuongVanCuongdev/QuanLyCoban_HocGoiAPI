//
//  ViewController.swift
//  BTVN19-10
//
//  Created by Dương Văn Cường on 21/10/2022.
//

import UIKit
import Kingfisher
import Alamofire
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var friendsData: [Friend] = []
 
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtImg: UITextField!
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var tblFriends: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFriends.delegate = self
        tblFriends.dataSource = self
        tblFriends.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cellFriend")
        
        getFriendsFromUserDefault()

//        if friendsData.isEmpty{
            getFriendsFromAPI()
            print("Đã gọi API")
//        } else {
            print("Bạn đã gọi API một lần rồi")
//        }
        
        APIHandler.init().getF()
            
        

    }


    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFriends.dequeueReusableCell(withIdentifier: "cellFriend", for: indexPath) as! TableViewCell
        
        let currentFriend = friendsData[indexPath.row]
        let url = URL(string: currentFriend.avatar)
        cell.imgAvtatar.kf.setImage(with: url)
        
        cell.lblName.text = currentFriend.name
        cell.btnDelete.addTarget(self, action: #selector(deleteFriend(_:)), for: .touchUpInside)
        cell.btnDelete.tag = indexPath.row
        
        cell.btnPut.addTarget(self, action: #selector(putFriend(_:)), for: .touchUpInside)
        cell.btnPut.tag = indexPath.row
        

        return cell
    }
    
    

    
    
    
    
    
    
    
//MARK: Bài 1
    func getFriendsFromAPI() {
        APIHandler.init().getFriends { [self] friendsResponseData in
            self.friendsData = friendsResponseData
            UserDefaults.standard.set(try? PropertyListEncoder().encode(friendsResponseData), forKey: "listFriend")
                self.tblFriends.reloadData()
        }
    }
    func getFriendsFromUserDefault() {
        if let userData = UserDefaults.standard.value(forKey: "listFriend") as? Data {
            friendsData = try! PropertyListDecoder().decode(Friends.self, from: userData)
            self.tblFriends.reloadData()
        }
    }
    
    
    
    
    //MARK: Bài 2
    @objc func deleteFriend(_ sender: UIButton) {
        print("id:\(friendsData[sender.tag].id)")
        APIHandler.init().deleteFriend(_id: friendsData[sender.tag].id)
        friendsData.remove(at: sender.tag)
        self.tblFriends.reloadData()

    }
    
    
    
    
    @IBAction func btnPost(_ sender: UIButton) {
        if txtID.text != "" && txtImg.text != "" && txtName.text != ""{
            let friend = Friend(name: "\(txtName.text ?? "")", avatar:"\(txtImg.text ?? "")", id: "\(txtID.text ?? "")")
            friendsData.append(friend)
            APIHandler.init().postFriend(_bodyRequest: friend)
            txtID.text = ""
            txtImg.text = ""
            txtName.text = ""
//            getFriendsFromAPI()
        } else {
            print("Không để trống ô nào")
        }
        
        self.tblFriends.reloadData()
    }
    
    
    
    
    @objc func putFriend(_ sender: UIButton){
        
        let friend = Friend(name: "\(txtName.text ?? "")", avatar: "\(txtImg.text ?? "")", id:friendsData[sender.tag].id)
        if txtName.text != "" && txtImg.text != ""{
            friendsData[sender.tag] = friend
            
            print(friendsData[sender.tag].id)
                APIHandler.init().putFriend(_id: friendsData[sender.tag].id, friend: friend)
        }
        self.tblFriends.reloadData()
    }
}


