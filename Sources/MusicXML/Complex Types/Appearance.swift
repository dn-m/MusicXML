//
//  Appearance.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

public struct Appearance {
    public let lineWidth: LineWidth?
    public let noteSize: NoteSizeType?
    public let distance: Distance?
    // TODO: other-appearance?
}

extension Appearance: Equatable { }
extension Appearance: Decodable { }
