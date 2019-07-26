//
//  Wedge.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The wedge type represents crescendo and diminuendo wedge symbols. The line-type is solid by
/// default.
public struct Wedge {
    /// The type attribute is crescendo for the start of a wedge that is closed at the left side,
    /// and diminuendo for the start of a wedge that is closed on the right side.
    public let type: WedgeType
    /// When a number-level value is implied, the value is 1 by default.
    public let number: Int?
    /// Spread values are measured in tenths; those at the start of a crescendo wedge or end of a
    /// diminuendo wedge are ignored.
    public let spread: Tenths?
    /// The niente attribute is yes if a circle appears at the point of the wedge, indicating a
    /// crescendo from nothing or diminuendo to nothing. It is no by default, and used only when the
    /// type is crescendo, or the type is stop for a wedge that began with a diminuendo type.
    public let niente: Bool?
    public let lineType: LineType?
    public let dashedFormatting: DashedFormatting?
    public let position: Position?
    public let color: Color?
}

extension Wedge: Equatable { }
extension Wedge: Codable { }
