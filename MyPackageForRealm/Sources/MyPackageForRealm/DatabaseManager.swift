
import Foundation
import RealmSwift

open class DatabaseManager {
    
    public let realm: Realm!
    
    public init(injectedRealm: Realm? = nil) {
        guard let injectedRealm = injectedRealm else {
            do {
                self.realm = try Realm()
            } catch {
                // If you're here, with "Provided schema version 0 is less than last set version",
                // it's probably because you need to call `configureMigration...` sooner on app delegate
                assertionFailure("Error initializing Realm: \(error)")
                
                self.realm = nil
            }
            return
        }
        
        self.realm = injectedRealm
        return
    }
    
    public init(config: Realm.Configuration) throws {
        realm = try Realm(configuration: config)
    }
}
