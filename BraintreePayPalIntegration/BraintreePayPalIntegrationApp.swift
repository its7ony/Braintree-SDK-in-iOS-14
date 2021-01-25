//
//  BraintreePayPalIntegrationApp.swift
//  BraintreePayPalIntegration
//
//  Created by Forte Apps on 22/01/21.
//

import SwiftUI
import Braintree

@main
struct BraintreePayPalIntegrationApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}




class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        BTAppSwitch.setReturnURLScheme("mx.antonio.labra.BraintreePayPalIntegration.payments")
        return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.scheme?.localizedCaseInsensitiveCompare("mx.antonio.labra.BraintreePayPalIntegration.payments") == .orderedSame {
            return BTAppSwitch.handleOpen(url, options: options)
        }
        return false
    }
}
