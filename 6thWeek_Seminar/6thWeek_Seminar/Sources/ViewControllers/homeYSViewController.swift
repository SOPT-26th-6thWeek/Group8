//
//  HomeYSViewController.swift
//  6thWeek_Seminar
//
//  Created by 이예슬 on 5/28/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit
//import XLPagerTabStrip


let sb = UIStoryboard.init(name: "cart_hwangho", bundle: nil)

private var bannerList:[BannerInfo]=[]
private var categoryList:[CategoryInfo]=[]
//private func setBannerList(){
//    let banner1 = Banner(imgName: "imgLamp")
//    let banner2 = Banner(imgName: "imgLamp")
//    bannerList=[banner1,banner2]
//}

private var itemList:[HomeItemInfo]=[]
//private func setContentList(){
//    let content1 = Content(productName: "KADEDO 의자 티크", productImageName: "imgChair", productInfo: "평범한 나의 일상 속 작은 포인트,\n<KADEDO 의자>는 원목으로 이루어져 \n당신의 평범한 공간에 따뜻하고 부드러운 \n생기를 줄 수 있습니다", discount: "3%", price: "93,000원")
//    let content2 = Content(productName: "SIDON 원목가구", productImageName: "imgWoodfurniture", productInfo: "내 집에도 카페 테이블이? \n<SIDON 원목가구>는 집에서 카페 분위기를 \n낼 수 있습니다. \n당신의 집에서 홈카페를 즐겨보세요.", discount: "5%", price: "449,000원")
//    //contentList = [content1,content2]
//}
class HomeYSViewController: UIViewController {
    
    //var bannerList:[BannerInfo] = []
    @IBAction func gotoCart(_ sender: Any) {
        if let dvc = sb.instantiateViewController(identifier: "ParentVC") as? SHH_ParentViewController { self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
    @IBOutlet weak var imgCollectionView: UICollectionView!
    //let layout = PagingCollectionViewLayout()
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setBannerList()
        //setMenuList()
        //setContentList()

        LoadHomeBanner.shared.homeBanner(){ networkResult in
            switch networkResult{
            case .success(let banner):
                print(bannerList)
                guard let banner = banner as? [BannerInfo] else {
                    return}
                
                bannerList = banner
                print("print banner \(bannerList)")
                //print(bannerList)
                //print(bannerList.count)
                DispatchQueue.main.async {
                                  self.imgCollectionView.reloadData()
                    self.menuCollectionView.reloadData()
                              }
                
              
            case .requestErr(let message):
                guard let message = message as? String else {return}
                print(message)
            case .serverErr: print("serverErr")
            }
            
        }
        LoadHomeCategory.shared.homeCategory(){ networkResult in
        switch networkResult{
        case .success(let category):
            guard let category = category as? [CategoryInfo] else {
                return}
            //print("print category \(category)")
            categoryList = category            //print(bannerList)
            //print(bannerList.count)
            DispatchQueue.main.async {
                              self.imgCollectionView.reloadData()
                //self.menuCollectionView.reloadData()
                          }
            
          
        case .requestErr(let message):
            guard let message = message as? String else {return}
            print(message)
        case .serverErr: print("serverErr")
        }
            
        }
        LoadHomeItem.shared.homeItem(categoryIdx:1){ networkResult in
        switch networkResult{
        case .success(let item):
            guard let item = item as? [HomeItemInfo] else {
                return}
            //print("print category \(category)")
            itemList = item           //print(bannerList)
            print("확인\(itemList[0].option[0].dName)")
            //print(bannerList.count)
            DispatchQueue.main.async {
                              self.imgCollectionView.reloadData()
                self.menuCollectionView.reloadData()
                self.homeTableView.reloadData()
                          }
            
          
        case .requestErr(let message):
            guard let message = message as? String else {return}
            print(message)
        case .serverErr: print("serverErr")
        }
            
        }
        imgCollectionView.delegate = self
        imgCollectionView.dataSource = self
        homeTableView.delegate = self
        homeTableView.dataSource = self
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        //네비게이션바 설정
        setNavBar()
        
        //배너 통신 결과 가져오기
        
        

        
        // Do any additional setup after loading the view.
    }
//    @IBOutlet weak var topCart: UIBarButtonItem!
//    @IBOutlet weak var topSearch: UIBarButtonItem!
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
        titleLogo.frame = CGRect(x: 0,y: 0,width: 130,height: 28)
//        let topSearch = UIBarButtonItem(image:UIImage(named:"icTopSearch"),style: UIBarButtonItem.Style.plain,target:nil,action:nil)
//
//        let topCart = UIBarButtonItem(image:UIImage(named:"icTopShoppingbag"),style: UIBarButtonItem.Style.plain,target:nil,action:nil)
//        topCart.width = 20
        self.navigationItem.titleView = titleLogo
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
//        topCart.width = 10
//        topSearch.width = 10
//        self.navigationItem.setRightBarButtonItems([topSearch,topCart], animated: false)
        
        
    }
    @objc func cartAction(_ sender : Any){
        let cartAlert = UIAlertController(title:"",message:"장바구니에 상품이 담겼습니다",preferredStyle:.alert)
        cartAlert.addAction(UIAlertAction(title:"확인",style:.default))
        self.present(cartAlert,animated:true)
        
    }
//    @IBAction func cartAlert(_ sender: Any) {
//        let cartAlert = UIAlertController(title:"",message:"장바구니에 상품이 담겼습니다",preferredStyle:.alert)
//        cartAlert.addAction(UIAlertAction(title:"확인",style:.default))
//        //홈뷰컨에서 alert present 하는 법?
//        self.present(cartAlert,animated:true)
//    }
//    
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

        if(collectionView == self.imgCollectionView){
            //collectionView.reloadData()
            
            return bannerList.count
        }
        else{
            return categoryList.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == self.imgCollectionView){
            
            print("배너리스트\(bannerList.count)")
            //collectionView.reloadData()
            guard let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.identifier, for: indexPath) as? BannerCell else {return UICollectionViewCell()}
            bannerCell.set(bannerList[indexPath.row])
                  return bannerCell
        }
        else {
            guard let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell else {return UICollectionViewCell()}
            menuCell.setCategory(categoryList[indexPath.row])
            return menuCell        }
    }
    
}

extension HomeYSViewController :UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath -> Int?) {
//
//    }
}
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }

extension HomeYSViewController :UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(itemList.count)
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let contentCell = tableView.dequeueReusableCell(withIdentifier: ContentCell.identifier, for: indexPath) as? ContentCell else{return UITableViewCell()}
        print(indexPath.row)
        contentCell.set(itemList[indexPath.row],indexPath.row)
        contentCell.cartButton.addTarget(self, action: #selector(cartAction(_:)), for: .touchUpInside)
        //contentCell.cartButton
        
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
    

//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        
//    }
}
