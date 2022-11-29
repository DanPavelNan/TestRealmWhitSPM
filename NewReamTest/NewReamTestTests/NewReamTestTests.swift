
import XCTest
import MyPackageForRealm
import RealmSwift
@testable import NewReamTest

final class NewReamTestTests: XCTestCase {
    
    override func setUpWithError() throws {
        _ =  try DatabaseManager(config: Realm.Configuration.init(inMemoryIdentifier: self.name))
    }
    
    override func tearDownWithError() throws { }
    
    func testExample() throws {
        // Custom initializer of a realm object
        // this will add a *PetObjec* ( default) to the petsOwned list
        let person = PersonObject(id: UUID().uuidString, name: "Person Test", age: 20, address: "Montreal")
        
        // Add an element to *petsOwned* using a function inside the model
        let petA: PetObject = PetObject(name: "Pet A")
        petA.age = Date.init(timeInterval: -11111, since: .now)
        person.addToPetsList(petA)
        
        // Add an element to *petsOwned* using a function defined in an extension of the model inside the main app
        let petB: PetObject = PetObject(name: "Pet B")
        petB.age = Date.init(timeInterval: -21111, since: .now)
        person.localAddToPetsList(petB)
        
        // Add an element to *petsOwned* using a function defined in an extension of the model inside the test file
        let petC: PetObject = PetObject(name: "Pet C")
        petC.age = Date.init(timeInterval: -31111, since: .now)
        person.testlocalAddToTestList(petC)
        
        // Direclty add the the *petsOwned* list
        person.petsOwned.append(PetObject(name: "Pet D"))
        
        print("List: \(person.petsOwned)")
        
        XCTAssertEqual(person.petsOwned.count, 5)
    }
}

fileprivate extension PersonObject {
    func testlocalAddToTestList(_ pet: PetObject) {
        petsOwned.append(pet)
    }
}
