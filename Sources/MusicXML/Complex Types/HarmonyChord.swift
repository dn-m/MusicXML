//
//  HarmonyChord.swift
//  MusicXML
//
//  Created by James Bean on 5/16/19.
//

import XMLCoder

// > The harmony elements are based on Humdrum's **harm
// > encoding, extended to support chord symbols in popular
// > music as well as functional harmony analysis in classical
// > music.
//
// > If there are alternate harmonies possible, this can be
// > specified using multiple harmony elements differentiated
// > by type. Explicit harmonies have all note present in the
// > music; implied have some notes missing but implied;
// > alternate represents alternate analyses.
//
// > The harmony object may be used for analysis or for
// > chord symbols. The print-object attribute controls
// > whether or not anything is printed due to the harmony
// > element. The print-frame attribute controls printing
// > of a frame or fretboard diagram. The print-style entity
// > sets the default for the harmony, but individual elements
// > can override this with their own print-style values.
//
// > A harmony element can contain many stacked chords (e.g.
// > V of II). A sequence of harmony-chord entities is used
// > for this type of secondary function, where V of II would
// > be represented by a harmony-chord with a V function
// > followed by a harmony-chord with a II function.
//
// <!ENTITY % harmony-chord "((root | function), kind,
//    inversion?, bass?, degree*)">

public struct HarmonyChord {
    // MARK: - Instance Properties

    // MARK: Elements

    public let rootOrFunction: RootOrFunction
    public let kind: Kind
    public let inversion: Inversion?
    public let bass: Bass?
    public let degrees: [Degree]?

    // MARK: - Initializers

    public init(rootOrFunction: RootOrFunction, kind: Kind, inversion: Inversion? = nil, bass: Bass? = nil, degrees: [Degree]? = nil) {
        self.rootOrFunction = rootOrFunction
        self.kind = kind
        self.inversion = inversion
        self.bass = bass
        self.degrees = degrees
    }

    init(components: [HarmonyChordComponent]) throws {
        var aRootOrFunction: RootOrFunction?
        var aKind: Kind?
        var aInversion: Inversion?
        var aBass: Bass?
        var aDegrees = [Degree]()
        for (i, component) in components.enumerated() {
            if i == 0 {
                switch component {
                case let .root(root):
                    aRootOrFunction = .root(root)
                case let .function(function):
                    aRootOrFunction = .function(function)
                default:
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Requires first element to be either root or function"))
                }
            } else if i == 1 {
                switch component {
                case let .kind(kind):
                    aKind = kind
                default:
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Requires second component to be kind"))
                }
            } else {
                switch component {
                case let .inversion(inversion):
                    aInversion = inversion
                case let .bass(bass):
                    aBass = bass
                case let .degree(degree):
                    aDegrees.append(degree)
                default:
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Expects inversion, bass or degree"))
                }
            }
        }
        guard let rootOrFunction = aRootOrFunction else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Requires root or function to be present"))
        }

        guard let kind = aKind else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Requires kind to be present"))
        }

        self.rootOrFunction = rootOrFunction
        self.kind = kind
        self.inversion = aInversion
        self.bass = aBass
        self.degrees = aDegrees.isEmpty ? nil : aDegrees
    }

    static func assemble(from components: [HarmonyChordComponent]) throws -> [HarmonyChord] {
        var harmonyChords = [HarmonyChord]()
        var previousComponents = [HarmonyChordComponent]()
        for component in components {
            switch component {
            case .root, .function:
                if previousComponents.isEmpty == false {
                    harmonyChords.append(try HarmonyChord(components: previousComponents))
                    previousComponents.removeAll()
                }
            default:
                break
            }
            previousComponents.append(component)
        }
        harmonyChords.append(try HarmonyChord(components: previousComponents))
        return harmonyChords
    }
}

extension HarmonyChord {
    public enum RootOrFunction {
        case root(Root)
        case function(StyleText)
    }
}

extension HarmonyChord: Equatable {}

extension HarmonyChord.RootOrFunction: Equatable {}
extension HarmonyChord.RootOrFunction: Codable {
    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case root
        case function
    }

    // MARK: Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case let .root(value):
            try container.encode(value, forKey: .root)
        case let .function(value):
            try container.encode(value, forKey: .function)
        }
    }

    // MARK: Decodable

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T>(_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.root) {
            self = .root(try decode(.root))
        } else if container.contains(.function) {
            self = .function(try decode(.function))
        } else {
            throw DecodingError.typeMismatch(
                HarmonyChord.RootOrFunction.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension HarmonyChord.RootOrFunction.CodingKeys: XMLChoiceCodingKey {}

enum HarmonyChordComponent {
    case root(Root)
    case function(StyleText)
    case kind(Kind)
    case inversion(Inversion)
    case bass(Bass)
    case degree(Degree)
}

extension HarmonyChordComponent: Decodable {
    enum CodingKeys: String, CodingKey {
        case root
        case function
        case kind
        case inversion
        case bass
        case degree
    }

    // MARK: Decodable

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        func decode <T>(_ key: CodingKeys) throws -> T where T: Codable {
            return try container.decode(T.self, forKey: key)
        }

        if container.contains(.root) {
            self = .root(try decode(.root))
        } else if container.contains(.function) {
            self = .function(try decode(.function))
        } else if container.contains(.kind) {
            self = .kind(try decode(.kind))
        } else if container.contains(.inversion) {
            self = .inversion(try decode(.inversion))
        } else if container.contains(.bass) {
            self = .bass(try decode(.bass))
        } else if container.contains(.degree) {
            self = .degree(try decode(.degree))
        } else {
            throw DecodingError.typeMismatch(
                HarmonyChordComponent.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unrecognized choice"
                )
            )
        }
    }
}

extension HarmonyChordComponent.CodingKeys: XMLChoiceCodingKey {}

extension HarmonyChord: DynamicNodeEncoding {
    public static func nodeEncoding(for key: CodingKey) -> XMLEncoder.NodeEncoding {
        return .element
    }
}
