//
//  SettingsViewController.swift
//  Food Discovery
//
//  Created by Jinglun Zhou on 2020/12/29.
//

import SafariServices
import UIKit

struct SettingCellModel {
    let title: String
    let handler: (() -> Void)
}

final class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    private var data = [[SettingCellModel]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func configureModels() {
        data.append([
            SettingCellModel(title:"Edit Profile") { [weak self] in
                self?.didTapEditProfile()
                            
            },
            SettingCellModel(title:"Invite Friends") { [weak self] in
                self?.didTapInviteFriends()
                            
            },
            SettingCellModel(title:"Save Posts") { [weak self] in
                self?.didTapSavePosts()
                            
            }
        ])
        
        data.append([
            SettingCellModel(title:"Terms of Service") { [weak self] in
                self?.openURL(type: .terms)
                            
            },
            SettingCellModel(title:"Privacy") { [weak self] in
                self?.openURL(type: .privacy)
            },
            SettingCellModel(title:"Feedback") { [weak self] in
                self?.openURL(type: .help)
            },
            
        ])
        
        let section = [
            SettingCellModel(title: "Log Out") { [weak self] in
                self?.didTapLogOut()
                
            }
        ]
        data.append(section)
    }
    
    enum SettingsURLType {
        case terms, privacy, help
    }
    
    private func openURL(type: SettingsURLType) {
        let urlString: String
        switch type {
        case .terms: urlString = ""
        case .privacy: urlString = ""
        case .help: urlString = ""
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let vc = SFSafariViewController(url:url)
        present(vc,animated: true)
    }
    
    private func didTapSavePosts() {
        
    }
    
    private func didTapInviteFriends() {
        
    }
    
    private func didTapEditProfile() {
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        let navigationVC = UINavigationController(rootViewController: vc)
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC,animated: true)
    }
    
    private func didTapLogOut() {
        let alertController = UIAlertController(title: "Log Out", message: "Confirm to log out", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: {_ in
            AuthManager.shared.logOut(completion: {success in
                DispatchQueue.main.async {
                    if success {
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    } else {
                        // error
                        fatalError("There is an error when logging out")
                    }
                }
            })
        }))
        
        // for iPad
        alertController.popoverPresentationController?.sourceView = tableView
        alertController.popoverPresentationController?.sourceRect = tableView.bounds
        
        present(alertController,animated: true)

    }

}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return data[section].count
    }
    
    // connect data with actuall cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    // connect action when tapping the cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = data[indexPath.section][indexPath.row]
        model.handler()
    }
}
