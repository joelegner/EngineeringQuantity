import Testing
@testable import EngineeringQuantity


struct EngineeringQuantityTests {
    let length: EngineeringQuantity = 4.0 * feet
    let force: EngineeringQuantity = 10.0 * pounds
    
    @Test func lengthTest() async throws {
        #expect(length.value == 4.0)
        #expect(length.lengthExponent == 1)
        #expect(length.forceExponent == 0)
        #expect(length.description == "4.0 ft")
    }
     
    @Test func areaTest() async throws {
        let area: EngineeringQuantity = length * length
        #expect(area.value == 16.0)
        #expect(area.lengthExponent == 2)
        #expect(area.forceExponent == 0)
        #expect(area.description == "16.0 ft^2")
    }

    @Test func forceTest() async throws {
        #expect(force.value == 10.0)
        #expect(force.lengthExponent == 0)
        #expect(force.forceExponent == 1)
        #expect(force.description == "10.0 lb")
    }

    @Test func momentText() async throws {
        let moment: EngineeringQuantity = force * length
        #expect(moment.value == 40.0)
        #expect(moment.lengthExponent == 1)
        #expect(moment.forceExponent == 1)
        #expect(moment.description == "40.0 lb⋅ft")
    }
}
