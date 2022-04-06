//
//  MomentStore.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/1.
//

import Foundation
import SwiftUI

class MomentStore: ObservableObject {
    @Published var moments: [Moment] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("moments.data")
    }
    
    static func load() async throws -> [Moment] {
        try await withCheckedThrowingContinuation { continuation in
            load { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .success(let storys):
                    continuation.resume(returning: storys)
                }
            }
        }
    }
    
    static func load(completion: @escaping (Result<[Moment], Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let storys = try JSONDecoder().decode([Moment].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(storys))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    @discardableResult
    static func save(storys: [Moment]) async throws -> Int {
        try await withCheckedThrowingContinuation { continuation in
            save(storys: storys) { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .success(let storysSaved):
                    continuation.resume(returning: storysSaved)
                }
            }
        }
    }
    
    static func save(storys: [Moment], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(storys)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(storys.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
