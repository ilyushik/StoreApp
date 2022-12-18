//
//  StoreAppApp.swift
//  StoreApp
//
//  Created by  illia on 18/12/2022.
//

import SwiftUI

@main
struct StoreAppApp: App {
    
    @StateObject private var storeModel = StoreModel()
    
    var body: some Scene {
        WindowGroup {
            CategoryListView()
                .environmentObject(storeModel)
        }
    }
}
