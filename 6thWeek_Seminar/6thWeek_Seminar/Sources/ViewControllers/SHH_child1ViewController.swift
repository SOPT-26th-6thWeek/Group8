//
//  SHH_childViewController.swift
//  6thWeek_Seminar
//
//  Created by 송황호 on 2020/05/30.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit
import XLPagerTabStrip
    //import iOSDropDown

    class SHH_child1ViewController: UIViewController, IndicatorInfoProvider{

        private var ItemInformations: [ItemInfo] = []
        private var cartItems: [Delivery] = []
        
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
            setItemInformations()
            super.viewDidLoad()
            
            basketService.shared.getBasketService(){ networkResult in
                switch networkResult {
               
                    
                case .success(let basket):
                     guard let basket = basket as? [Delivery] else {return}
                     //print(basket)
                     self.cartItems = basket
                     print(self.cartItems)
                     DispatchQueue.main.async {
                        self.itemTableView.reloadData()
                    }
                     self.itemTableView.reloadData()
                    
                case .requestErr(let message):
                    guard let message = message as? String else {return}
                    print(message)
                
                case .serverErr:
                    print("serverErr")
             
                }
                
                
                
            }
    
            itemTableView.delegate = self
            itemTableView.dataSource = self
            
            self.totalCostView.isHidden = true
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
            return cartItems.count
        }
       
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            print("장바구니개수\(self.cartItems.count)")
            guard let cartItemCell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identfier, for: indexPath) as? ItemCell else{ return UITableViewCell()}
            cartItemCell.setItemInfo(self.cartItems[indexPath.row])
            return cartItemCell
        }
        
    }

    extension SHH_child1ViewController: UITableViewDelegate{
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
        }
    }
