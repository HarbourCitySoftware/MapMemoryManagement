//
//  AppTabBarController.swift
//  MapMemoryManagement
//
//  Created by Zachary Simone on 10/10/20.
//

import UIKit

final class AppTabBarController: UITabBarController {

    private let firstTabViewController = EmptyViewController()
    private let secondTabViewController = EmptyViewController()
    private let mapTabViewController = MapViewController()

    init() {
        super.init(nibName: nil, bundle: nil)
        firstTabViewController.tabBarItem = .init(title: "EmptyOne", image: UIImage(systemName: "bookmark.fill"), tag: 0)
        secondTabViewController.tabBarItem = .init(title: "EmptyTwo", image: UIImage(systemName: "paperplane.fill"), tag: 1)
        mapTabViewController.tabBarItem = .init(title: "Map", image: UIImage(systemName: "map.fill"), tag: 2)
        viewControllers = [firstTabViewController, secondTabViewController, mapTabViewController]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
