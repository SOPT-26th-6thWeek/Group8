//
//  SHH_ParentViewController.swift
//  6thWeek_Seminar
//
//  Created by 송황호 on 2020/05/30.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit
import XLPagerTabStrip

    class SHH_ParentViewController: ButtonBarPagerTabStripViewController {

        let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)
        override func viewDidLoad() {
            settings.style.buttonBarBackgroundColor = .white
            settings.style.buttonBarItemBackgroundColor = .white
            settings.style.selectedBarBackgroundColor = purpleInspireColor
            settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
            settings.style.selectedBarHeight = 2.0
            settings.style.buttonBarMinimumLineSpacing = 0
            settings.style.buttonBarItemTitleColor = .black
            settings.style.buttonBarItemsShouldFillAvailableWidth = true
            settings.style.buttonBarLeftContentInset = 0
            settings.style.buttonBarRightContentInset = 0
            changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            newCell?.label.textColor = self?.purpleInspireColor
            }
            super.viewDidLoad()
            self.navigationController?.navigationBar.topItem?.title = ""
            self.navigationController?.navigationBar.tintColor = UIColor.darkGray
            //self.navi
            
            // Do any additional setup after loading the view.
        }
        
        override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
            let child_1 = UIStoryboard(name: "cart_hwangho", bundle: nil).instantiateViewController(withIdentifier: "child01")
            
            let child_2 = UIStoryboard(name: "cart_hwangho", bundle: nil).instantiateViewController(withIdentifier: "child02")
            return [child_1, child_2]
        }


    }

