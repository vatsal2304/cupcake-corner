//
//  adressView.swift
//  cupcakeCorner
//
//  Created by Funnmedia's Mac on 25/12/23.
//

import SwiftUI

struct AddressView: View {
    @Binding var order: Order
    var body: some View {
        Form{
            Section{
                TextField("Enter your name", text: $order.name)
                TextField("StreetAddress", text: $order.streetAddress)
                TextField("Zipcode", text: $order.zip)
                TextField("City", text: $order.city)
            }
            Section{
                NavigationLink("Check-out"){
                    checkOutView(order: order)
                }
                .disabled(order.hasValidAddress == false)
            }
        }
    }
}

//struct AddressView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddressView(order: Order)
//    }
//}
