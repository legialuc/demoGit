//
//  DetaiViewController.swift
//  ToDoApp
//
//  Created by Luc on 9/21/21.
//

import UIKit

class DetailViewController: UIViewController {
    private let newView:UIView = {
        let newView = UIView()
        newView.backgroundColor = .white
        return newView
    }()
    let idLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.clipsToBounds = true
        label.textColor = .black
        return label
    }()
    let titleLabel:UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.clipsToBounds = true
        return label
    }()
    let bodyLabel:UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.clipsToBounds = true
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(newView)
        newView.addSubview(idLabel)
        newView.addSubview(titleLabel)
        newView.addSubview(bodyLabel)
        setUpAutoLayout()
    }
    private func setUpAutoLayout(){
        newView.snp.makeConstraints{ (make) in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
        }
        idLabel.snp.makeConstraints{ (make) in
            make.center.equalTo(newView.snp.center)
            make.height.equalTo(20)
            make.width.equalTo(300)
        }
        titleLabel.snp.makeConstraints{ (make) in
            make.centerX.equalTo(newView.snp.centerX)
            make.top.equalTo(idLabel.snp.bottom) .offset(30)
            make.height.equalTo(30)
            make.width.equalTo(300)
        }
        bodyLabel.snp.makeConstraints{ (make) in
            make.centerX.equalTo(newView.snp.centerX)
            make.top.equalTo(titleLabel.snp.bottom) .offset(30)
            make.height.equalTo(20)
            make.width.equalTo(300)
        }
    }
    

}
