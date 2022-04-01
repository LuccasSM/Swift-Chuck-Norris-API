//
//  ViewController.swift
//  Swift-API-ChuckNorris
//
//  Created by Luccas Santana Marinho on 01/04/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        insertViews()
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            iconUrl.topAnchor.constraint(equalTo: self.button.bottomAnchor, constant: 30),
            iconUrl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            
            id.topAnchor.constraint(equalTo: self.iconUrl.bottomAnchor, constant: 30),
            id.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            
            url.topAnchor.constraint(equalTo: self.id.bottomAnchor, constant: 30),
            url.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            
            value.topAnchor.constraint(equalTo: self.url.bottomAnchor, constant: 30),
            value.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
        ])
    }
    
        // MARK: - Inserindo elementos na tela
    
    func insertViews() {
        self.view.addSubview(button)
        self.view.addSubview(iconUrl)
        self.view.addSubview(id)
        self.view.addSubview(url)
        self.view.addSubview(value)
    }
    
    // MARK: - Criando os elementos
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.backgroundColor = .white
        button.setTitle("Pesquisar", for: .normal)
        button.setTitleColor(UIColor.systemGray, for: .normal)
        button.addTarget(self, action: #selector(startApi), for: .touchUpInside)
        return button
    }()
    
    private lazy var iconUrl: UILabel = {
        let iconUrl = UILabel(frame: .zero)
        iconUrl.translatesAutoresizingMaskIntoConstraints = false
        iconUrl.text = "Icon-Url:"
        iconUrl.font = UIFont.boldSystemFont(ofSize: 18)
        iconUrl.textColor = .white
        return iconUrl
    }()
    
    private lazy var id: UILabel = {
        let id = UILabel(frame: .zero)
        id.translatesAutoresizingMaskIntoConstraints = false
        id.text = "ID:"
        id.font = UIFont.boldSystemFont(ofSize: 18)
        id.textColor = .white
        return id
    }()
    
    private lazy var url: UILabel = {
        let url = UILabel(frame: .zero)
        url.translatesAutoresizingMaskIntoConstraints = false
        url.text = "Url:"
        url.font = UIFont.boldSystemFont(ofSize: 18)
        url.textColor = .white
        return url
    }()
    
    private lazy var value: UILabel = {
        let value = UILabel(frame: .zero)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.text = "Value:"
        value.font = UIFont.boldSystemFont(ofSize: 18)
        value.textColor = .white
        return value
    }()
    
    // MARK: - Funcao no botao de Ir
    
    @objc func startApi() {
        ServiceAPICN.servicoApi(iconUrl.text!) { (api) in
            DispatchQueue.main.sync {
                self.iconUrl.text = "Icon-Url: \(api.icon_url)"
                self.id.text = "ID: \(api.id)"
                self.url.text = "Url: \(api.url)"
                self.value.text = "Value: \(api.value)"
            }
        }
    }
}
