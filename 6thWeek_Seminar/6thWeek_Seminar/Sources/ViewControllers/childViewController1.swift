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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "child1")
    }
    
}
