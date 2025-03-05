import Foundation

public struct EngineeringQuantity: CustomStringConvertible, Sendable {
    let value: Double
    let lengthExponent: Int
    let forceExponent: Int
    
    init(_ value: Double, lengthExponent: Int = 0, forceExponent: Int = 0) {
        self.value = value
        self.lengthExponent = lengthExponent
        self.forceExponent = forceExponent
    }
    
    static func * (lhs: EngineeringQuantity, rhs: EngineeringQuantity) -> EngineeringQuantity {
        return EngineeringQuantity(
            lhs.value * rhs.value,
            lengthExponent: lhs.lengthExponent + rhs.lengthExponent,
            forceExponent: lhs.forceExponent + rhs.forceExponent
        )
    }
    
    static func * (lhs: Double, rhs: EngineeringQuantity) -> EngineeringQuantity {
        return EngineeringQuantity(
            lhs * rhs.value,
            lengthExponent: rhs.lengthExponent,
            forceExponent: rhs.forceExponent
        )
    }
    
    public var description: String {
        var components: [String] = []
        if forceExponent > 0 {
            components.append("lb" + (forceExponent > 1 ? "^\(forceExponent)" : ""))
        }
        if lengthExponent > 0 {
            components.append("ft" + (lengthExponent > 1 ? "^\(lengthExponent)" : ""))
        }
        return "\(value) " + components.joined(separator: "⋅")
    }
}

// Define base units
let feet = EngineeringQuantity(1.0, lengthExponent: 1)
let pounds = EngineeringQuantity(1.0, forceExponent: 1)
