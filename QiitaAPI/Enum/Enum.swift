//
//  Enum.swift
//  QiitaAPI
//
//  Created by 大西玲音 on 2021/03/23.
//

enum NetworkError: Error, CustomStringConvertible {
    case unknown
    case invalidResponse
    case invalidURL
    var description: String {
        switch self {
        case .unknown: return "不明なエラーです"
        case .invalidResponse: return "不正なレスポンスです"
        case .invalidURL: return "不正なURLです"
        }
    }
}
