
import Foundation
import MyPackageForRealm

public extension PersonObject {
    func localAddToPetsList(_ pet: PetObject) {
        petsOwned.append(objectsIn: [pet])
    }
}
