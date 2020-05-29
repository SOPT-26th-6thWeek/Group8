//
//  childViewController1.swift
//  6thWeek_Seminar
//
//  Created by 이윤진 on 2020/05/28.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import iOSDropDown

class childViewController1: UIViewController, IndicatorInfoProvider{

    private var ItemInformations: [ItemInfo] = []
    @IBOutlet weak var itemTableView: UITableView!
    
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
        itemTableView.delegate = self
        itemTableView.dataSource = self
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
     
    
}


extension childViewController1: UITableViewDataSource{
    

    //func numberOfSections(in tableView: UITableView) -> Int {
    //    return 2
    //}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemInformations.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cartItemCell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identfier, for: indexPath) as? ItemCell else{ return UITableViewCell()}
        cartItemCell.setItemInfo(itemname: ItemInformations[indexPath.row].itemname, itempoint: ItemInformations[indexPath.row].itempoint, itemcost: ItemInformations[indexPath.row].itemcost)
        return cartItemCell
    }
    
}

extension childViewController1: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 300
    }
}
