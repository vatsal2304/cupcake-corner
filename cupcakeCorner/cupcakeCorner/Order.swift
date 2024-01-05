//
//  Order.swift
//  cupcakeCorner
//
//  Created by Funnmedia's Mac on 25/12/23.
//

import Foundation

struct Order: Codable {
    
    static let types = ["Vanilla", "Rainbow", "Chocolate", "Strawberry"]
    
    var type = 0
    var quantity = 3
    
    var specialRequest = false {
        didSet{
            if specialRequest == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.contains(" ") || zip.isEmpty{
            return false
        }
        return true
    }
    var cost: Decimal {
        var cost = Decimal(quantity) * 2
        
        cost += Decimal(type) / 2
        
//        1 dollar/- for extra frosting
        if extraFrosting{
            cost += Decimal(quantity)
        }
        
//        50 cents/- for sprinkles
        if addSprinkles{
            cost += Decimal(quantity) / 2
        }
        
        return cost
    }
}
