//
//  AuthwithOTPApp.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 04/03/2023.
//

import SwiftUI
import Firebase

@main
struct AuthwithOTPApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//initializing Firebase ...
class AppDelegate: NSObject,UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey : Any]? = nil)-> Bool{
        FirebaseApp.configure()
        return true
    }
    
    //Needed for Firebase phone Auth
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any] , fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
         
    }
}
