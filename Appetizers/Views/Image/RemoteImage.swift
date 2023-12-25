//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Tugay Emre Yucedag on 23.12.2023.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published
    var image: Image? = nil
    
    @Published
    var isLoading: Bool = false
    
    func load(fromURLString urlString: String) async {
        isLoading = true
        guard let uiImage = await NetworkManager.shared.downloadImage(fromUrlString: urlString) else {
            isLoading = false
            return
        }
        isLoading = false
        image = Image(uiImage: uiImage)
    }
    
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image(.foodPlaceholder).resizable()
    }
}


struct AppetizerRemoteImage: View {
    @StateObject
    var imageLoader: ImageLoader = ImageLoader()
    
    let urlString: String
    
    var body: some View {
        ZStack{
            RemoteImage(image: imageLoader.image)
            if imageLoader.isLoading {
                LoadingView()
            }
        }
        .task {
            await imageLoader.load(fromURLString: urlString)
        }
        
    }
}

#Preview(body: {
    AppetizerRemoteImage(urlString: MockData.sampleAppetizer.imageURL)
})
