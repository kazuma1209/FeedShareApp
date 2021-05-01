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
        UITabBar.appearance().barTintColor = UIColor(red: 255/255, green: 240/255, blue: 245/255, alpha: 1.0)
        
        let feed = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "food_unselected"), selectedImage: #imageLiteral(resourceName: "food_selected"), rootViewController: FeedController())
        
        let search = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchController())
        
        let imageSelector = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "plus_unselected"), selectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: ImageSelectorController())
        
        let notification = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "like_unselected"), selectedImage: #imageLiteral(resourceName: "like_selected"), rootViewController: NotificationController())
        
        let profile = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: ProfileController())
        
        viewControllers = [feed,search,imageSelector,notification,profile]
        
        tabBar.tintColor = .orange
    }
    
    func templateNavigationController(unselectedImage:UIImage,selectedImage:UIImage,rootViewController:UIViewController)->UINavigationController{
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        nav.navigationBar.barTintColor = UIColor(red: 255/255, green: 240/255, blue: 245/255, alpha: 1.0)
        return nav
    }
}
