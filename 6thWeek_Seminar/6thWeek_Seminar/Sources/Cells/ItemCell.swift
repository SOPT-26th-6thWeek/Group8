//
//  ItemCell.swift
//  6thWeek_Seminar
//
//  Created by 이윤진 on 2020/05/29.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit
import DropDown

class ItemCell: UITableViewCell {

    static let identfier: String = "ItemCell"
    var dropDown:DropDown?
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var point: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var quantity: UILabel!
    var quanNum:Int = 1
    
    @IBAction func minQunatity(_ sender: Any) {
        if quanNum > 1 {
            quanNum = quanNum - 1
            quantity.text = "\(quanNum)"
        }else{
            quantity.text = "\(quanNum)"
        }
    }
    @IBAction func addQuantity(_ sender: Any) {
        quanNum = quanNum + 1
        quantity.text = "\(quanNum)"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        dropDown = DropDown()
        dropDown?.anchorView = button
        dropDown?.dataSource = ["50 X 90 미네랄", "60 X 100 미네랄"]
        button.addTarget(self, action: #selector(dropDownButton), for: .touchUpInside)
        dropDown?.selectionAction = { [unowned self] (index: Int, item: String) in self.button.setTitle(item, for: .normal)
        }
        // Initialization code
    }
    
    @objc func dropDownButton(){
        
        dropDown?.show()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setItemInfo(_ cartInfo:Delivery){
        
       
        itemImageView.imageFromUrl(cartInfo.img, defaultImgPath: "")
        itemName.text = cartInfo.name
        cost.text = String(cartInfo.price)
        point.text = String(cartInfo.savings)
        quantity.text = String(cartInfo.quantity)
    }

}
