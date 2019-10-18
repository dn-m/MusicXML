//
//  StabatMaterTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/9/19.
//

import XCTest
import MusicXML
import XMLCoder

class StabatMaterTests: XCTestCase {

    func testWordsDirection() throws {
        let xml = """
        <direction placement="above">
            <direction-type>
                <words font-weight="bold">Largo</words>
            </direction-type>
        </direction>
        """
        let decoded = try MusicXMLDecoder().decode(Direction.self, from: xml.data(using: .utf8)!)
        let expected = Direction(
            [.words([FormattedText("Largo", printStyle: PrintStyle(font: Font(weight: .bold)))])],
            placement: .above
        )
        XCTAssertEqual(decoded, expected)
    }

    func testWordsDirectionType() throws {
        let xml = """
        <direction-type>
            <words font-weight="bold">Largo</words>
        </direction-type>
        """
        let decoded = try MusicXMLDecoder().decode(DirectionType.self, from: xml.data(using: .utf8)!)
        let expected = DirectionType.words(
            [FormattedText("Largo", printStyle: PrintStyle(font: Font(weight: .bold)))]
        )
        XCTAssertEqual(decoded, expected)
    }
    
    func testWordsMultipleInDirectionType() throws {
        let xml = """
        <direction-type>
            <words font-weight="bold">Largo</words>
            <words font-weight="bold">Largo</words>
        </direction-type>
        """
        let decoded = try MusicXMLDecoder().decode(DirectionType.self, from: xml.data(using: .utf8)!)
        let expected = DirectionType.words(
            [
                FormattedText("Largo", printStyle: PrintStyle(font: Font(weight: .bold))),
                FormattedText("Largo", printStyle: PrintStyle(font: Font(weight: .bold)))
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDynamicsDirection() throws {
        let xml = """
        <direction placement="below">
            <direction-type>
                <dynamics>
                    <fp/>
                </dynamics>
            </direction-type>
            <offset>3</offset>
        </direction>
        """
        let decoded = try MusicXMLDecoder().decode(Direction.self, from: xml.data(using: .utf8)!)
        let expected = Direction([.dynamics([Dynamics([.fp])])],
            placement: .below,
            offset: Offset(3)
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDynamicsDirectionType() throws {
        let xml = """
        <direction-type>
            <dynamics>
                <fp/>
            </dynamics>
        </direction-type>
        """
        let decoded = try MusicXMLDecoder().decode(DirectionType.self, from: xml.data(using: .utf8)!)
        let expected = DirectionType.dynamics([Dynamics([.fp])])
        XCTAssertEqual(decoded, expected)
    }
    
    func testDynamicsMultipleInDirectionType() throws {
        let xml = """
        <direction-type>
            <dynamics>
                <fp/>
            </dynamics>
            <dynamics>
                <fp/>
            </dynamics>
        </direction-type>
        """
        let decoded = try MusicXMLDecoder().decode(DirectionType.self, from: xml.data(using: .utf8)!)
        let expected = DirectionType.dynamics([Dynamics([.fp]), Dynamics([.fp])])
        XCTAssertEqual(decoded, expected)
    }

    func testDynamics() throws {
        let xml = """
        <dynamics>
            <fp/>
        </dynamics>
        """
        let decoded = try MusicXMLDecoder().decode(Dynamics.self, from: xml.data(using: .utf8)!)
        let expected = Dynamics([.fp])
        XCTAssertEqual(decoded, expected)
    }
}
