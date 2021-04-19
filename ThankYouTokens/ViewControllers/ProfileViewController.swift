//
//  ProfileViewController.swift
//  ThankYouTokens
//
//  Created by Robin Lopez Ordonez on 9/21/20.
//

import UIKit

struct ProfileViewControllerViewModel {
    var email: String
    var first_name: String
    var last_name: String
}

class ProfileViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: ProfileViewControllerViewModel?
    var dataSource: [CellViewModel] = []
    
    weak var coordinator: ProfileCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.appColors.darkGray
        setupDataSource()
        configureTableView()
    }
    
    func setupDataSource() {
        dataSource = [
            HeaderTableViewCellViewModel(title: "Profile",
                                         titleColor: .white),
            ProfileRowTableViewCellViewModel(rowDescription: "Name",
                                             rowValue: "\(viewModel?.first_name ?? "") \(viewModel?.last_name ?? "")",
                                             textColor: .white),
            ProfileRowTableViewCellViewModel(rowDescription: "Email",
                                             rowValue: "\(viewModel?.email ?? "")",
                                             textColor: .white),
            LogOutTableViewCellViewModel(title: "Logout",
                                         titleColor: .white,
                                         buttonColor: UIColor.appColors.orange)
        ]
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
