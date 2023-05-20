//
//  CoinImageViewModel.swift
//  CoinPrices-Task
//
//  Created by admin on 19/05/2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = true
    
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let imageName: String
    private let folderName = "coin_images"
    
    private var imageSubscription: AnyCancellable?



    var subscriptions = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
        } else {
            downloadCoinImage()
        }
    }
    
    private func downloadCoinImage() {
        self.isLoading = true
        let service = CoinsService(networkRequest: NativeRequestable(), environment: .development)
        service.getCoinImage(self.coin.image)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink { (completion) in
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                switch completion {
                case .failure(let error):
                    print("oops got an error \(error.localizedDescription)")
                case .finished:
                    print("nothing much to do here")
                }
            } receiveValue: { (downloadedImage) in
                self.image = downloadedImage
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)

                print("got my response here \(String(describing: downloadedImage))")
            }
            .store(in: &subscriptions)
    }
    
}

