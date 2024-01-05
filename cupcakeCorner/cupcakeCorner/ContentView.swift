//
//  ContentView.swift
//  cupcakeCorner
//
//  Created by Funnmedia's Mac on 25/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    var body: some View {
        NavigationStack{
            Form{
                Section("select your cake type"){
                    Picker("select your cake type", selection: $order.type){
                        ForEach(Order.types.indices, id: \.self ){
                            Text(Order.types[$0])
                        }
                    }
//                    .pickerStyle(.segmented)
                    
                    Stepper("Quantity: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                Section{
                    Toggle("Any Special Requests?", isOn: $order.specialRequest.animation())
                    
                    if order.specialRequest{
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles.animation())
                        Toggle("Add extra Frosting", isOn: $order.extraFrosting.animation())
                    }
                }
            
            }
            .navigationTitle("Cupcake Corner")
            
            Section{
                NavigationLink("select Address"){
                    AddressView(order: $order)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
