//
//  ProfileViewController.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/21/20.
//

import UIKit

class ProfileViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var coordinator: ProfileCoordinator?
    var dataSource: [Any] = [
        HeaderTableViewCellViewModel(title: "Profile", titleColor: .white),
        ProfileRowTableViewCellViewModel(rowDescription: "Name", rowValue: "Robin Lopez", textColor: .white),
        ProfileRowTableViewCellViewModel(rowDescription: "Email", rowValue: "robin.lopez@uconn.edu", textColor: .white),
        LogOutTableViewCellViewModel(title: "Logout", titleColor: .white, buttonColor: UIColor.appColors.orange)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appColors.darkGray
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.appColors.darkGray
        tableView.separatorStyle = .none
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderTableViewCell
            cell.configure(viewModel: dataSource[indexPath.row] as! HeaderTableViewCellViewModel)
            return cell
        } else if indexPath.row == dataSource.count - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LogOutCell") as! LogOutTableViewCell
            cell.configure(viewModel: dataSource[indexPath.row] as! LogOutTableViewCellViewModel)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileRowTableViewCell
            cell.configure(viewModel: dataSource[indexPath.row] as! ProfileRowTableViewCellViewModel)
            return cell
        }
    }
}
