//
//  UserDetailViewController.swift
//  SevenAppTask
//
//  Created by Cengizhan Dumlu on 29.01.2025.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    private let viewModel: UserDetailViewModel //Kullanıcı verilerinin sağlandığı viewModel
    private let stackView = UIStackView()
    
    //Kullanıcıyı alan ve viewModel'i başlatan init fonksiyonu
    init(user: User) {
        self.viewModel = UserDetailViewModel(user: user)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //ViewController yüklendiğinde gerçekleşen işlemler.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()//UI düzeninin oluşturulduğu fonksiyon.
    }
    
    //UI Bileşenlerinin konumlandırılması.
    private func setupUI() {
        title = "User Details"
        view.backgroundColor = .white
        
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false

        //viewModel'dan alınan kullanıcı bilgilerinin her biri için etiket oluşturulması.
        let nameLabel = createLabel(text: viewModel.name, fontSize: 22, isBold: true)
        let emailLabel = createLabel(text: viewModel.email)
        let phoneLabel = createLabel(text: viewModel.phone)
        let websiteLabel = createLabel(text: viewModel.website)
        
        //etiketlerin stackView'a eklenmesi.
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(phoneLabel)
        stackView.addArrangedSubview(websiteLabel)
        
        //stackView'ın ana view içerisine eklenmesi.
        view.addSubview(stackView)
        
        //stackView için auto layout kısıtlamalarının aktif edilmesi.
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    //etiketlerin oluşturulduğu fonksiyon.
    private func createLabel(text: String, fontSize: CGFloat = 18, isBold: Bool = false) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        return label
    }
}
