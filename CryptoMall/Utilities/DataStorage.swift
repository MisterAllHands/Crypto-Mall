//
//  DataStorage.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 08/04/2023.
//

import Foundation
import SwiftUI

class DataStorage {
    
    static let instance = DataStorage()
    private init () {}
    
    
    func saveImage(image: UIImage, imageName: String, storageName: String) {
        
        //Create storage
        createStorageIfNeeded(storagename: storageName)
        
        //Get path to an image
        guard
            let data = image.pngData(),
            let url = getURLForImage(imageName: imageName, storageName: storageName)
        else {return}
        
        //Save image to path
        do {
            try data.write(to: url)
        }catch let error {
            print("Error saving image:  \(error)")
        }
    }
    
    func getImage (imageName: String, storageName: String) -> UIImage? {
        guard
            let url = getURLForImage(imageName: imageName, storageName: storageName),
            FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path )
    }
    
    //Creating storage if there is not any to save images
    
    private func createStorageIfNeeded (storagename: String) {
        guard let url = getURLForStorage(name: storagename) else {return}
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            }catch let error {
                print("Error creating directory \(error). Storage name: \(storagename)")
            }
        }
    }
    
    private func getURLForStorage(name: String) -> URL?  {
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url.appendingPathComponent(name)
    }
    
    private func getURLForImage (imageName: String, storageName: String) -> URL? {
        guard let storageURL = getURLForStorage(name: storageName) else {
            return nil
        }
        return storageURL.appendingPathComponent(imageName + ".png")
    }
}
