//
//  CryptoImageService.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 08/04/2023.
//

import Foundation
import SwiftUI
import Combine


class CryptoImageService {
    
    @Published var image: UIImage? = nil
    var imageSubscription: AnyCancellable?
    private let crypto: CryptoModel
    private let fileManager = DataStorage.instance
    private let storageName = "crypto_images"
    private let imageName: String
    
    init(crypto: CryptoModel) {
        self.crypto = crypto
        self.imageName = crypto.id
        getCoinImage()
    }
    
    //Getting saved images from created folder
    
    private func getCoinImage () {
        if let savedImage = fileManager.getImage(imageName: imageName, storageName: storageName) {
            image = savedImage
            print("Retreiving images from folders")
            
            //if there is no image, we download them
        }else {
            downloadCryptoImage()
            print("downloading images")
        }
    }
    
    private func downloadCryptoImage() {
        
        guard let url = URL(string: crypto.image)
        else {
            return
        }
        imageSubscription = NetManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetManager.handleCompletion, receiveValue: {[weak self] (returnedImage) in
                guard let self = self , let downloadedImage = returnedImage else {return}
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                //When successfyully downloaded, we save them to be able to trigger the getCoinImage function to check for saved images
                
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, storageName: self.storageName)
            })
    }
}
