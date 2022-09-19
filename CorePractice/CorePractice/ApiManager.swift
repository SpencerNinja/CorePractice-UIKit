//
//  ApiManager.swift
//  CorePractice
//
//  Created by Spencer Hurd on 9/18/22.
//

import Foundation

class ApiManager {
    let headers = [
        "X-RapidAPI-Key": "fda9b09cfcmsh7e28c60f64a9b90p1b4f0bjsn7d27195ce375",
        "X-RapidAPI-Host": "ajayakv-rest-countries-v1.p.rapidapi.com"
    ]

    let request = NSMutableURLRequest(url: NSURL(string: "https://ajayakv-rest-countries-v1.p.rapidapi.com/rest/v1/all")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
        }
    })

    dataTask.resume()
}


//class ApiManager {
//
//    static let shared = ApiManager()
//    private init() {}
//
//    let url = "https://last-airbender-api.herokuapp.com/api/v1/characters"
//
//    func fetchCharacter<T: Decodable>(completionFD: @escaping ([T]) -> Void ) {
//        guard let url = URL(string: url) else {
//            return
//        }
//        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
//            guard let data = data, error == nil else {
//                print("No data received")
//                return
//            }
//            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                print("HTTP status code error")
//                return
//            }
//            do {
//                let decodedData = try JSONDecoder().decode([T].self, from: data)
//                completionFD(decodedData)
//            } catch {
//                print("Error decoding Avatar character data from JSON")
//            }
//        })
//        task.resume()
//    }
//
//}
//
//// Create a network function to call on the UIImageView located in the CollectionViewCell
//extension UIImageView {
//    func fetchImage(for urlString: String) {
//        guard let url = URL(string: urlString) else {
//            return
//        }
//        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
//            if let data = data {
//                DispatchQueue.main.async{
//                    self.image = UIImage(data: data)
//                }
//            }
//        }).resume()
//    }
//}
