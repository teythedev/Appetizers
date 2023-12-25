//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 23.12.2023.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString,UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizersURL = baseURL + "appetizers"
    
    private init(){}
    
    
    func getAppetizers() async -> Result<[Appetizer], APError>  {
        guard let url = URL(string: appetizersURL) else { return .failure(APError.invalidURL) }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return .failure(.invalidResponse)
            }
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                let appetizers = decodedResponse.request
                return .success(appetizers)
            } catch {
                return .failure(.invalidData)
            }
        } catch {
            return .failure(.unableToComplete)
        }
        
    }
    
    func downloadImage(fromUrlString urlString: String) async -> UIImage? {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            return image
        }
        
        guard let url = URL(string: urlString) else {return nil}
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                cache.setObject(image, forKey: cacheKey)
                return image
            }
            return nil
        }catch {
            return nil
        }
    }
}
