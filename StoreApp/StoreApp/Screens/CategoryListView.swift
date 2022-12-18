//
//  CategoryListView.swift
//  StoreApp
//
//  Created by  illia on 18/12/2022.
//

import SwiftUI

struct CategoryListView: View {
    
    @EnvironmentObject private var storeModel: StoreModel
    @State var errorMessage = ""
    
    var body: some View {
        VStack {
            List(storeModel.categories, id: \.id) { category in
                HStack {
                    AsyncImage(url: category.image) { image in
                        image.resizable()
                            .frame(maxWidth: 100, maxHeight: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    } placeholder: {
                       ProgressView()
                    }
                    Text(category.name)
                }
            }.task {
                do {
                    try await storeModel.fetchCategories()
                } catch {
                    errorMessage = error.localizedDescription
                }
            }
            Text(errorMessage)
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
            .environmentObject(StoreModel())
    }
}
