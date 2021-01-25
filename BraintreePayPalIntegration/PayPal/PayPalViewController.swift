//
//  PayPalViewController.swift
//  BraintreePayPalIntegration
//
//  Created by Forte Apps on 22/01/21.
//

import Foundation
import BraintreeDropIn
import Braintree

class PayPalViewController  : UIViewController, BTViewControllerPresentingDelegate, BTAppSwitchDelegate{
    
    var braintreeClient: BTAPIClient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        startCheckout()

    }
    

    func startCheckout() {
        braintreeClient = BTAPIClient(authorization: "sandbox_key_here")!
        let payPalDriver = BTPayPalDriver(apiClient: braintreeClient!)
        payPalDriver.viewControllerPresentingDelegate = self
        payPalDriver.appSwitchDelegate = self

        let request = BTPayPalRequest(amount: "0.99")
           request.currencyCode = "MX"
        
        /* El uso de una dirección customizada en el Sandbox de Braintree no se puede probar, dicho código
         está comentado
        
        
        let postalAddress: BTPostalAddress = BTPostalAddress()
        postalAddress.streetAddress = "Street Example"
        postalAddress.countryCodeAlpha2 = "NL"
        postalAddress.postalCode = "2585 GJ"
        postalAddress.locality = "Den Haag"
        
        
        request.shippingAddressOverride = postalAddress
         */
        
        request.billingAgreementDescription = "Your agremeent description"//Displayed in customer's PayPal account
        
        payPalDriver.requestBillingAgreement(request) { (tokenizedPayPalAccount, error) -> Void in
            if let tokenizedPayPalAccount = tokenizedPayPalAccount {
                print("Got a nonce: \(tokenizedPayPalAccount.nonce)")
                // Send payment method nonce to your server to create a transaction
            } else if error != nil {
                // Handle error here...
            } else {
                // Buyer canceled payment approval
            }
        }
    }

    // MARK: - BTViewControllerPresentingDelegate

    func paymentDriver(_ driver: Any, requestsDismissalOf viewController: UIViewController) {
        dismiss(animated: true, completion: nil)
    }

    func paymentDriver(_ driver: Any, requestsPresentationOf viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }

    
    // MARK: - BTAppSwitchDelegate

    func appSwitcherWillPerformAppSwitch(_ appSwitcher: Any) {

    }

    func appSwitcher(_ appSwitcher: Any, didPerformSwitchTo target: BTAppSwitchTarget) {

    }

    func appSwitcherWillProcessPaymentInfo(_ appSwitcher: Any) {

    }
    
    
    
}
