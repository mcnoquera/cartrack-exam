//
//  UserListViewController.swift
//  Cartrack Exam
//
//  Created by Mark Angelo Noquera on 7/17/20.
//  Copyright © 2020 Mark Noquera. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {
    
    @IBOutlet weak var usersTableView: UITableView!
    
    let navigationTitleText = "Users"
    let userTableViewIdentifier = "userTableViewIdentifier"
    
    lazy var viewModel = { [weak self] in
        return  UserListViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = navigationTitleText
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: CTColor.purple]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.logoutAction))
        self.navigationItem.rightBarButtonItem?.tintColor = CTColor.purple
        
        self.usersTableView.delegate = self
        self.usersTableView.dataSource = self
        self.usersTableView.tableFooterView = UIView()
        
        viewModel.getUsers {
            self.usersTableView.reloadData()
        }
    }
    
    @objc func logoutAction() {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = viewModel.indexOf(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: userTableViewIdentifier)!
        let nameLabel = cell.viewWithTag(10) as! UILabel
        let usernameLabel = cell.viewWithTag(11) as! UILabel
        nameLabel.text = vm.nameText
        usernameLabel.text = ["@", vm.userNameText].joined()
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = CTColor.purple.withAlphaComponent(0.20)
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vm = viewModel.indexOf(at: indexPath.row)
        let vc = CTEnum.Storyboard.Main.viewController(UserDetailsViewController.self)
        vc.viewModel = vm

        if let navigator = self.navigationController {
            navigator.pushViewController(vc, animated: true)
        }
    }
}
