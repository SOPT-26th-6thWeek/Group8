//
//  HomeYSViewController.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 5/28/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit
import PagingCollectionViewLayout

private var bannerList:[Banner]=[]
private func setBannerList(){
    let banner1 = Banner(imgName: "imgLamp")
    let banner2 = Banner(imgName: "imgLamp")
    bannerList=[banner1,banner2]
}
class HomeYSViewController: UIViewController {
    @IBOutlet weak var imgCollectionView: UICollectionView!
    //let layout = PagingCollectionViewLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        setBannerList()
        imgCollectionView.delegate = self
        imgCollectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeYSViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: imgCollectionViewCell.identifier, for: indexPath) as? imgCollectionViewCell else {return UICollectionViewCell()}
        bannerCell.set(bannerList[indexPath.row])
        return bannerCell
        
    }
    
}

extension HomeYSViewController :UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
