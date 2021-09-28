//
//  ViewController.swift
//  ToDoApp
//
//  Created by Luc on 9/17/21.
//

import UIKit
import SnapKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrData = [APIData]()

    private let tableview:UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ToDo List"
        view.addSubview(tableview)
        setUpAutoLayout()
        tableview.register(APITableView.self, forCellReuseIdentifier: "cell")
        tableview.dataSource = self
        tableview.delegate = self
        getData()
  
        
        let saveButton = UIButton(type: .custom)
        saveButton.setTitle("Add", for: .normal)
        saveButton.setTitleColor(saveButton.tintColor, for: .normal)
        saveButton.addTarget(self, action: #selector(editAction), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: saveButton)
        }
    @objc func editAction() -> Void {
        let postVC = PostViewController()
        self.navigationController?.pushViewController(postVC, animated: true)
    }
    
    private func setUpAutoLayout(){

        tableview.snp.makeConstraints{ (make) in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    func getData() {
  
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{if error == nil{
                self.arrData = try JSONDecoder().decode([APIData].self, from: data!)
                
                for _ in self.arrData{
                    DispatchQueue.main.async {
                         self.tableview.reloadData()
                    }
                   
                }
                }
            
            }catch{
                print("Error in get json data")
            }
        }.resume()
        }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.arrData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:APITableView = tableView.dequeueReusableCell(withIdentifier: "cell") as! APITableView
        cell.nameLabel.text = "Title: \(arrData[indexPath.row].title)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.idLabel.text = "ID: \(arrData[indexPath.row].id)"
        detailVC.titleLabel.text = "Title: \(arrData[indexPath.row].title)"
        detailVC.bodyLabel.text = "Body: \(arrData[indexPath.row].body)"
        self.navigationController?.pushViewController(detailVC, animated: true)
    }


}


