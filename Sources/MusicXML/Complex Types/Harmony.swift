//
//  Harmony.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

/// The harmony type is based on Humdrum's **harm encoding, extended to support chord symbols in
/// popular music as well as functional harmony analysis in classical music. If there are alternate
/// harmonies possible, this can be specified using multiple harmony elements differentiated by
/// type. Explicit harmonies have all notes present in the music; implied have some notes missing
/// but implied; alternate represents alternate analyses. The harmony object may be used for
/// analysis or for chord symbols. The print-object attribute controls whether or not anything is
/// printed due to the harmony element. The print-style attribute group sets the default for the
/// harmony, but individual elements can override this with their own print-style values.
public struct Harmony {
    // MARK: - Instance Properties

    // MARK: Attributes

    public let type: HarmonyType?
    public let placement: AboveBelow?
    public let printObject: Bool?
    /// The print-frame attribute controls printing of a frame or fretboard diagram.
    public let printFrame: Bool?

    // MARK: Attribute Groups

    public let printStyle: PrintStyle

    // MARK: Elements

    public let chords: [HarmonyChord] // NonEmpty
    public let frame: Frame?
    public let offset: Offset?
    public let editorial: Editorial
    public let staff: Int?

    // MARK: - Initializers

    public init(
        type: HarmonyType? = nil,
        printObject: Bool? = nil,
        printFrame: Bool? = nil,
        printStyle: PrintStyle = PrintStyle(),
        placement: AboveBelow? = nil,
        chords: [HarmonyChord],
        frame: Frame? = nil,
        offset: Offset? = nil,
        editorial: Editorial = Editorial(),
        staff: Int? = nil
    ) {
        self.type = type
        self.printObject = printObject
        self.printFrame = printFrame
        self.printStyle = printStyle
        self.placement = placement
        self.chords = chords
        self.frame = frame
        self.offset = offset
        self.editorial = editorial
        self.staff = staff
    }
}

extension Harmony: Equatable {}
extension Harmony: Codable {
    // MARK: - Codable

    private enum CodingKeys: String, CodingKey {
        case type
        case printObject = "print-object"
        case printFrame = "print-frame"
        case printStyle = "print-style"
        case placement
        case frame
        case offset
        case staff
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decodeIfPresent(HarmonyType.self, forKey: .type)
        self.printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
        self.printFrame = try container.decodeIfPresent(Bool.self, forKey: .printFrame)
        self.printStyle = try PrintStyle(from: decoder)
        self.placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)

        // Imploded list of harmony-chords are difficult to decode.
        // The final way is to break down into individual elements and reassemble them back to harmony-chords
        self.chords = try HarmonyChord.assemble(from: decoder.collectArray())

        self.frame = try container.decodeIfPresent(Frame.self, forKey: .frame)
        self.offset = try container.decodeIfPresent(Offset.self, forKey: .offset)
        self.editorial = try Editorial(from: decoder)
        self.staff = try container.decodeIfPresent(Int.self, forKey: .staff)
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        fatalError("TODO")
    }
}

import XMLCoder
// sourcery:inline:Harmony.DynamicNodeEncoding
extension Harmony: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        if key is XMLAttributeGroupCodingKey {
            return .attribute
        }
        switch key {
        case CodingKeys.type:
            return .attribute
        case CodingKeys.placement:
            return .attribute
        case CodingKeys.printObject:
            return .attribute
        case CodingKeys.printFrame:
            return .attribute
        default:
        return .element
        }
    }
}
// sourcery:end
