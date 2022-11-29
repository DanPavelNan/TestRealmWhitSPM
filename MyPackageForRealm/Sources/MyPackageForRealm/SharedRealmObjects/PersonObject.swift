
import Foundation
import RealmSwift

public class PersonObject: Object {
    @Persisted(primaryKey: true) public var id: String = UUID().uuidString
    @Persisted public var name: String = ""
    @Persisted public var age: Int = 0
    @Persisted public var address: String = ""
    @Persisted public var petsOwned = List<PetObject>()
    
    public required convenience init(
        id: String,
        name: String,
        age: Int,
        address: String) {
            self.init()
            
            self.id = id
            self.name = name
            self.age = age
            self.address = address
            self.petsOwned.append(objectsIn: [PetObject(name: "Default")])
        }
    
    public func addToPetsList(_ pet: PetObject) {
        self.petsOwned.append(objectsIn: [pet])
    }
}
