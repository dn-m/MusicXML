//
//  Extend.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The extend type represents lyric word extension / melisma lines as well as figured bass
/// extensions. The optional type and position attributes are added in Version 3.0 to provide better
/// formatting control.
public struct Extend {
    public let type: StartStopContinue?
    public let printStyle: PrintStyle?

    public init(type: StartStopContinue? = nil, printStyle: PrintStyle? = nil) {
        self.type = type
        self.printStyle = printStyle
    }
}

extension Extend: Equatable { }
extension Extend: Codable { }
