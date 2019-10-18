//
//  BackupTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

import XCTest
import XMLCoder
import MusicXML

class BackupTests: XCTestCase {

    func testBackup() throws {
        let xml = """
        <backup>
          <duration>4</duration>
        </backup>
        """
        let decoded = try MusicXMLDecoder().decode(Backup.self, from: xml)
        let expected = Backup(duration: 4)
        XCTAssertEqual(decoded, expected)
    }
}
