//
//  NetManager.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 08/04/2023.
//

import Foundation
import Combine


class NetManager {
    
    enum NetworkingError: LocalizedError {
        case PoorURLResponse
        case Unknown
        
        var errorDescription: String? {
            switch self {
            case .PoorURLResponse: return "[♨️] Poor URL Response..."
            case .Unknown: return "[⚠️] An unknown error occcured"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
         return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse (output:  URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.PoorURLResponse
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
