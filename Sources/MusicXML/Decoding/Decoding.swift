//
//  Decoding.swift
//  MusicXML
//
//  Created by James Bean on 12/17/18.
//

import Foundation
import XMLCoder

extension Score {
    public static let topLevelTagKey = "topLevelTagKey"

    public enum Error: Swift.Error {
        case invalidMusicXMLString(Swift.String)
    }

    /// Creates a `MusicXML` model from the given MusicXML-formatted `string`.
    public init(string: Swift.String) throws {
        guard let data = string.data(using: .utf8) else {
            throw Error.invalidMusicXMLString(string)
        }
        try self.init(data: data)
    }

    /// Creates a `MusicXML` model from the given MusicXML-formatted file at the given `url`.
    public init(url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    /// Creates a `MusicXML` model from the given MusicXML-formatted `data`.
    public init(data: Data) throws {
        let decoder = XMLDecoder(trimValueWhitespaces: false)

        if let topLevelTag = Score.probeTopLevelTag(data: data) {
            decoder.userInfo[CodingUserInfoKey(rawValue: Score.topLevelTagKey)!] = topLevelTag
        }

        self = try decoder.decode(Score.self, from: data)
    }

    // A data probe that reads 64 bytes each pass to try to find the top level tag within the MusicXML
    private static func probeTopLevelTag(data: Data) -> Score.CodingKeys? {
        let input = InputStream(data: data)
        input.open()

        var data = Data()
        let bufferSize = 64
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: bufferSize)

        defer {
            buffer.deallocate()
            input.close()
        }

        while input.hasBytesAvailable {
            let read = input.read(buffer, maxLength: bufferSize)
            if read == 0 {
                return nil
            }
            data.append(buffer, count: read)

            let docTypeProbe: String
            if let probed = String(data: data, encoding: .utf8) {
                docTypeProbe = probed
            } else if let probed = String(data: data, encoding: .utf16) {
                docTypeProbe = probed
            } else {
                return nil
            }

            if let tag = findTopLevelTag(pattern: #"<!DOCTYPE ((?:score-partwise|score-timewise))"#, in: docTypeProbe) {
                return tag
            } else if let tag = findTopLevelTag(pattern: #"<((?:score-partwise|score-timewise)) version="[\d.]+">"#, in: docTypeProbe) {
                return tag
            }
        }
        return nil
    }

    // Find top level tag provided with a pattern and a string, the pattern should contain exactly one capture group
    private static func findTopLevelTag(pattern: String, in string: String) -> Score.CodingKeys? {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let nsrange = NSRange(string.startIndex..<string.endIndex, in: string)
            if let match = regex.firstMatch(in: string, options: [], range: nsrange), match.numberOfRanges == 2, let captureRange = Range(match.range(at: 1), in: string), let key = Score.CodingKeys(rawValue: String(string[captureRange])) {
                return key
            }
            return nil
        } catch {
            return nil
        }
    }
}
