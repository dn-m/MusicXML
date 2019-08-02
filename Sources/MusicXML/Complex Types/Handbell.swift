//
//  Handbell.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The handbell element represents notation for various techniques used in handbell and handchime
/// music.
public struct Handbell {
    public let value: HandbellValue
    public let printStyle: PrintStyle?
    public let placement: AboveBelow?
}

extension Handbell: Equatable { }
extension Handbell: Codable { }