////
////  ViewController.swift
////  HW4-3
////
////  Created by cpu on 15/4/23.
////
//
//import UIKit
//import SnapKit
//import Kingfisher
//
//class ViewController: UIViewController {
//
//
//
//    private lazy var tableView: UITableView = {   //1
//        let view = UITableView()
//        return view
//    }()
//
//    private var timeData: [Product] = []
//
//    override func viewDidLoad() {    // здесь вызываем созданные функции, путем добавления.
//        super.viewDidLoad()
//        view.backgroundColor = .white
//
//        title = "Some news"
//
//        setupTableView()
//        setuppConstraints()
//        tableView.dataSource = self
//        tableView.delegate = self
//
//    }
//    func setupTableView(){
//        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.idCell)
//    }
//    func setuppConstraints() {
//        view.addSubview(tableView)
//        tableView.snp.makeConstraints { make in
//            make.edges.equalToSuperview() //отоброжение на весь экран.
//        }
//
//
//    APIManager.shared.getData { [weak self] result in
//        switch result {
//        case .success(let data):
//            DispatchQueue.main.async {
//                guard let `self` else {return}
//                self.timeData = data.products ?? []
//                self.tableView.reloadData()
//            }
//        case .failure(let error):
//            print(error.localizedDescription)
//        }
//    }
//}
//}
//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        timeData.count
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 130
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.idCell) as! CustomTableViewCell
//
//        let value = timeData[indexPath.row]
//
//        cell.configure(with: value)
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = SecondPageViewController()
//        vc.item = timeData[indexPath.row]
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//}
