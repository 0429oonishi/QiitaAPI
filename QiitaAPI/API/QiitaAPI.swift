//
//  QiitaAPI.swift
//  QiitaAPI
//
//  Created by 大西玲音 on 2021/03/23.
//

import Foundation

typealias ResultHandler<T> = (Result<T, Error>) -> Void

class QiitaAPI {

    static let shared = QiitaAPI()
    private init() { }
        
    func fetchQiitaAPI(page: Int, handler: @escaping ResultHandler<[Qiita]>) {
        guard let url = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=\(page)") else {
            handler(.failure(NetworkError.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                handler(.failure(error))
            }
            guard let data = data else {
                handler(.failure(NetworkError.unknown))
                return
            }
            do {
                let qiitas = try JSONDecoder().decode([Qiita].self, from: data)
                handler(.success(qiitas))
            } catch {
                handler(.failure(NetworkError.invalidResponse))
            }
        }
        task.resume()
    }
    
}
