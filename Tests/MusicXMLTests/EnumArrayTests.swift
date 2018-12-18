//
//  EnumArrayTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/18/18.
//

import XCTest
import XMLCoder

class EnumArrayTests: XCTestCase {

    func testEnumArray() {
        enum AB: Decodable {
            enum CodingKeys: String, CodingKey { case a, b }
            struct A: Decodable { let value: Int }
            struct B: Decodable { let value: String }
            case a(A)
            case b(B)
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                do {
                    self = .a(try container.decode(A.self, forKey: .a))
                } catch {
                    self = .b(try container.decode(B.self, forKey: .b))
                }
            }
        }
        let xml = """
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <container>
            <a value="42"></a>
            <b value="forty-two"></b>
        </container>
        """
        let decoder = XMLDecoder()
        do {
            let abs: [AB] = try decoder.decode([AB].self, from: xml.data(using: .utf8)!)
            dump(abs)
        } catch {
            print(error)
        }
    }
}
