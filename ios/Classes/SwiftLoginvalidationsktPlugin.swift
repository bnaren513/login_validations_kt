import Flutter
import UIKit

public class SwiftLoginvalidationsktPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "loginvalidationskt", binaryMessenger: registrar.messenger())
    let instance = SwiftLoginvalidationsktPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    //if(call.method.elementsEqual("platformVersiondata"))
    if (call.method == "getPlatformVersion") {
           result("iOS " + UIDevice.current.systemVersion)
       }
    else if (call.method == "getPlatformVersiondata")
    {
      result("iOS platform")

    }
    else if(call.method.elementsEqual("emailValidation")){
       let arguments = call.arguments as? NSDictionary
        let msg1 = arguments!["email"] as? String
        let valuedata = isValidEmail(msg1 ?? "")
    // UIAlertView(title:"", message: msg1 , delegate: nil, cancelButtonTitle: "OK").show()
      result("Email Validation " + String(valuedata))

    }
    else if(call.method.elementsEqual("passwordValidation")){
       let arguments = call.arguments as? NSDictionary
        let msg2 = arguments!["password"] as? String
        let valuedata1 = isValidPassword(msg2 ?? "")
      result("Password Validation " + String(valuedata1))

    }
   // result("iOS ")
  }
  public func isValidEmail(_ email: String) -> Bool {
      let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

      let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
      return emailPred.evaluate(with: email)
  }
  public func isValidPassword(_ password:String) -> Bool {
    let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
    return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
}
}
