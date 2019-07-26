//
//  WedgeType.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The wedge type is crescendo for the start of a wedge that is closed at the left side, diminuendo
/// for the start of a wedge that is closed on the right side, and stop for the end of a wedge. The
/// continue type is used for formatting wedges over a system break, or for other situations where a
/// single wedge is divided into multiple segments.
public enum WedgeType: String {
    case crescendo
    case descrescendo
    case stop
    case `continue`
}

extension WedgeType: Equatable { }
extension WedgeType: Codable { }
