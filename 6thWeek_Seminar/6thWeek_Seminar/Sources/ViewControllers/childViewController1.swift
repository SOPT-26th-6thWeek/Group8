//
//  childViewController1.swift
//  6thWeek_Seminar
//
//  Created by 이윤진 on 2020/05/28.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit
import XLPagerTabStrip

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
        let item1 = ItemInfo(itemlabel: "클리어런스 마켓비")
        let item2 = ItemInfo(itemlabel: "마켓비 NASRI 러그 시리즈")
        ItemInformations = [item1, item2]
        
    }
     
    
}

/*func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
       let label = UILabel()
       label.text = "국내배송"
       label.backgroundColor = UIColor.lightGray
       return label
   }
  func numberOfSections(in tableView: UITableView) -> Int {
       return 2
   }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "sample"
       return cell
    }*/

extension childViewController1: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "국내배송"
        label.backgroundColor = UIColor.lightGray
        return label
    }
    //func numberOfSections(in tableView: UITableView) -> Int {
    //    return 2
    //}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemInformations.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cartItemCell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identfier, for: indexPath) as? ItemCell else{ return UITableViewCell()}
        cartItemCell.setItemInfo(itemname: ItemInformations[indexPath.row].itemname)
        return cartItemCell
    }
    
}

extension childViewController1: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 300
    }
}
