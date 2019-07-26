//
//  Winged.swift
//  MusicXML
//
//  Created by James Bean on 5/14/19.
//

/// The winged attribute indicates whether the repeat has winged extensions that appear above and
/// below the barline. The straight and curved values represent single wings, while the
/// double-straight and double-curved values represent double wings. The none value indicates no
/// wings and is the default.
public enum Winged: String {
    case none
    case straight
    case curved
    case doubleStraight = "double-straight"
    case doubleCurved = "double-curved"
}

extension Winged: Equatable { }
extension Winged: Codable { }
