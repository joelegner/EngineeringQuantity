//
//  EngineeringQuantityTests.swift
//  EngineeringQuantity
//
//  Created by Joe Legner on March 4, 2025.
//  Copyright © 2025 Joe Legner. All rights reserved.
//

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
    
    @Test func momentTest() async throws {
        let moment: EngineeringQuantity = force * length
        #expect(moment.value == 40.0)
        #expect(moment.lengthExponent == 1)
        #expect(moment.forceExponent == 1)
        #expect(moment.description == "40.0 lb⋅ft")
    }
    
    // New tests for multiplication of EngineeringQuantity with itself and scalar
    @Test func forceAndLengthMultiplicationTest() async throws {
        let result: EngineeringQuantity = force * length
        #expect(result.value == 40.0)
        #expect(result.lengthExponent == 1)
        #expect(result.forceExponent == 1)
        #expect(result.description == "40.0 lb⋅ft")
    }
    
    @Test func scalarMultiplicationTest() async throws {
        let scalarResult: EngineeringQuantity = 2.0 * length
        #expect(scalarResult.value == 8.0)
        #expect(scalarResult.lengthExponent == 1)
        #expect(scalarResult.forceExponent == 0)
        #expect(scalarResult.description == "8.0 ft")
    }
    
    @Test func multipleForcesTest() async throws {
        let multipleForces: EngineeringQuantity = 3.0 * force
        #expect(multipleForces.value == 30.0)
        #expect(multipleForces.lengthExponent == 0)
        #expect(multipleForces.forceExponent == 1)
        #expect(multipleForces.description == "30.0 lb")
    }
    
    @Test func combinedAreaTest() async throws {
        let combinedArea: EngineeringQuantity = length * length * length
        #expect(combinedArea.value == 64.0)
        #expect(combinedArea.lengthExponent == 3)
        #expect(combinedArea.forceExponent == 0)
        #expect(combinedArea.description == "64.0 ft^3")
    }
}
