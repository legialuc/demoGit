//
//  APIManager.swift
//  ToDoApp
//
//  Created by Luc on 9/23/21.
//

import UIKit

protocol APIManagerDelegate {
    func didUpdateView(_ apiManager: APIManager, api: APIData)
}

class APIManager {
    var arrData = [APIData]()
    var delegate: APIManagerDelegate?
    func getData() {
    
          let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
          URLSession.shared.dataTask(with: url!) { (data, response, error) in
              do{if error == nil{
                  self.arrData = try JSONDecoder().decode([APIData].self, from: data!)
                  
                  for api in self.arrData{
                    self.delegate?.didUpdateView(self, api: api)
                     
                  }
                  }
              
              }catch{
                  print("Error in get json data")
              }
          }.resume()
          }
}
