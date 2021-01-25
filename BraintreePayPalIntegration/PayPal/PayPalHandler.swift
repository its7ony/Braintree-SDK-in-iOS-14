//
//  PayPalHandler.swift
//  BraintreePayPalIntegration
//
//  Created by Forte Apps on 22/01/21.
//

import SwiftUI

struct PayPalHandler: UIViewControllerRepresentable {
    
    func makeUIViewController (context: UIViewControllerRepresentableContext<PayPalHandler>) -> UIViewController {
        let payPalMenuViewController = UIStoryboard(name: "PayPalDesign", bundle: nil).instantiateViewController(identifier: "PayPalDesign") as! PayPalViewController
        return payPalMenuViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<PayPalHandler>){
        
            print("updated view")
    }
}
