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

    public init(value: HandbellValue, printStyle: PrintStyle? = nil, placement: AboveBelow? = nil) {
        self.value = value
        self.printStyle = printStyle
        self.placement = placement
    }
}

extension Handbell: Equatable { }
extension Handbell: Codable { }
