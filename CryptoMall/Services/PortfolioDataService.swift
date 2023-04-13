//
//  PortfolioDataService.swift
//  CryptoMall
//
//  Created by TTGMOTSF on 11/04/2023.
//

import Foundation
import CoreData
import SwiftUI


class PortfolioDataService {

    private let container: NSPersistentContainer
    private let continerName = ""
    private let entityName = "Portfolio"
    
    @Published var savedEntites: [Portfolio] = []
    
    init() {
        container = NSPersistentContainer(name: continerName)
        container.loadPersistentStores {(_ , error ) in
            if let error = error {
                print("Error loading CoreData \(error)")
            }
            self.getPortFolio()
        }
    }
    
    //MARK: - PUBLIC
    
    func updatePortfolio(crypto: CryptoModel, amount: Double) {
       
        //Check weather or not a crypto is in portfolio
        if let entity = savedEntites.first(where: { (savedEntity) in
            return savedEntity.cryptoID == crypto.id
        }) {
            if amount > 0 {
                update(entity: entity, amount: amount)
            }else{
                remove(entity: entity)
            }
        }else{
            addPortolio(crypto: crypto, amount: amount)
        }
    }
    
    //MARK: - PRIVATE
    
    //MARK - Fetching Portfolio Data
    
    private func getPortFolio () {
        let request = NSFetchRequest<Portfolio>(entityName: entityName)
        do{
           savedEntites = try container.viewContext.fetch(request)
        }catch let error{
            print("Error fetching portfolio entities \(error)")
        }
    }
    
    //MARK - Adding Portfolio Data
    
    private func addPortolio(crypto: CryptoModel, amount: Double) {
        let entity = Portfolio(context: container.viewContext)
        entity.cryptoID = crypto.id
        entity.amount = amount
        applyChanges()
    }
    
    private func update(entity:Portfolio, amount:Double){
        entity.amount = amount
        applyChanges()
    }
    
    //Saving Portfolio data
    
    private func savePortfolio () {
        do{
            try container.viewContext.save()
        }catch let error {
            print("Error saving to Core Data: \(error)")
        }
    }
    
    private func applyChanges () {
        savePortfolio()
        getPortFolio()
    }
    
    //Remove item from Portfolio
    
    private func remove(entity: Portfolio) {
        container.viewContext.delete(entity)
        applyChanges()
    }
    
}
