//
//  PostRequestPage.swift
//  HW4-3
//
//  Created by cpu on 18/4/23.
//

import UIKit

class PostRequestPage: UIViewController {
    
    private lazy var textField1: UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightGray
        text.placeholder = "Input ID"
        text.layer.cornerRadius  = 10
        return text
    }()
    
    private lazy var textField2: UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightGray
        text.placeholder = "Input Product Title"
        text.layer.cornerRadius  = 10

        return text
    }()
    
    private lazy var postRequest: UIButton = {
        let post = UIButton(type: .system)
        post.setTitle("POST", for: .normal)
        post.backgroundColor = .systemRed
        post.setTitleColor(.white, for: .normal)
        post.layer.cornerRadius = 10
        post.addTarget(self, action: #selector(postRequest(sender:)), for: .touchUpInside)
        return post
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(textField1)
        textField1.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        
        view.addSubview(textField2)
        textField2.snp.makeConstraints { make in
            make.top.equalTo(textField1.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        
        view.addSubview(postRequest)
        postRequest.snp.makeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
    }
    
    @objc private func postRequest(sender: UIButton) {
        APIManager.shared.postRequest(id: Int(textField1.text!)!,
                                      title: textField2.text!) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.showAlert(with: "Success", message: "With status code: \(data)")
                }
            case .failure(let error):
                break
            }
        }
    }
    
    private func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
