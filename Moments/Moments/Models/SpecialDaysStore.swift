//
//  SpecialDaysStore.swift
//  Moments
//
//  Created by Yang Jianqi on 2022/4/6.
//

import Foundation
import SwiftUI

class SpecialDayStore: ObservableObject {
    @Published var sps: [SpecialDays] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("specialdays.data")
    }
    
    static func load() async throws -> [SpecialDays] {
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
    
    static func load(completion: @escaping (Result<[SpecialDays], Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let sps = try JSONDecoder().decode([SpecialDays].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(sps))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    @discardableResult
    static func save(sps: [SpecialDays]) async throws -> Int {
        try await withCheckedThrowingContinuation { continuation in
            save(sps: sps) { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .success(let spsSaved):
                    continuation.resume(returning: spsSaved)
                }
            }
        }
    }
    
    static func save(sps: [SpecialDays], completion: @escaping (Result<Int, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(sps)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(sps.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
