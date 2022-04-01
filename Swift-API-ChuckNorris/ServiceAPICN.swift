//
//  ServiceAPICN.swift
//  Swift-API-ChuckNorris
//
//  Created by Luccas Santana Marinho on 01/04/22.
//

import Foundation

class ServiceAPICN {
    
    class func servicoApi(_ api: String, completion: @escaping (Api) -> Void) {
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    
                    guard let data = data else { return }
                    do {
                        let cep = try JSONDecoder().decode(Api.self, from: data)
                        completion(cep)
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    print("Status inválido do servidor, Status Code: \(response.statusCode)")
                }
            } else {
                print(error!.localizedDescription)
            }
        }.resume()
    }
    
}
