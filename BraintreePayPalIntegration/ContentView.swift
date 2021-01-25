//
//  ContentView.swift
//  BraintreePayPalIntegration
//
//  Created by Forte Apps on 22/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PayPalHandler().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
