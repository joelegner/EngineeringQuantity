import Foundation

public struct EngineeringQuantity: CustomStringConvertible, Sendable {
    public let value: Double
    public let lengthExponent: Int
    public let forceExponent: Int
    
    // Make the initializer public
    public init(_ value: Double, lengthExponent: Int = 0, forceExponent: Int = 0) {
        self.value = value
        self.lengthExponent = lengthExponent
        self.forceExponent = forceExponent
    }
    
    // Multiply two EngineeringQuantity instances
    static public func * (lhs: EngineeringQuantity, rhs: EngineeringQuantity) -> EngineeringQuantity {
        return EngineeringQuantity(
            lhs.value * rhs.value,
            lengthExponent: lhs.lengthExponent + rhs.lengthExponent,
            forceExponent: lhs.forceExponent + rhs.forceExponent
        )
    }
    
    // Multiply an EngineeringQuantity by a Double
    static public func * (lhs: Double, rhs: EngineeringQuantity) -> EngineeringQuantity {
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

// Define base units, ensuring they are globally accessible
public let feet = EngineeringQuantity(1.0, lengthExponent: 1)
public let pounds = EngineeringQuantity(1.0, forceExponent: 1)
