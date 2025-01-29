//
//  ViewController.swift
//  SevenAppTask
//
//  Created by Cengizhan Dumlu on 29.01.2025.
//

import UIKit

class UserListViewController: UIViewController {
    
    private let tableView = UITableView() //Kullanıcıların gösterildiği tablo
    private let viewModel = UserListViewModel() //Kullanıcı verilerini sağlayan viewModel
    
    //ViewController yüklendiğinde gerçekleşecek işlemler.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        viewModel.fetchUsers() //Kullanıcı verilerinin çekilmesi.
    }
    
    //UI bileşenlerinin kurulumu.
    private func setupUI() {
        title = "Users" //Navigation bar başlığı
        view.backgroundColor = .white
        
        //UITableView ayarları.
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        
        //UITableView ana view içerisine eklenmesi.
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //ViewModel'in kullanıcı bilgileri güncellendiğinde UI'ı güncelleyen bağlamlar.
    private func setupBindings() {
        viewModel.onUsersUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData() //Kullanıcı güncellendikçe tablonun yenilenmesi.
            }
        }
        
        viewModel.onError = { [weak self] errorMessage in
            DispatchQueue.main.async {
                //Hata mesajlarının kullanıcıya gösterildiği bir alert.
                let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true)
            }
        }
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    
    //Tabloyu oluşturacak satır sayısının döndürüldüğü fonksiyon.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    //Satır için hücrelerin oluşturulduğu fonksiyon.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let user = viewModel.users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    //Kullanıcı tarafından bir satıra tıkladığında detay sınıfına geçiş yapılacak fonksiyon.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = viewModel.users[indexPath.row]
        let detailVC = UserDetailViewController(user: selectedUser) //Detay ekranına geçiş.
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
