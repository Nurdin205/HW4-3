//
//  APIManager.swift
//  HW4-3
//
//  Created by cpu on 15/4/23.
//

import Foundation

class APIManager {
    
    static let shared = APIManager ()
    
    func getData(completion: @escaping (Result<DataModel, Error>) -> Void) {
        
        guard let url = URL (string: "https://dummyjson.com/products") else {return}
        
       
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data else {return}
            
            do {
                let newsData = try JSONDecoder().decode(DataModel.self, from: data)
                completion(.success(newsData))
                
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func postRequest( id: Int, title: String, completion: @escaping (Result<Int, Error>) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products/add") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let products = DataModel(products: [.init(id: id, title: title)], total: 1, skip: 1, limit: 1)
        request.httpBody = try? JSONEncoder().encode(products)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse else { return }
            
            if let error {
                completion(.failure(error))
                print(error)
            } else {
                completion(.success((response.statusCode)))
            }
        }
        task.resume()
    }
}
