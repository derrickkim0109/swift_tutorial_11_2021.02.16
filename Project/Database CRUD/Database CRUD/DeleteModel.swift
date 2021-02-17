//
//  DeleteModel.swift
//  Database CRUD
//
//  Created by Derrick on 2021/02/16.
//

import Foundation

class DeleteModel: NSObject {
    
    var urlPath = "http://127.0.0.1:8080/iOS/studentDelete_ios.jsp"
    
    // AddView Controller에서 값받는 것들
    func deleteItems(code: String) -> Bool {
        var result: Bool = true
        
        // ?code=11&name='name'
        let urlAdd = "?code=\(code)"
        urlPath = urlPath + urlAdd
        
        // 한글 url Encoding
        // EN 써있으면 안바뀐다.
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        // 실질적인 url
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to insert data")
                result = false
            }
            else{
                print("Data is inserted")
                result = true
            }
        }
        // task 실행
        task.resume()
        return result
    }
}
