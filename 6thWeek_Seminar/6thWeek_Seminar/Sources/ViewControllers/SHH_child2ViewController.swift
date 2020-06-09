//
//  SHH_childViewController.swift
//  6thWeek_Seminar
//
//  Created by 송황호 on 2020/05/30.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit
import XLPagerTabStrip

    class SHH_child2ViewController: UIViewController, IndicatorInfoProvider{
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
            return IndicatorInfo(title: "해외배송")
        }
    }
