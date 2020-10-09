//
//  EmptyViewController.swift
//  MapMemoryManagement
//
//  Created by Zachary Simone on 10/10/20.
//

import UIKit

final class EmptyViewController: UIViewController {

    private let label: UILabel = {
        let label = UILabel()
        label.text = "This is an empty view"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
