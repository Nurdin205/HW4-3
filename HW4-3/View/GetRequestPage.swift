//
//  GetRequestPage.swift
//  HW4-3
//
//  Created by cpu on 17/4/23.
//
import Foundation
import UIKit
import SnapKit
import Kingfisher

class GetRequestPage: UIViewController {
    var data: [Product] = []
    
    private lazy var tableVeiw: UITableView = {
        let view = UITableView()
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Some news"
        setupTableViewConfigure()
        setupViewConstreints()
    }
    
    private func setupTableViewConfigure(){
        tableVeiw.dataSource = self
        tableVeiw.delegate = self
        tableVeiw.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }
    
    
    func setupViewConstreints(){
        view.addSubview(tableVeiw)
        tableVeiw.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension GetRequestPage: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as?  CustomTableViewCell
        
        let value = data[indexPath.row]
        cell?.configure(with: value)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GetRequestFullPage()
        vc.item = data [indexPath.row]
        
    }
}

