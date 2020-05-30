//
//  HomeYSViewController.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 5/28/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit
import XLPagerTabStrip

private var bannerList:[Banner]=[]
private func setBannerList(){
    let banner1 = Banner(imgName: "imgLamp")
    let banner2 = Banner(imgName: "imgLamp")
    bannerList=[banner1,banner2]
}

private var contentList:[Content]=[]
private func setContentList(){
    let content1 = Content(productName: "KADEDO 의자 티크", productImageName: "imgChair", productInfo: "평범한 나의 일상 속 작은 포인트,\n<KADEDO 의자>는 원목으로 이루어져 \n당신의 평범한 공간에 따뜻하고 부드러운 \n생기를 줄 수 있습니다", discount: "3%", price: "93,000원")
    let content2 = Content(productName: "SIDON 원목가구", productImageName: "imgWoodfurniture", productInfo: "내 집에도 카페 테이블이? \n<SIDON 원목가구>는 집에서 카페 분위기를 \n낼 수 있습니다. \n당신의 집에서 홈카페를 즐겨보세요.", discount: "5%", price: "449,000원")
    contentList = [content1,content2]
}
class HomeYSViewController: UIViewController {
    
    
    @IBOutlet weak var imgCollectionView: UICollectionView!
    //let layout = PagingCollectionViewLayout()
    
    @IBOutlet weak var homeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBannerList()
        setContentList()
        imgCollectionView.delegate = self
        imgCollectionView.dataSource = self
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        //네비게이션바 설정
        setNavBar()
        
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var topCart: UIBarButtonItem!
    @IBOutlet weak var topSearch: UIBarButtonItem!
    @IBAction func topSearchAction(_ sender: Any) {
    }
    @IBAction func topCartAction(_ sender: Any) {
    }
    @IBAction func leftPage(_ sender: Any) {
        //
        let visibleItems: NSArray = imgCollectionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
        if nextItem.row < bannerList.count && nextItem.row >= 0{
            imgCollectionView.scrollToItem(at: nextItem, at: .right, animated: true)

        }
    }
    @IBAction func rightPage(_ sender: Any) {
        let visibleItems: NSArray = imgCollectionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
               if nextItem.row < bannerList.count {
            imgCollectionView.scrollToItem(at: nextItem, at: .left, animated: true)

        }
    }
    func setNavBar(){
        let logoImageName = "imgLogo"
        let titleLogo = UIImageView()
        titleLogo.image = UIImage(named:logoImageName)
        self.navigationItem.titleView = titleLogo
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        self.topCart.width = 30
        self.topSearch.width = 30
        
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
        guard let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.identifier, for: indexPath) as? BannerCell else {return UICollectionViewCell()}
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
extension HomeYSViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let contentCell = tableView.dequeueReusableCell(withIdentifier: ContentCell.identifier, for: indexPath) as? ContentCell else{return UITableViewCell()}
        contentCell.set(productName: contentList[indexPath.row].productName, productImgName: contentList[indexPath.row].productImageName, productInfo: contentList[indexPath.row].productInfo, dcLabel_: contentList[indexPath.row].discount
            , priceLabel: contentList[indexPath.row].price, divideLine: contentList[indexPath.row].divideLine,marketB:contentList[indexPath.row].marketB)
        
        return contentCell
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        <#code#>
//    }
    
}

extension HomeYSViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 594
    }
}