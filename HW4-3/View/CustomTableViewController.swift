//
//  CustomTableViewController.swift
//  HW4-3
//
//  Created by cpu on 15/4/23.
//
import Foundation
import UIKit
import SnapKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {
    
    static let idCell = "CustomTableViewCell"
    
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 13)
        title.numberOfLines = 2
        title.textAlignment = .justified
        return title
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = .boldSystemFont(ofSize: 11)
        descriptionLabel.numberOfLines = 5
        descriptionLabel.textAlignment = .justified
        return descriptionLabel
    }()
    
    private lazy var imageOfNews: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView ()    // создали чертачку
        view.backgroundColor = .black
        return view
    }()
    
    
    override func layoutSubviews() {
        setuppConstraints()
    }
    
    private func setuppConstraints(){
        
        self.addSubview(imageOfNews)
        imageOfNews.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview().inset(8)
            make.height.width.equalTo(140)
        }
        
        imageOfNews.layer.cornerRadius = imageOfNews.frame.height / 2.5
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(imageOfNews.snp.left).offset(-20)
        }
        
        self.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(imageOfNews.snp.left).offset(-20)
        }
        
        self.addSubview(dividerView)
        dividerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-2)
            make.horizontalEdges.equalToSuperview().inset(5)
            make.height.equalTo(0.3)
        }
    }
    func configure(with: Product){
        self.titleLabel.text = with.title
        self.descriptionLabel.text = with.description
        self.imageOfNews.kf.setImage(with: URL(string: with.thumbnail!))
    }
//    private func handleImage(url: String) {
//        let url = URL(string: url)
//        self.imageOfNews.kf.setImage(with:url)
//    }
}
  



























