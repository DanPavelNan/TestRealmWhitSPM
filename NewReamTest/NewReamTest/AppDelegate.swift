
import UIKit
import MyPackageForRealm

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        doStuffs()

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    private func doStuffs() {
        let person = PersonObject(id: UUID().uuidString, name: "Person A", age: 22, address: "Montreal")
        let newPet: PetObject = PetObject(name: "Pet A")
        newPet.age = Date.init(timeInterval: -11111, since: .now)
        person.addToPetsList(newPet)
        
        person.petsOwned.append( PetObject(name: "Pet B"))
        
        print("AppDelegate person pets: \( person.petsOwned)")
    }
}

