//
//  PrintStyleAlign.swift
//  MusicXML
//
//  Created by James Bean on 5/15/19.
//

/// The empty-print-style-align type represents an empty element with print-style-align attribute
/// group.
public struct PrintStyleAlign {
    public let printStyle: PrintStyle?
    public let hAlign: LeftCenterRight?
    public let vAlign: VAlign?

    public init(printStyle: PrintStyle? = nil, hAlign: LeftCenterRight? = nil, vAlign: VAlign? = nil) {
        self.printStyle = printStyle
        self.hAlign = hAlign
        self.vAlign = vAlign
    }
}

extension PrintStyleAlign: Equatable { }
extension PrintStyleAlign: Codable { }
