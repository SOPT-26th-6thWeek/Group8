//
//  SHH_childViewController.swift
//  6thWeek_Seminar
//
//  Created by 송황호 on 2020/05/30.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Alamofire
    //import iOSDropDown

    class SHH_child1ViewController: UIViewController, IndicatorInfoProvider{

        private var ItemInformations: [ItemInfo] = []
 
        // 새로운 key-value 값 받아올 myItems 변수 설정
        var myItems: [[String: Any]] = [[String: Any]]()
        @IBOutlet weak var itemTableView: UITableView!
        
         @IBOutlet weak var totalCostView: UIView!  // 전체 비용
        
        
        
        @IBAction func like(_ sender: UIButton) {
         
            let alertViewController = UIAlertController(title: "관심상품", message: "관심상품으로 등록되었습니다", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alertViewController.addAction(action)
            self.present(alertViewController, animated: true, completion: nil)
        }
        
        @IBAction func deleteItem(_ sender: UIButton) {
     
        }
        
        override func viewDidLoad() {
            //setItemInformations()
            super.viewDidLoad()
            itemTableView.delegate = self
            itemTableView.dataSource = self
            
            self.totalCostView.isHidden = true
            
            Alamofire.request(APIConstants.shoppingbagURL).responseJSON{(response) in
                if let responseValue = response.result.value as! [String: Any]?{
                    if let responseItems = responseValue["data"] as! [[String: Any]]?{
                        self.myItems = responseItems
                        self.itemTableView.reloadData()
                    }
                }
                
            }
            
            
        }
        
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
            return IndicatorInfo(title: "국내배송")
        }
        
        private func setItemInformations(){
            let item1 = ItemInfo(itemlabel: "GUBURI LED 단스탠드 레드", point: "1,500원", cost: "50,700")
            let item2 = ItemInfo(itemlabel: "마켓비 NASRI 러그 시리즈", point: "300원", cost: "11,900")
            let item3 = ItemInfo(itemlabel: "EZBO HERO 캐비넷 시리즈", point: "8,000원", cost: "269,000")
            let item4 = ItemInfo(itemlabel: "EZBO HEPO 캐비넷 협탁", point: "2,800원", cost: "95,900")
            ItemInformations = [item1,item2,item3,item4]
            
        }
         
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let height = scrollView.frame.size.height
            let contentYoffset = scrollView.contentOffset.y
            let distanceFromBottom = scrollView.contentSize.height - contentYoffset
            var bottom: NSLayoutConstraint
           
      
   
            if distanceFromBottom <=  height {
                
                self.totalCostView.isHidden = false
                
                bottom = self.view.bottomAnchor.constraint(equalTo: itemTableView.bottomAnchor, constant: 130)
                bottom.isActive = true
                
            }else{
                
                self.totalCostView.isHidden = false
              
             
            }

       
        }
        
    }


    extension SHH_child1ViewController: UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            //return ItemInformations.count
            return myItems.count
        }
       
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cartItemCell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identfier, for: indexPath) as? ItemCell else{ return UITableViewCell()}
            //cartItemCell.setItemInfo(itemname: ItemInformations[indexPath.row].itemname, itempoint: ItemInformations[indexPath.row].itempoint, itemcost: ItemInformations[indexPath.row].itemcost)
            //return cartItemCell
            if self.myItems.count > 0{
                let eachItem = self.myItems[indexPath.row]
                cartItemCell.itemName.text = (eachItem["name"] as? String) ?? ""
            }
            return cartItemCell
        }
        
    }

    extension SHH_child1ViewController: UITableViewDelegate{
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
        }
    }
