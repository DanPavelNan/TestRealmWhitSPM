
import Foundation
import RealmSwift

public class PetObject: EmbeddedObject {
    @Persisted public var name: String
    @Persisted public var age: Date?
    
    convenience public init(name: String) {
        self.init()
        self.name = name
    }
}
