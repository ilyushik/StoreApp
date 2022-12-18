//
//  StoreModel.swift
//  StoreApp
//
//  Created by  illia on 18/12/2022.
//

import Foundation

@MainActor
class StoreModel: ObservableObject {
    
    let client = StoreHTTPClient()
    @Published var categories: [Category] = []
    
    func fetchCategories() async throws {
       categories = try await client.getCategories(url: URL.allCategories)
    }
    
}
