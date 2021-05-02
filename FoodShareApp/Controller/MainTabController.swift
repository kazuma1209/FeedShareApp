//
//  MainTabController.swift
//  FoodShareApp
//
//  Created by 坂田一真 on 2021/05/01.
//

import UIKit

class MainTabController:UITabBarController{
    //MARK: -プロパティー

    //MARK: -ライフサイクル
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        
    }
    
    //MARK: -ヘルパー
    func configureViewController(){
        
        view.backgroundColor = .white
        UITabBar.appearance().barTintColor = .black
        
        let layout = UICollectionViewFlowLayout()
        let feed = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "food_unselected"), selectedImage: #imageLiteral(resourceName: "food_selected"), rootViewController: FeedController(collectionViewLayout: layout))
        
        let search = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "探す_unselected"), selectedImage: #imageLiteral(resourceName: "探す_unselected"), rootViewController: SearchController())
        
        let imageSelector = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "plus"), selectedImage: #imageLiteral(resourceName: "plus"), rootViewController: ImageSelectorController())
        
        let notification = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "banana"), selectedImage: #imageLiteral(resourceName: "banana"), rootViewController: NotificationController())
        
        let profile = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "人"), selectedImage: #imageLiteral(resourceName: "人"), rootViewController: ProfileController())
        
        viewControllers = [feed,search,imageSelector,notification,profile]
        
        tabBar.tintColor = .orange
    }
    
    func templateNavigationController(unselectedImage:UIImage,selectedImage:UIImage,rootViewController:UIViewController)->UINavigationController{
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .white
        nav.navigationBar.barTintColor = .orange
        return nav
    }
}
