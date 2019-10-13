// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// sourcery:inline:AboveBelow.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .above:
        try container.encodeNil(forKey: .above)
    case .below:
        try container.encodeNil(forKey: .below)
    }
}
// sourcery:end

// sourcery:inline:AboveBelow.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.above) {
        _ = try container.decodeNil(forKey: .above)
        self = .above
    } else if container.contains(.below) {
        _ = try container.decodeNil(forKey: .below)
        self = .below
    } else {
        throw DecodingError.typeMismatch(
            AboveBelow.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:AccidentalValue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .sharp:
        try container.encodeNil(forKey: .sharp)
    case .natural:
        try container.encodeNil(forKey: .natural)
    case .flat:
        try container.encodeNil(forKey: .flat)
    case .doubleSharp:
        try container.encodeNil(forKey: .doubleSharp)
    case .sharpSharp:
        try container.encodeNil(forKey: .sharpSharp)
    case .flatFlat:
        try container.encodeNil(forKey: .flatFlat)
    case .doubleFlat:
        try container.encodeNil(forKey: .doubleFlat)
    case .naturalSharp:
        try container.encodeNil(forKey: .naturalSharp)
    case .naturalFlat:
        try container.encodeNil(forKey: .naturalFlat)
    case .quarterFlat:
        try container.encodeNil(forKey: .quarterFlat)
    case .quarterSharp:
        try container.encodeNil(forKey: .quarterSharp)
    case .threeQuartersFlat:
        try container.encodeNil(forKey: .threeQuartersFlat)
    case .threeQuartersSharp:
        try container.encodeNil(forKey: .threeQuartersSharp)
    case .sharpDown:
        try container.encodeNil(forKey: .sharpDown)
    case .sharpUp:
        try container.encodeNil(forKey: .sharpUp)
    case .naturalDown:
        try container.encodeNil(forKey: .naturalDown)
    case .naturalUp:
        try container.encodeNil(forKey: .naturalUp)
    case .flatDown:
        try container.encodeNil(forKey: .flatDown)
    case .flatUp:
        try container.encodeNil(forKey: .flatUp)
    case .doubleSharpDown:
        try container.encodeNil(forKey: .doubleSharpDown)
    case .doubleSharpUp:
        try container.encodeNil(forKey: .doubleSharpUp)
    case .flatFlatDown:
        try container.encodeNil(forKey: .flatFlatDown)
    case .flatFlatUp:
        try container.encodeNil(forKey: .flatFlatUp)
    case .arrowDown:
        try container.encodeNil(forKey: .arrowDown)
    case .arrowUp:
        try container.encodeNil(forKey: .arrowUp)
    case .tripleSharp:
        try container.encodeNil(forKey: .tripleSharp)
    case .tripleFlat:
        try container.encodeNil(forKey: .tripleFlat)
    case .slashQuarterSharp:
        try container.encodeNil(forKey: .slashQuarterSharp)
    case .slashSharp:
        try container.encodeNil(forKey: .slashSharp)
    case .slashFlat:
        try container.encodeNil(forKey: .slashFlat)
    case .doubleSlashFlat:
        try container.encodeNil(forKey: .doubleSlashFlat)
    case .sharp1:
        try container.encodeNil(forKey: .sharp1)
    case .sharp2:
        try container.encodeNil(forKey: .sharp2)
    case .sharp3:
        try container.encodeNil(forKey: .sharp3)
    case .sharp5:
        try container.encodeNil(forKey: .sharp5)
    case .flat1:
        try container.encodeNil(forKey: .flat1)
    case .flat2:
        try container.encodeNil(forKey: .flat2)
    case .flat3:
        try container.encodeNil(forKey: .flat3)
    case .flat4:
        try container.encodeNil(forKey: .flat4)
    case .sori:
        try container.encodeNil(forKey: .sori)
    case .koron:
        try container.encodeNil(forKey: .koron)
    case .other:
        try container.encodeNil(forKey: .other)
    }
}
// sourcery:end

// sourcery:inline:AccidentalValue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.sharp) {
        _ = try container.decodeNil(forKey: .sharp)
        self = .sharp
    } else if container.contains(.natural) {
        _ = try container.decodeNil(forKey: .natural)
        self = .natural
    } else if container.contains(.flat) {
        _ = try container.decodeNil(forKey: .flat)
        self = .flat
    } else if container.contains(.doubleSharp) {
        _ = try container.decodeNil(forKey: .doubleSharp)
        self = .doubleSharp
    } else if container.contains(.sharpSharp) {
        _ = try container.decodeNil(forKey: .sharpSharp)
        self = .sharpSharp
    } else if container.contains(.flatFlat) {
        _ = try container.decodeNil(forKey: .flatFlat)
        self = .flatFlat
    } else if container.contains(.doubleFlat) {
        _ = try container.decodeNil(forKey: .doubleFlat)
        self = .doubleFlat
    } else if container.contains(.naturalSharp) {
        _ = try container.decodeNil(forKey: .naturalSharp)
        self = .naturalSharp
    } else if container.contains(.naturalFlat) {
        _ = try container.decodeNil(forKey: .naturalFlat)
        self = .naturalFlat
    } else if container.contains(.quarterFlat) {
        _ = try container.decodeNil(forKey: .quarterFlat)
        self = .quarterFlat
    } else if container.contains(.quarterSharp) {
        _ = try container.decodeNil(forKey: .quarterSharp)
        self = .quarterSharp
    } else if container.contains(.threeQuartersFlat) {
        _ = try container.decodeNil(forKey: .threeQuartersFlat)
        self = .threeQuartersFlat
    } else if container.contains(.threeQuartersSharp) {
        _ = try container.decodeNil(forKey: .threeQuartersSharp)
        self = .threeQuartersSharp
    } else if container.contains(.sharpDown) {
        _ = try container.decodeNil(forKey: .sharpDown)
        self = .sharpDown
    } else if container.contains(.sharpUp) {
        _ = try container.decodeNil(forKey: .sharpUp)
        self = .sharpUp
    } else if container.contains(.naturalDown) {
        _ = try container.decodeNil(forKey: .naturalDown)
        self = .naturalDown
    } else if container.contains(.naturalUp) {
        _ = try container.decodeNil(forKey: .naturalUp)
        self = .naturalUp
    } else if container.contains(.flatDown) {
        _ = try container.decodeNil(forKey: .flatDown)
        self = .flatDown
    } else if container.contains(.flatUp) {
        _ = try container.decodeNil(forKey: .flatUp)
        self = .flatUp
    } else if container.contains(.doubleSharpDown) {
        _ = try container.decodeNil(forKey: .doubleSharpDown)
        self = .doubleSharpDown
    } else if container.contains(.doubleSharpUp) {
        _ = try container.decodeNil(forKey: .doubleSharpUp)
        self = .doubleSharpUp
    } else if container.contains(.flatFlatDown) {
        _ = try container.decodeNil(forKey: .flatFlatDown)
        self = .flatFlatDown
    } else if container.contains(.flatFlatUp) {
        _ = try container.decodeNil(forKey: .flatFlatUp)
        self = .flatFlatUp
    } else if container.contains(.arrowDown) {
        _ = try container.decodeNil(forKey: .arrowDown)
        self = .arrowDown
    } else if container.contains(.arrowUp) {
        _ = try container.decodeNil(forKey: .arrowUp)
        self = .arrowUp
    } else if container.contains(.tripleSharp) {
        _ = try container.decodeNil(forKey: .tripleSharp)
        self = .tripleSharp
    } else if container.contains(.tripleFlat) {
        _ = try container.decodeNil(forKey: .tripleFlat)
        self = .tripleFlat
    } else if container.contains(.slashQuarterSharp) {
        _ = try container.decodeNil(forKey: .slashQuarterSharp)
        self = .slashQuarterSharp
    } else if container.contains(.slashSharp) {
        _ = try container.decodeNil(forKey: .slashSharp)
        self = .slashSharp
    } else if container.contains(.slashFlat) {
        _ = try container.decodeNil(forKey: .slashFlat)
        self = .slashFlat
    } else if container.contains(.doubleSlashFlat) {
        _ = try container.decodeNil(forKey: .doubleSlashFlat)
        self = .doubleSlashFlat
    } else if container.contains(.sharp1) {
        _ = try container.decodeNil(forKey: .sharp1)
        self = .sharp1
    } else if container.contains(.sharp2) {
        _ = try container.decodeNil(forKey: .sharp2)
        self = .sharp2
    } else if container.contains(.sharp3) {
        _ = try container.decodeNil(forKey: .sharp3)
        self = .sharp3
    } else if container.contains(.sharp5) {
        _ = try container.decodeNil(forKey: .sharp5)
        self = .sharp5
    } else if container.contains(.flat1) {
        _ = try container.decodeNil(forKey: .flat1)
        self = .flat1
    } else if container.contains(.flat2) {
        _ = try container.decodeNil(forKey: .flat2)
        self = .flat2
    } else if container.contains(.flat3) {
        _ = try container.decodeNil(forKey: .flat3)
        self = .flat3
    } else if container.contains(.flat4) {
        _ = try container.decodeNil(forKey: .flat4)
        self = .flat4
    } else if container.contains(.sori) {
        _ = try container.decodeNil(forKey: .sori)
        self = .sori
    } else if container.contains(.koron) {
        _ = try container.decodeNil(forKey: .koron)
        self = .koron
    } else if container.contains(.other) {
        _ = try container.decodeNil(forKey: .other)
        self = .other
    } else {
        throw DecodingError.typeMismatch(
            AccidentalValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:ArrowDirection.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .left:
        try container.encodeNil(forKey: .left)
    case .up:
        try container.encodeNil(forKey: .up)
    case .right:
        try container.encodeNil(forKey: .right)
    case .down:
        try container.encodeNil(forKey: .down)
    case .northwest:
        try container.encodeNil(forKey: .northwest)
    case .northeast:
        try container.encodeNil(forKey: .northeast)
    case .southeast:
        try container.encodeNil(forKey: .southeast)
    case .southwest:
        try container.encodeNil(forKey: .southwest)
    case .leftRight:
        try container.encodeNil(forKey: .leftRight)
    case .upDown:
        try container.encodeNil(forKey: .upDown)
    case .northwestSoutheast:
        try container.encodeNil(forKey: .northwestSoutheast)
    case .northeastSouthwest:
        try container.encodeNil(forKey: .northeastSouthwest)
    case .other:
        try container.encodeNil(forKey: .other)
    }
}
// sourcery:end

// sourcery:inline:ArrowDirection.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.left) {
        _ = try container.decodeNil(forKey: .left)
        self = .left
    } else if container.contains(.up) {
        _ = try container.decodeNil(forKey: .up)
        self = .up
    } else if container.contains(.right) {
        _ = try container.decodeNil(forKey: .right)
        self = .right
    } else if container.contains(.down) {
        _ = try container.decodeNil(forKey: .down)
        self = .down
    } else if container.contains(.northwest) {
        _ = try container.decodeNil(forKey: .northwest)
        self = .northwest
    } else if container.contains(.northeast) {
        _ = try container.decodeNil(forKey: .northeast)
        self = .northeast
    } else if container.contains(.southeast) {
        _ = try container.decodeNil(forKey: .southeast)
        self = .southeast
    } else if container.contains(.southwest) {
        _ = try container.decodeNil(forKey: .southwest)
        self = .southwest
    } else if container.contains(.leftRight) {
        _ = try container.decodeNil(forKey: .leftRight)
        self = .leftRight
    } else if container.contains(.upDown) {
        _ = try container.decodeNil(forKey: .upDown)
        self = .upDown
    } else if container.contains(.northwestSoutheast) {
        _ = try container.decodeNil(forKey: .northwestSoutheast)
        self = .northwestSoutheast
    } else if container.contains(.northeastSouthwest) {
        _ = try container.decodeNil(forKey: .northeastSouthwest)
        self = .northeastSouthwest
    } else if container.contains(.other) {
        _ = try container.decodeNil(forKey: .other)
        self = .other
    } else {
        throw DecodingError.typeMismatch(
            ArrowDirection.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:ArrowStyle.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .single:
        try container.encodeNil(forKey: .single)
    case .double:
        try container.encodeNil(forKey: .double)
    case .filled:
        try container.encodeNil(forKey: .filled)
    case .hollow:
        try container.encodeNil(forKey: .hollow)
    case .paired:
        try container.encodeNil(forKey: .paired)
    case .combined:
        try container.encodeNil(forKey: .combined)
    case .other:
        try container.encodeNil(forKey: .other)
    }
}
// sourcery:end

// sourcery:inline:ArrowStyle.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.single) {
        _ = try container.decodeNil(forKey: .single)
        self = .single
    } else if container.contains(.double) {
        _ = try container.decodeNil(forKey: .double)
        self = .double
    } else if container.contains(.filled) {
        _ = try container.decodeNil(forKey: .filled)
        self = .filled
    } else if container.contains(.hollow) {
        _ = try container.decodeNil(forKey: .hollow)
        self = .hollow
    } else if container.contains(.paired) {
        _ = try container.decodeNil(forKey: .paired)
        self = .paired
    } else if container.contains(.combined) {
        _ = try container.decodeNil(forKey: .combined)
        self = .combined
    } else if container.contains(.other) {
        _ = try container.decodeNil(forKey: .other)
        self = .other
    } else {
        throw DecodingError.typeMismatch(
            ArrowStyle.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:BackwardForward.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .backward:
        try container.encodeNil(forKey: .backward)
    case .forward:
        try container.encodeNil(forKey: .forward)
    }
}
// sourcery:end

// sourcery:inline:BackwardForward.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.backward) {
        _ = try container.decodeNil(forKey: .backward)
        self = .backward
    } else if container.contains(.forward) {
        _ = try container.decodeNil(forKey: .forward)
        self = .forward
    } else {
        throw DecodingError.typeMismatch(
            BackwardForward.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:BarStyle.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .regular:
        try container.encodeNil(forKey: .regular)
    case .dotted:
        try container.encodeNil(forKey: .dotted)
    case .dashed:
        try container.encodeNil(forKey: .dashed)
    case .heavy:
        try container.encodeNil(forKey: .heavy)
    case .lightLight:
        try container.encodeNil(forKey: .lightLight)
    case .lightHeavy:
        try container.encodeNil(forKey: .lightHeavy)
    case .heavyLight:
        try container.encodeNil(forKey: .heavyLight)
    case .heavyHeavy:
        try container.encodeNil(forKey: .heavyHeavy)
    case .tick:
        try container.encodeNil(forKey: .tick)
    case .short:
        try container.encodeNil(forKey: .short)
    case .none:
        try container.encodeNil(forKey: .none)
    }
}
// sourcery:end

// sourcery:inline:BarStyle.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.regular) {
        _ = try container.decodeNil(forKey: .regular)
        self = .regular
    } else if container.contains(.dotted) {
        _ = try container.decodeNil(forKey: .dotted)
        self = .dotted
    } else if container.contains(.dashed) {
        _ = try container.decodeNil(forKey: .dashed)
        self = .dashed
    } else if container.contains(.heavy) {
        _ = try container.decodeNil(forKey: .heavy)
        self = .heavy
    } else if container.contains(.lightLight) {
        _ = try container.decodeNil(forKey: .lightLight)
        self = .lightLight
    } else if container.contains(.lightHeavy) {
        _ = try container.decodeNil(forKey: .lightHeavy)
        self = .lightHeavy
    } else if container.contains(.heavyLight) {
        _ = try container.decodeNil(forKey: .heavyLight)
        self = .heavyLight
    } else if container.contains(.heavyHeavy) {
        _ = try container.decodeNil(forKey: .heavyHeavy)
        self = .heavyHeavy
    } else if container.contains(.tick) {
        _ = try container.decodeNil(forKey: .tick)
        self = .tick
    } else if container.contains(.short) {
        _ = try container.decodeNil(forKey: .short)
        self = .short
    } else if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else {
        throw DecodingError.typeMismatch(
            BarStyle.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:BeamLevel.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .one:
        try container.encodeNil(forKey: .one)
    case .two:
        try container.encodeNil(forKey: .two)
    case .three:
        try container.encodeNil(forKey: .three)
    case .four:
        try container.encodeNil(forKey: .four)
    case .five:
        try container.encodeNil(forKey: .five)
    case .six:
        try container.encodeNil(forKey: .six)
    case .seven:
        try container.encodeNil(forKey: .seven)
    case .eight:
        try container.encodeNil(forKey: .eight)
    }
}
// sourcery:end

// sourcery:inline:BeamLevel.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.one) {
        _ = try container.decodeNil(forKey: .one)
        self = .one
    } else if container.contains(.two) {
        _ = try container.decodeNil(forKey: .two)
        self = .two
    } else if container.contains(.three) {
        _ = try container.decodeNil(forKey: .three)
        self = .three
    } else if container.contains(.four) {
        _ = try container.decodeNil(forKey: .four)
        self = .four
    } else if container.contains(.five) {
        _ = try container.decodeNil(forKey: .five)
        self = .five
    } else if container.contains(.six) {
        _ = try container.decodeNil(forKey: .six)
        self = .six
    } else if container.contains(.seven) {
        _ = try container.decodeNil(forKey: .seven)
        self = .seven
    } else if container.contains(.eight) {
        _ = try container.decodeNil(forKey: .eight)
        self = .eight
    } else {
        throw DecodingError.typeMismatch(
            BeamLevel.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:BeamValue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .begin:
        try container.encodeNil(forKey: .begin)
    case .`continue`:
        try container.encodeNil(forKey: .`continue`)
    case .end:
        try container.encodeNil(forKey: .end)
    case .forwardHook:
        try container.encodeNil(forKey: .forwardHook)
    case .backwardHook:
        try container.encodeNil(forKey: .backwardHook)
    }
}
// sourcery:end

// sourcery:inline:BeamValue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.begin) {
        _ = try container.decodeNil(forKey: .begin)
        self = .begin
    } else if container.contains(.`continue`) {
        _ = try container.decodeNil(forKey: .`continue`)
        self = .`continue`
    } else if container.contains(.end) {
        _ = try container.decodeNil(forKey: .end)
        self = .end
    } else if container.contains(.forwardHook) {
        _ = try container.decodeNil(forKey: .forwardHook)
        self = .forwardHook
    } else if container.contains(.backwardHook) {
        _ = try container.decodeNil(forKey: .backwardHook)
        self = .backwardHook
    } else {
        throw DecodingError.typeMismatch(
            BeamValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:BeaterValue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .bow:
        try container.encodeNil(forKey: .bow)
    case .chimeHammer:
        try container.encodeNil(forKey: .chimeHammer)
    case .coin:
        try container.encodeNil(forKey: .coin)
    case .finger:
        try container.encodeNil(forKey: .finger)
    case .fingernail:
        try container.encodeNil(forKey: .fingernail)
    case .fist:
        try container.encodeNil(forKey: .fist)
    case .guiroScraper:
        try container.encodeNil(forKey: .guiroScraper)
    case .hammer:
        try container.encodeNil(forKey: .hammer)
    case .hand:
        try container.encodeNil(forKey: .hand)
    case .jazzStick:
        try container.encodeNil(forKey: .jazzStick)
    case .knittingNeedle:
        try container.encodeNil(forKey: .knittingNeedle)
    case .metalHammer:
        try container.encodeNil(forKey: .metalHammer)
    case .snareStick:
        try container.encodeNil(forKey: .snareStick)
    case .triangleBeater:
        try container.encodeNil(forKey: .triangleBeater)
    case .triangleBeaterPlain:
        try container.encodeNil(forKey: .triangleBeaterPlain)
    case .wireBrush:
        try container.encodeNil(forKey: .wireBrush)
    }
}
// sourcery:end

// sourcery:inline:BeaterValue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.bow) {
        _ = try container.decodeNil(forKey: .bow)
        self = .bow
    } else if container.contains(.chimeHammer) {
        _ = try container.decodeNil(forKey: .chimeHammer)
        self = .chimeHammer
    } else if container.contains(.coin) {
        _ = try container.decodeNil(forKey: .coin)
        self = .coin
    } else if container.contains(.finger) {
        _ = try container.decodeNil(forKey: .finger)
        self = .finger
    } else if container.contains(.fingernail) {
        _ = try container.decodeNil(forKey: .fingernail)
        self = .fingernail
    } else if container.contains(.fist) {
        _ = try container.decodeNil(forKey: .fist)
        self = .fist
    } else if container.contains(.guiroScraper) {
        _ = try container.decodeNil(forKey: .guiroScraper)
        self = .guiroScraper
    } else if container.contains(.hammer) {
        _ = try container.decodeNil(forKey: .hammer)
        self = .hammer
    } else if container.contains(.hand) {
        _ = try container.decodeNil(forKey: .hand)
        self = .hand
    } else if container.contains(.jazzStick) {
        _ = try container.decodeNil(forKey: .jazzStick)
        self = .jazzStick
    } else if container.contains(.knittingNeedle) {
        _ = try container.decodeNil(forKey: .knittingNeedle)
        self = .knittingNeedle
    } else if container.contains(.metalHammer) {
        _ = try container.decodeNil(forKey: .metalHammer)
        self = .metalHammer
    } else if container.contains(.snareStick) {
        _ = try container.decodeNil(forKey: .snareStick)
        self = .snareStick
    } else if container.contains(.triangleBeater) {
        _ = try container.decodeNil(forKey: .triangleBeater)
        self = .triangleBeater
    } else if container.contains(.triangleBeaterPlain) {
        _ = try container.decodeNil(forKey: .triangleBeaterPlain)
        self = .triangleBeaterPlain
    } else if container.contains(.wireBrush) {
        _ = try container.decodeNil(forKey: .wireBrush)
        self = .wireBrush
    } else {
        throw DecodingError.typeMismatch(
            BeaterValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:BreathMarkValue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .comma:
        try container.encodeNil(forKey: .comma)
    case .tick:
        try container.encodeNil(forKey: .tick)
    }
}
// sourcery:end

// sourcery:inline:BreathMarkValue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.comma) {
        _ = try container.decodeNil(forKey: .comma)
        self = .comma
    } else if container.contains(.tick) {
        _ = try container.decodeNil(forKey: .tick)
        self = .tick
    } else {
        throw DecodingError.typeMismatch(
            BreathMarkValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:CSSFontSize.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .xxSmall:
        try container.encodeNil(forKey: .xxSmall)
    case .xSmall:
        try container.encodeNil(forKey: .xSmall)
    case .small:
        try container.encodeNil(forKey: .small)
    case .medium:
        try container.encodeNil(forKey: .medium)
    case .large:
        try container.encodeNil(forKey: .large)
    case .xLarge:
        try container.encodeNil(forKey: .xLarge)
    case .xxLarge:
        try container.encodeNil(forKey: .xxLarge)
    }
}
// sourcery:end

// sourcery:inline:CSSFontSize.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.xxSmall) {
        _ = try container.decodeNil(forKey: .xxSmall)
        self = .xxSmall
    } else if container.contains(.xSmall) {
        _ = try container.decodeNil(forKey: .xSmall)
        self = .xSmall
    } else if container.contains(.small) {
        _ = try container.decodeNil(forKey: .small)
        self = .small
    } else if container.contains(.medium) {
        _ = try container.decodeNil(forKey: .medium)
        self = .medium
    } else if container.contains(.large) {
        _ = try container.decodeNil(forKey: .large)
        self = .large
    } else if container.contains(.xLarge) {
        _ = try container.decodeNil(forKey: .xLarge)
        self = .xLarge
    } else if container.contains(.xxLarge) {
        _ = try container.decodeNil(forKey: .xxLarge)
        self = .xxLarge
    } else {
        throw DecodingError.typeMismatch(
            CSSFontSize.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:CancelLocation.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .left:
        try container.encodeNil(forKey: .left)
    case .right:
        try container.encodeNil(forKey: .right)
    case .beforeBarline:
        try container.encodeNil(forKey: .beforeBarline)
    }
}
// sourcery:end

// sourcery:inline:CancelLocation.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.left) {
        _ = try container.decodeNil(forKey: .left)
        self = .left
    } else if container.contains(.right) {
        _ = try container.decodeNil(forKey: .right)
        self = .right
    } else if container.contains(.beforeBarline) {
        _ = try container.decodeNil(forKey: .beforeBarline)
        self = .beforeBarline
    } else {
        throw DecodingError.typeMismatch(
            CancelLocation.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:CircularArrow.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .clockwise:
        try container.encodeNil(forKey: .clockwise)
    case .anticlockwise:
        try container.encodeNil(forKey: .anticlockwise)
    }
}
// sourcery:end

// sourcery:inline:CircularArrow.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.clockwise) {
        _ = try container.decodeNil(forKey: .clockwise)
        self = .clockwise
    } else if container.contains(.anticlockwise) {
        _ = try container.decodeNil(forKey: .anticlockwise)
        self = .anticlockwise
    } else {
        throw DecodingError.typeMismatch(
            CircularArrow.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:ClefSign.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .g:
        try container.encodeNil(forKey: .g)
    case .f:
        try container.encodeNil(forKey: .f)
    case .c:
        try container.encodeNil(forKey: .c)
    case .percussion:
        try container.encodeNil(forKey: .percussion)
    case .TAB:
        try container.encodeNil(forKey: .TAB)
    case .jianpu:
        try container.encodeNil(forKey: .jianpu)
    case .none:
        try container.encodeNil(forKey: .none)
    }
}
// sourcery:end

// sourcery:inline:ClefSign.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.g) {
        _ = try container.decodeNil(forKey: .g)
        self = .g
    } else if container.contains(.f) {
        _ = try container.decodeNil(forKey: .f)
        self = .f
    } else if container.contains(.c) {
        _ = try container.decodeNil(forKey: .c)
        self = .c
    } else if container.contains(.percussion) {
        _ = try container.decodeNil(forKey: .percussion)
        self = .percussion
    } else if container.contains(.TAB) {
        _ = try container.decodeNil(forKey: .TAB)
        self = .TAB
    } else if container.contains(.jianpu) {
        _ = try container.decodeNil(forKey: .jianpu)
        self = .jianpu
    } else if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else {
        throw DecodingError.typeMismatch(
            ClefSign.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:DegreeSymbolValue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .major:
        try container.encodeNil(forKey: .major)
    case .minor:
        try container.encodeNil(forKey: .minor)
    case .augmented:
        try container.encodeNil(forKey: .augmented)
    case .diminished:
        try container.encodeNil(forKey: .diminished)
    case .halfDiminished:
        try container.encodeNil(forKey: .halfDiminished)
    }
}
// sourcery:end

// sourcery:inline:DegreeSymbolValue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.major) {
        _ = try container.decodeNil(forKey: .major)
        self = .major
    } else if container.contains(.minor) {
        _ = try container.decodeNil(forKey: .minor)
        self = .minor
    } else if container.contains(.augmented) {
        _ = try container.decodeNil(forKey: .augmented)
        self = .augmented
    } else if container.contains(.diminished) {
        _ = try container.decodeNil(forKey: .diminished)
        self = .diminished
    } else if container.contains(.halfDiminished) {
        _ = try container.decodeNil(forKey: .halfDiminished)
        self = .halfDiminished
    } else {
        throw DecodingError.typeMismatch(
            DegreeSymbolValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:DegreeTypeValue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .add:
        try container.encodeNil(forKey: .add)
    case .alter:
        try container.encodeNil(forKey: .alter)
    case .subtract:
        try container.encodeNil(forKey: .subtract)
    }
}
// sourcery:end

// sourcery:inline:DegreeTypeValue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.add) {
        _ = try container.decodeNil(forKey: .add)
        self = .add
    } else if container.contains(.alter) {
        _ = try container.decodeNil(forKey: .alter)
        self = .alter
    } else if container.contains(.subtract) {
        _ = try container.decodeNil(forKey: .subtract)
        self = .subtract
    } else {
        throw DecodingError.typeMismatch(
            DegreeTypeValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:DistanceType.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .beam:
        try container.encodeNil(forKey: .beam)
    case .hyphen:
        try container.encodeNil(forKey: .hyphen)
    }
}
// sourcery:end

// sourcery:inline:DistanceType.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.beam) {
        _ = try container.decodeNil(forKey: .beam)
        self = .beam
    } else if container.contains(.hyphen) {
        _ = try container.decodeNil(forKey: .hyphen)
        self = .hyphen
    } else {
        throw DecodingError.typeMismatch(
            DistanceType.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Effect.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .anvil:
        try container.encodeNil(forKey: .anvil)
    case .autoHorn:
        try container.encodeNil(forKey: .autoHorn)
    case .birdWhistle:
        try container.encodeNil(forKey: .birdWhistle)
    case .cannon:
        try container.encodeNil(forKey: .cannon)
    case .duckCall:
        try container.encodeNil(forKey: .duckCall)
    case .gunShot:
        try container.encodeNil(forKey: .gunShot)
    case .klaxonHorn:
        try container.encodeNil(forKey: .klaxonHorn)
    case .lionsRoar:
        try container.encodeNil(forKey: .lionsRoar)
    case .policeWhistle:
        try container.encodeNil(forKey: .policeWhistle)
    case .siren:
        try container.encodeNil(forKey: .siren)
    case .slideWhistle:
        try container.encodeNil(forKey: .slideWhistle)
    case .thunderSheet:
        try container.encodeNil(forKey: .thunderSheet)
    case .windMachine:
        try container.encodeNil(forKey: .windMachine)
    case .windWhistle:
        try container.encodeNil(forKey: .windWhistle)
    }
}
// sourcery:end

// sourcery:inline:Effect.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.anvil) {
        _ = try container.decodeNil(forKey: .anvil)
        self = .anvil
    } else if container.contains(.autoHorn) {
        _ = try container.decodeNil(forKey: .autoHorn)
        self = .autoHorn
    } else if container.contains(.birdWhistle) {
        _ = try container.decodeNil(forKey: .birdWhistle)
        self = .birdWhistle
    } else if container.contains(.cannon) {
        _ = try container.decodeNil(forKey: .cannon)
        self = .cannon
    } else if container.contains(.duckCall) {
        _ = try container.decodeNil(forKey: .duckCall)
        self = .duckCall
    } else if container.contains(.gunShot) {
        _ = try container.decodeNil(forKey: .gunShot)
        self = .gunShot
    } else if container.contains(.klaxonHorn) {
        _ = try container.decodeNil(forKey: .klaxonHorn)
        self = .klaxonHorn
    } else if container.contains(.lionsRoar) {
        _ = try container.decodeNil(forKey: .lionsRoar)
        self = .lionsRoar
    } else if container.contains(.policeWhistle) {
        _ = try container.decodeNil(forKey: .policeWhistle)
        self = .policeWhistle
    } else if container.contains(.siren) {
        _ = try container.decodeNil(forKey: .siren)
        self = .siren
    } else if container.contains(.slideWhistle) {
        _ = try container.decodeNil(forKey: .slideWhistle)
        self = .slideWhistle
    } else if container.contains(.thunderSheet) {
        _ = try container.decodeNil(forKey: .thunderSheet)
        self = .thunderSheet
    } else if container.contains(.windMachine) {
        _ = try container.decodeNil(forKey: .windMachine)
        self = .windMachine
    } else if container.contains(.windWhistle) {
        _ = try container.decodeNil(forKey: .windWhistle)
        self = .windWhistle
    } else {
        throw DecodingError.typeMismatch(
            Effect.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:EnclosureShape.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .rectangle:
        try container.encodeNil(forKey: .rectangle)
    case .square:
        try container.encodeNil(forKey: .square)
    case .oval:
        try container.encodeNil(forKey: .oval)
    case .circle:
        try container.encodeNil(forKey: .circle)
    case .bracket:
        try container.encodeNil(forKey: .bracket)
    case .triangle:
        try container.encodeNil(forKey: .triangle)
    case .diamond:
        try container.encodeNil(forKey: .diamond)
    case .pentagon:
        try container.encodeNil(forKey: .pentagon)
    case .hexagon:
        try container.encodeNil(forKey: .hexagon)
    case .heptagon:
        try container.encodeNil(forKey: .heptagon)
    case .octagon:
        try container.encodeNil(forKey: .octagon)
    case .nonagon:
        try container.encodeNil(forKey: .nonagon)
    case .decagon:
        try container.encodeNil(forKey: .decagon)
    case .none:
        try container.encodeNil(forKey: .none)
    }
}
// sourcery:end

// sourcery:inline:EnclosureShape.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.rectangle) {
        _ = try container.decodeNil(forKey: .rectangle)
        self = .rectangle
    } else if container.contains(.square) {
        _ = try container.decodeNil(forKey: .square)
        self = .square
    } else if container.contains(.oval) {
        _ = try container.decodeNil(forKey: .oval)
        self = .oval
    } else if container.contains(.circle) {
        _ = try container.decodeNil(forKey: .circle)
        self = .circle
    } else if container.contains(.bracket) {
        _ = try container.decodeNil(forKey: .bracket)
        self = .bracket
    } else if container.contains(.triangle) {
        _ = try container.decodeNil(forKey: .triangle)
        self = .triangle
    } else if container.contains(.diamond) {
        _ = try container.decodeNil(forKey: .diamond)
        self = .diamond
    } else if container.contains(.pentagon) {
        _ = try container.decodeNil(forKey: .pentagon)
        self = .pentagon
    } else if container.contains(.hexagon) {
        _ = try container.decodeNil(forKey: .hexagon)
        self = .hexagon
    } else if container.contains(.heptagon) {
        _ = try container.decodeNil(forKey: .heptagon)
        self = .heptagon
    } else if container.contains(.octagon) {
        _ = try container.decodeNil(forKey: .octagon)
        self = .octagon
    } else if container.contains(.nonagon) {
        _ = try container.decodeNil(forKey: .nonagon)
        self = .nonagon
    } else if container.contains(.decagon) {
        _ = try container.decodeNil(forKey: .decagon)
        self = .decagon
    } else if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else {
        throw DecodingError.typeMismatch(
            EnclosureShape.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Fan.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .accelerando:
        try container.encodeNil(forKey: .accelerando)
    case .ritardando:
        try container.encodeNil(forKey: .ritardando)
    case .none:
        try container.encodeNil(forKey: .none)
    }
}
// sourcery:end

// sourcery:inline:Fan.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.accelerando) {
        _ = try container.decodeNil(forKey: .accelerando)
        self = .accelerando
    } else if container.contains(.ritardando) {
        _ = try container.decodeNil(forKey: .ritardando)
        self = .ritardando
    } else if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else {
        throw DecodingError.typeMismatch(
            Fan.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:FermataShape.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .normal:
        try container.encodeNil(forKey: .normal)
    case .angled:
        try container.encodeNil(forKey: .angled)
    case .square:
        try container.encodeNil(forKey: .square)
    }
}
// sourcery:end

// sourcery:inline:FermataShape.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.normal) {
        _ = try container.decodeNil(forKey: .normal)
        self = .normal
    } else if container.contains(.angled) {
        _ = try container.decodeNil(forKey: .angled)
        self = .angled
    } else if container.contains(.square) {
        _ = try container.decodeNil(forKey: .square)
        self = .square
    } else {
        throw DecodingError.typeMismatch(
            FermataShape.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:FontSize.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case let .css(value):
        try container.encode(value, forKey: .css)
    case let .numeric(value):
        try container.encode(value, forKey: .numeric)
    }
}
// sourcery:end

// sourcery:inline:FontSize.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.css) {
        self = .css(try decode(.css))
    } else if container.contains(.numeric) {
        self = .numeric(try decode(.numeric))
    } else {
        throw DecodingError.typeMismatch(
            FontSize.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:FontStyle.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .normal:
        try container.encodeNil(forKey: .normal)
    case .italic:
        try container.encodeNil(forKey: .italic)
    }
}
// sourcery:end

// sourcery:inline:FontStyle.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.normal) {
        _ = try container.decodeNil(forKey: .normal)
        self = .normal
    } else if container.contains(.italic) {
        _ = try container.decodeNil(forKey: .italic)
        self = .italic
    } else {
        throw DecodingError.typeMismatch(
            FontStyle.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:FontWeight.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .normal:
        try container.encodeNil(forKey: .normal)
    case .bold:
        try container.encodeNil(forKey: .bold)
    }
}
// sourcery:end

// sourcery:inline:FontWeight.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.normal) {
        _ = try container.decodeNil(forKey: .normal)
        self = .normal
    } else if container.contains(.bold) {
        _ = try container.decodeNil(forKey: .bold)
        self = .bold
    } else {
        throw DecodingError.typeMismatch(
            FontWeight.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Glass.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .windChimes:
        try container.encodeNil(forKey: .windChimes)
    }
}
// sourcery:end

// sourcery:inline:Glass.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.windChimes) {
        _ = try container.decodeNil(forKey: .windChimes)
        self = .windChimes
    } else {
        throw DecodingError.typeMismatch(
            Glass.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:GroupBarlineValue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .yes:
        try container.encodeNil(forKey: .yes)
    case .no:
        try container.encodeNil(forKey: .no)
    case .mensurstrich:
        try container.encodeNil(forKey: .mensurstrich)
    }
}
// sourcery:end

// sourcery:inline:GroupBarlineValue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.yes) {
        _ = try container.decodeNil(forKey: .yes)
        self = .yes
    } else if container.contains(.no) {
        _ = try container.decodeNil(forKey: .no)
        self = .no
    } else if container.contains(.mensurstrich) {
        _ = try container.decodeNil(forKey: .mensurstrich)
        self = .mensurstrich
    } else {
        throw DecodingError.typeMismatch(
            GroupBarlineValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:GroupSymbolValue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .none:
        try container.encodeNil(forKey: .none)
    case .brace:
        try container.encodeNil(forKey: .brace)
    case .line:
        try container.encodeNil(forKey: .line)
    case .bracket:
        try container.encodeNil(forKey: .bracket)
    case .square:
        try container.encodeNil(forKey: .square)
    }
}
// sourcery:end

// sourcery:inline:GroupSymbolValue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else if container.contains(.brace) {
        _ = try container.decodeNil(forKey: .brace)
        self = .brace
    } else if container.contains(.line) {
        _ = try container.decodeNil(forKey: .line)
        self = .line
    } else if container.contains(.bracket) {
        _ = try container.decodeNil(forKey: .bracket)
        self = .bracket
    } else if container.contains(.square) {
        _ = try container.decodeNil(forKey: .square)
        self = .square
    } else {
        throw DecodingError.typeMismatch(
            GroupSymbolValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:HandbellValue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .damp:
        try container.encodeNil(forKey: .damp)
    case .echo:
        try container.encodeNil(forKey: .echo)
    case .gyro:
        try container.encodeNil(forKey: .gyro)
    case .handMartellato:
        try container.encodeNil(forKey: .handMartellato)
    case .malletLift:
        try container.encodeNil(forKey: .malletLift)
    case .malletTable:
        try container.encodeNil(forKey: .malletTable)
    case .martellato:
        try container.encodeNil(forKey: .martellato)
    case .martellatoLift:
        try container.encodeNil(forKey: .martellatoLift)
    case .mutedMartellato:
        try container.encodeNil(forKey: .mutedMartellato)
    case .pluckLift:
        try container.encodeNil(forKey: .pluckLift)
    case .swing:
        try container.encodeNil(forKey: .swing)
    }
}
// sourcery:end

// sourcery:inline:HandbellValue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.damp) {
        _ = try container.decodeNil(forKey: .damp)
        self = .damp
    } else if container.contains(.echo) {
        _ = try container.decodeNil(forKey: .echo)
        self = .echo
    } else if container.contains(.gyro) {
        _ = try container.decodeNil(forKey: .gyro)
        self = .gyro
    } else if container.contains(.handMartellato) {
        _ = try container.decodeNil(forKey: .handMartellato)
        self = .handMartellato
    } else if container.contains(.malletLift) {
        _ = try container.decodeNil(forKey: .malletLift)
        self = .malletLift
    } else if container.contains(.malletTable) {
        _ = try container.decodeNil(forKey: .malletTable)
        self = .malletTable
    } else if container.contains(.martellato) {
        _ = try container.decodeNil(forKey: .martellato)
        self = .martellato
    } else if container.contains(.martellatoLift) {
        _ = try container.decodeNil(forKey: .martellatoLift)
        self = .martellatoLift
    } else if container.contains(.mutedMartellato) {
        _ = try container.decodeNil(forKey: .mutedMartellato)
        self = .mutedMartellato
    } else if container.contains(.pluckLift) {
        _ = try container.decodeNil(forKey: .pluckLift)
        self = .pluckLift
    } else if container.contains(.swing) {
        _ = try container.decodeNil(forKey: .swing)
        self = .swing
    } else {
        throw DecodingError.typeMismatch(
            HandbellValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:HarmonyType.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .explicit:
        try container.encodeNil(forKey: .explicit)
    case .implied:
        try container.encodeNil(forKey: .implied)
    case .alternate:
        try container.encodeNil(forKey: .alternate)
    }
}
// sourcery:end

// sourcery:inline:HarmonyType.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.explicit) {
        _ = try container.decodeNil(forKey: .explicit)
        self = .explicit
    } else if container.contains(.implied) {
        _ = try container.decodeNil(forKey: .implied)
        self = .implied
    } else if container.contains(.alternate) {
        _ = try container.decodeNil(forKey: .alternate)
        self = .alternate
    } else {
        throw DecodingError.typeMismatch(
            HarmonyType.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:HoleClosedLocation.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .right:
        try container.encodeNil(forKey: .right)
    case .bottom:
        try container.encodeNil(forKey: .bottom)
    case .left:
        try container.encodeNil(forKey: .left)
    case .top:
        try container.encodeNil(forKey: .top)
    }
}
// sourcery:end

// sourcery:inline:HoleClosedLocation.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.right) {
        _ = try container.decodeNil(forKey: .right)
        self = .right
    } else if container.contains(.bottom) {
        _ = try container.decodeNil(forKey: .bottom)
        self = .bottom
    } else if container.contains(.left) {
        _ = try container.decodeNil(forKey: .left)
        self = .left
    } else if container.contains(.top) {
        _ = try container.decodeNil(forKey: .top)
        self = .top
    } else {
        throw DecodingError.typeMismatch(
            HoleClosedLocation.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:HoleClosedValue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .yes:
        try container.encodeNil(forKey: .yes)
    case .no:
        try container.encodeNil(forKey: .no)
    case .half:
        try container.encodeNil(forKey: .half)
    }
}
// sourcery:end

// sourcery:inline:HoleClosedValue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.yes) {
        _ = try container.decodeNil(forKey: .yes)
        self = .yes
    } else if container.contains(.no) {
        _ = try container.decodeNil(forKey: .no)
        self = .no
    } else if container.contains(.half) {
        _ = try container.decodeNil(forKey: .half)
        self = .half
    } else {
        throw DecodingError.typeMismatch(
            HoleClosedValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:KindValue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .major:
        try container.encodeNil(forKey: .major)
    case .minor:
        try container.encodeNil(forKey: .minor)
    case .augmented:
        try container.encodeNil(forKey: .augmented)
    case .diminished:
        try container.encodeNil(forKey: .diminished)
    case .dominant:
        try container.encodeNil(forKey: .dominant)
    case .majorSeventh:
        try container.encodeNil(forKey: .majorSeventh)
    case .minorSeventh:
        try container.encodeNil(forKey: .minorSeventh)
    case .diminishedSeventh:
        try container.encodeNil(forKey: .diminishedSeventh)
    case .augmentedSeventh:
        try container.encodeNil(forKey: .augmentedSeventh)
    case .halfDiminished:
        try container.encodeNil(forKey: .halfDiminished)
    case .majorMinor:
        try container.encodeNil(forKey: .majorMinor)
    case .majorSixth:
        try container.encodeNil(forKey: .majorSixth)
    case .minorSixth:
        try container.encodeNil(forKey: .minorSixth)
    case .dominantNinth:
        try container.encodeNil(forKey: .dominantNinth)
    case .majorNinth:
        try container.encodeNil(forKey: .majorNinth)
    case .minorNinth:
        try container.encodeNil(forKey: .minorNinth)
    case .dominantEleventh:
        try container.encodeNil(forKey: .dominantEleventh)
    case .majorEleventh:
        try container.encodeNil(forKey: .majorEleventh)
    case .minorEleventh:
        try container.encodeNil(forKey: .minorEleventh)
    case .dominantThirteenth:
        try container.encodeNil(forKey: .dominantThirteenth)
    case .majorThirteenth:
        try container.encodeNil(forKey: .majorThirteenth)
    case .minorThirteenth:
        try container.encodeNil(forKey: .minorThirteenth)
    case .suspendedSecond:
        try container.encodeNil(forKey: .suspendedSecond)
    case .suspendedFourth:
        try container.encodeNil(forKey: .suspendedFourth)
    case .neapolitan:
        try container.encodeNil(forKey: .neapolitan)
    case .italian:
        try container.encodeNil(forKey: .italian)
    case .french:
        try container.encodeNil(forKey: .french)
    case .german:
        try container.encodeNil(forKey: .german)
    case .pedalPointBass:
        try container.encodeNil(forKey: .pedalPointBass)
    case .power:
        try container.encodeNil(forKey: .power)
    case .tristan:
        try container.encodeNil(forKey: .tristan)
    case .other:
        try container.encodeNil(forKey: .other)
    case .none:
        try container.encodeNil(forKey: .none)
    }
}
// sourcery:end

// sourcery:inline:KindValue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.major) {
        _ = try container.decodeNil(forKey: .major)
        self = .major
    } else if container.contains(.minor) {
        _ = try container.decodeNil(forKey: .minor)
        self = .minor
    } else if container.contains(.augmented) {
        _ = try container.decodeNil(forKey: .augmented)
        self = .augmented
    } else if container.contains(.diminished) {
        _ = try container.decodeNil(forKey: .diminished)
        self = .diminished
    } else if container.contains(.dominant) {
        _ = try container.decodeNil(forKey: .dominant)
        self = .dominant
    } else if container.contains(.majorSeventh) {
        _ = try container.decodeNil(forKey: .majorSeventh)
        self = .majorSeventh
    } else if container.contains(.minorSeventh) {
        _ = try container.decodeNil(forKey: .minorSeventh)
        self = .minorSeventh
    } else if container.contains(.diminishedSeventh) {
        _ = try container.decodeNil(forKey: .diminishedSeventh)
        self = .diminishedSeventh
    } else if container.contains(.augmentedSeventh) {
        _ = try container.decodeNil(forKey: .augmentedSeventh)
        self = .augmentedSeventh
    } else if container.contains(.halfDiminished) {
        _ = try container.decodeNil(forKey: .halfDiminished)
        self = .halfDiminished
    } else if container.contains(.majorMinor) {
        _ = try container.decodeNil(forKey: .majorMinor)
        self = .majorMinor
    } else if container.contains(.majorSixth) {
        _ = try container.decodeNil(forKey: .majorSixth)
        self = .majorSixth
    } else if container.contains(.minorSixth) {
        _ = try container.decodeNil(forKey: .minorSixth)
        self = .minorSixth
    } else if container.contains(.dominantNinth) {
        _ = try container.decodeNil(forKey: .dominantNinth)
        self = .dominantNinth
    } else if container.contains(.majorNinth) {
        _ = try container.decodeNil(forKey: .majorNinth)
        self = .majorNinth
    } else if container.contains(.minorNinth) {
        _ = try container.decodeNil(forKey: .minorNinth)
        self = .minorNinth
    } else if container.contains(.dominantEleventh) {
        _ = try container.decodeNil(forKey: .dominantEleventh)
        self = .dominantEleventh
    } else if container.contains(.majorEleventh) {
        _ = try container.decodeNil(forKey: .majorEleventh)
        self = .majorEleventh
    } else if container.contains(.minorEleventh) {
        _ = try container.decodeNil(forKey: .minorEleventh)
        self = .minorEleventh
    } else if container.contains(.dominantThirteenth) {
        _ = try container.decodeNil(forKey: .dominantThirteenth)
        self = .dominantThirteenth
    } else if container.contains(.majorThirteenth) {
        _ = try container.decodeNil(forKey: .majorThirteenth)
        self = .majorThirteenth
    } else if container.contains(.minorThirteenth) {
        _ = try container.decodeNil(forKey: .minorThirteenth)
        self = .minorThirteenth
    } else if container.contains(.suspendedSecond) {
        _ = try container.decodeNil(forKey: .suspendedSecond)
        self = .suspendedSecond
    } else if container.contains(.suspendedFourth) {
        _ = try container.decodeNil(forKey: .suspendedFourth)
        self = .suspendedFourth
    } else if container.contains(.neapolitan) {
        _ = try container.decodeNil(forKey: .neapolitan)
        self = .neapolitan
    } else if container.contains(.italian) {
        _ = try container.decodeNil(forKey: .italian)
        self = .italian
    } else if container.contains(.french) {
        _ = try container.decodeNil(forKey: .french)
        self = .french
    } else if container.contains(.german) {
        _ = try container.decodeNil(forKey: .german)
        self = .german
    } else if container.contains(.pedalPointBass) {
        _ = try container.decodeNil(forKey: .pedalPointBass)
        self = .pedalPointBass
    } else if container.contains(.power) {
        _ = try container.decodeNil(forKey: .power)
        self = .power
    } else if container.contains(.tristan) {
        _ = try container.decodeNil(forKey: .tristan)
        self = .tristan
    } else if container.contains(.other) {
        _ = try container.decodeNil(forKey: .other)
        self = .other
    } else if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else {
        throw DecodingError.typeMismatch(
            KindValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:LeftCenterRight.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .left:
        try container.encodeNil(forKey: .left)
    case .center:
        try container.encodeNil(forKey: .center)
    case .right:
        try container.encodeNil(forKey: .right)
    }
}
// sourcery:end

// sourcery:inline:LeftCenterRight.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.left) {
        _ = try container.decodeNil(forKey: .left)
        self = .left
    } else if container.contains(.center) {
        _ = try container.decodeNil(forKey: .center)
        self = .center
    } else if container.contains(.right) {
        _ = try container.decodeNil(forKey: .right)
        self = .right
    } else {
        throw DecodingError.typeMismatch(
            LeftCenterRight.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:LeftRight.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .left:
        try container.encodeNil(forKey: .left)
    case .right:
        try container.encodeNil(forKey: .right)
    }
}
// sourcery:end

// sourcery:inline:LeftRight.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.left) {
        _ = try container.decodeNil(forKey: .left)
        self = .left
    } else if container.contains(.right) {
        _ = try container.decodeNil(forKey: .right)
        self = .right
    } else {
        throw DecodingError.typeMismatch(
            LeftRight.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:LineEnd.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .up:
        try container.encodeNil(forKey: .up)
    case .down:
        try container.encodeNil(forKey: .down)
    case .both:
        try container.encodeNil(forKey: .both)
    case .arrow:
        try container.encodeNil(forKey: .arrow)
    case .none:
        try container.encodeNil(forKey: .none)
    }
}
// sourcery:end

// sourcery:inline:LineEnd.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.up) {
        _ = try container.decodeNil(forKey: .up)
        self = .up
    } else if container.contains(.down) {
        _ = try container.decodeNil(forKey: .down)
        self = .down
    } else if container.contains(.both) {
        _ = try container.decodeNil(forKey: .both)
        self = .both
    } else if container.contains(.arrow) {
        _ = try container.decodeNil(forKey: .arrow)
        self = .arrow
    } else if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else {
        throw DecodingError.typeMismatch(
            LineEnd.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:LineShape.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .straight:
        try container.encodeNil(forKey: .straight)
    case .curved:
        try container.encodeNil(forKey: .curved)
    }
}
// sourcery:end

// sourcery:inline:LineShape.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.straight) {
        _ = try container.decodeNil(forKey: .straight)
        self = .straight
    } else if container.contains(.curved) {
        _ = try container.decodeNil(forKey: .curved)
        self = .curved
    } else {
        throw DecodingError.typeMismatch(
            LineShape.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:LineType.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .solid:
        try container.encodeNil(forKey: .solid)
    case .dashed:
        try container.encodeNil(forKey: .dashed)
    case .dotted:
        try container.encodeNil(forKey: .dotted)
    case .wavy:
        try container.encodeNil(forKey: .wavy)
    }
}
// sourcery:end

// sourcery:inline:LineType.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.solid) {
        _ = try container.decodeNil(forKey: .solid)
        self = .solid
    } else if container.contains(.dashed) {
        _ = try container.decodeNil(forKey: .dashed)
        self = .dashed
    } else if container.contains(.dotted) {
        _ = try container.decodeNil(forKey: .dotted)
        self = .dotted
    } else if container.contains(.wavy) {
        _ = try container.decodeNil(forKey: .wavy)
        self = .wavy
    } else {
        throw DecodingError.typeMismatch(
            LineType.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:LineWidthType.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .beam:
        try container.encodeNil(forKey: .beam)
    case .bracket:
        try container.encodeNil(forKey: .bracket)
    case .dashes:
        try container.encodeNil(forKey: .dashes)
    case .enclosure:
        try container.encodeNil(forKey: .enclosure)
    case .ending:
        try container.encodeNil(forKey: .ending)
    case .extend:
        try container.encodeNil(forKey: .extend)
    case .heavyBarline:
        try container.encodeNil(forKey: .heavyBarline)
    case .leger:
        try container.encodeNil(forKey: .leger)
    case .lightBarline:
        try container.encodeNil(forKey: .lightBarline)
    case .octaveShift:
        try container.encodeNil(forKey: .octaveShift)
    case .pedal:
        try container.encodeNil(forKey: .pedal)
    case .slurMiddle:
        try container.encodeNil(forKey: .slurMiddle)
    case .slurTip:
        try container.encodeNil(forKey: .slurTip)
    case .staff:
        try container.encodeNil(forKey: .staff)
    case .stem:
        try container.encodeNil(forKey: .stem)
    case .tieMiddle:
        try container.encodeNil(forKey: .tieMiddle)
    case .tieTip:
        try container.encodeNil(forKey: .tieTip)
    case .tupletBracket:
        try container.encodeNil(forKey: .tupletBracket)
    case .wedge:
        try container.encodeNil(forKey: .wedge)
    }
}
// sourcery:end

// sourcery:inline:LineWidthType.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.beam) {
        _ = try container.decodeNil(forKey: .beam)
        self = .beam
    } else if container.contains(.bracket) {
        _ = try container.decodeNil(forKey: .bracket)
        self = .bracket
    } else if container.contains(.dashes) {
        _ = try container.decodeNil(forKey: .dashes)
        self = .dashes
    } else if container.contains(.enclosure) {
        _ = try container.decodeNil(forKey: .enclosure)
        self = .enclosure
    } else if container.contains(.ending) {
        _ = try container.decodeNil(forKey: .ending)
        self = .ending
    } else if container.contains(.extend) {
        _ = try container.decodeNil(forKey: .extend)
        self = .extend
    } else if container.contains(.heavyBarline) {
        _ = try container.decodeNil(forKey: .heavyBarline)
        self = .heavyBarline
    } else if container.contains(.leger) {
        _ = try container.decodeNil(forKey: .leger)
        self = .leger
    } else if container.contains(.lightBarline) {
        _ = try container.decodeNil(forKey: .lightBarline)
        self = .lightBarline
    } else if container.contains(.octaveShift) {
        _ = try container.decodeNil(forKey: .octaveShift)
        self = .octaveShift
    } else if container.contains(.pedal) {
        _ = try container.decodeNil(forKey: .pedal)
        self = .pedal
    } else if container.contains(.slurMiddle) {
        _ = try container.decodeNil(forKey: .slurMiddle)
        self = .slurMiddle
    } else if container.contains(.slurTip) {
        _ = try container.decodeNil(forKey: .slurTip)
        self = .slurTip
    } else if container.contains(.staff) {
        _ = try container.decodeNil(forKey: .staff)
        self = .staff
    } else if container.contains(.stem) {
        _ = try container.decodeNil(forKey: .stem)
        self = .stem
    } else if container.contains(.tieMiddle) {
        _ = try container.decodeNil(forKey: .tieMiddle)
        self = .tieMiddle
    } else if container.contains(.tieTip) {
        _ = try container.decodeNil(forKey: .tieTip)
        self = .tieTip
    } else if container.contains(.tupletBracket) {
        _ = try container.decodeNil(forKey: .tupletBracket)
        self = .tupletBracket
    } else if container.contains(.wedge) {
        _ = try container.decodeNil(forKey: .wedge)
        self = .wedge
    } else {
        throw DecodingError.typeMismatch(
            LineWidthType.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:MarginType.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .odd:
        try container.encodeNil(forKey: .odd)
    case .even:
        try container.encodeNil(forKey: .even)
    case .both:
        try container.encodeNil(forKey: .both)
    }
}
// sourcery:end

// sourcery:inline:MarginType.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.odd) {
        _ = try container.decodeNil(forKey: .odd)
        self = .odd
    } else if container.contains(.even) {
        _ = try container.decodeNil(forKey: .even)
        self = .even
    } else if container.contains(.both) {
        _ = try container.decodeNil(forKey: .both)
        self = .both
    } else {
        throw DecodingError.typeMismatch(
            MarginType.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:MeasureNumberingValue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .none:
        try container.encodeNil(forKey: .none)
    case .measure:
        try container.encodeNil(forKey: .measure)
    case .system:
        try container.encodeNil(forKey: .system)
    }
}
// sourcery:end

// sourcery:inline:MeasureNumberingValue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else if container.contains(.measure) {
        _ = try container.decodeNil(forKey: .measure)
        self = .measure
    } else if container.contains(.system) {
        _ = try container.decodeNil(forKey: .system)
        self = .system
    } else {
        throw DecodingError.typeMismatch(
            MeasureNumberingValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Membrane.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .bassDrum:
        try container.encodeNil(forKey: .bassDrum)
    case .bassDrumOnSide:
        try container.encodeNil(forKey: .bassDrumOnSide)
    case .bongos:
        try container.encodeNil(forKey: .bongos)
    case .congaDrum:
        try container.encodeNil(forKey: .congaDrum)
    case .gobletDrum:
        try container.encodeNil(forKey: .gobletDrum)
    case .militaryDrum:
        try container.encodeNil(forKey: .militaryDrum)
    case .snareDrum:
        try container.encodeNil(forKey: .snareDrum)
    case .snareDrumSnaresOff:
        try container.encodeNil(forKey: .snareDrumSnaresOff)
    case .tambourine:
        try container.encodeNil(forKey: .tambourine)
    case .tenorDrum:
        try container.encodeNil(forKey: .tenorDrum)
    case .timbales:
        try container.encodeNil(forKey: .timbales)
    case .tomtom:
        try container.encodeNil(forKey: .tomtom)
    }
}
// sourcery:end

// sourcery:inline:Membrane.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.bassDrum) {
        _ = try container.decodeNil(forKey: .bassDrum)
        self = .bassDrum
    } else if container.contains(.bassDrumOnSide) {
        _ = try container.decodeNil(forKey: .bassDrumOnSide)
        self = .bassDrumOnSide
    } else if container.contains(.bongos) {
        _ = try container.decodeNil(forKey: .bongos)
        self = .bongos
    } else if container.contains(.congaDrum) {
        _ = try container.decodeNil(forKey: .congaDrum)
        self = .congaDrum
    } else if container.contains(.gobletDrum) {
        _ = try container.decodeNil(forKey: .gobletDrum)
        self = .gobletDrum
    } else if container.contains(.militaryDrum) {
        _ = try container.decodeNil(forKey: .militaryDrum)
        self = .militaryDrum
    } else if container.contains(.snareDrum) {
        _ = try container.decodeNil(forKey: .snareDrum)
        self = .snareDrum
    } else if container.contains(.snareDrumSnaresOff) {
        _ = try container.decodeNil(forKey: .snareDrumSnaresOff)
        self = .snareDrumSnaresOff
    } else if container.contains(.tambourine) {
        _ = try container.decodeNil(forKey: .tambourine)
        self = .tambourine
    } else if container.contains(.tenorDrum) {
        _ = try container.decodeNil(forKey: .tenorDrum)
        self = .tenorDrum
    } else if container.contains(.timbales) {
        _ = try container.decodeNil(forKey: .timbales)
        self = .timbales
    } else if container.contains(.tomtom) {
        _ = try container.decodeNil(forKey: .tomtom)
        self = .tomtom
    } else {
        throw DecodingError.typeMismatch(
            Membrane.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Metal.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .almglocken:
        try container.encodeNil(forKey: .almglocken)
    case .bell:
        try container.encodeNil(forKey: .bell)
    case .bellPlate:
        try container.encodeNil(forKey: .bellPlate)
    case .brakeDrum:
        try container.encodeNil(forKey: .brakeDrum)
    case .chineseCymbal:
        try container.encodeNil(forKey: .chineseCymbal)
    case .cowbell:
        try container.encodeNil(forKey: .cowbell)
    case .crashCymbals:
        try container.encodeNil(forKey: .crashCymbals)
    case .crotale:
        try container.encodeNil(forKey: .crotale)
    case .cymbalTongs:
        try container.encodeNil(forKey: .cymbalTongs)
    case .domedGong:
        try container.encodeNil(forKey: .domedGong)
    case .fingerCymbals:
        try container.encodeNil(forKey: .fingerCymbals)
    case .flexatone:
        try container.encodeNil(forKey: .flexatone)
    case .gong:
        try container.encodeNil(forKey: .gong)
    case .hiHat:
        try container.encodeNil(forKey: .hiHat)
    case .highHatCymbals:
        try container.encodeNil(forKey: .highHatCymbals)
    case .handbell:
        try container.encodeNil(forKey: .handbell)
    case .sistrum:
        try container.encodeNil(forKey: .sistrum)
    case .sizzleCymbal:
        try container.encodeNil(forKey: .sizzleCymbal)
    case .sleighBells:
        try container.encodeNil(forKey: .sleighBells)
    case .suspendedCymbal:
        try container.encodeNil(forKey: .suspendedCymbal)
    case .tamTam:
        try container.encodeNil(forKey: .tamTam)
    case .triangle:
        try container.encodeNil(forKey: .triangle)
    case .vietnameseHat:
        try container.encodeNil(forKey: .vietnameseHat)
    }
}
// sourcery:end

// sourcery:inline:Metal.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.almglocken) {
        _ = try container.decodeNil(forKey: .almglocken)
        self = .almglocken
    } else if container.contains(.bell) {
        _ = try container.decodeNil(forKey: .bell)
        self = .bell
    } else if container.contains(.bellPlate) {
        _ = try container.decodeNil(forKey: .bellPlate)
        self = .bellPlate
    } else if container.contains(.brakeDrum) {
        _ = try container.decodeNil(forKey: .brakeDrum)
        self = .brakeDrum
    } else if container.contains(.chineseCymbal) {
        _ = try container.decodeNil(forKey: .chineseCymbal)
        self = .chineseCymbal
    } else if container.contains(.cowbell) {
        _ = try container.decodeNil(forKey: .cowbell)
        self = .cowbell
    } else if container.contains(.crashCymbals) {
        _ = try container.decodeNil(forKey: .crashCymbals)
        self = .crashCymbals
    } else if container.contains(.crotale) {
        _ = try container.decodeNil(forKey: .crotale)
        self = .crotale
    } else if container.contains(.cymbalTongs) {
        _ = try container.decodeNil(forKey: .cymbalTongs)
        self = .cymbalTongs
    } else if container.contains(.domedGong) {
        _ = try container.decodeNil(forKey: .domedGong)
        self = .domedGong
    } else if container.contains(.fingerCymbals) {
        _ = try container.decodeNil(forKey: .fingerCymbals)
        self = .fingerCymbals
    } else if container.contains(.flexatone) {
        _ = try container.decodeNil(forKey: .flexatone)
        self = .flexatone
    } else if container.contains(.gong) {
        _ = try container.decodeNil(forKey: .gong)
        self = .gong
    } else if container.contains(.hiHat) {
        _ = try container.decodeNil(forKey: .hiHat)
        self = .hiHat
    } else if container.contains(.highHatCymbals) {
        _ = try container.decodeNil(forKey: .highHatCymbals)
        self = .highHatCymbals
    } else if container.contains(.handbell) {
        _ = try container.decodeNil(forKey: .handbell)
        self = .handbell
    } else if container.contains(.sistrum) {
        _ = try container.decodeNil(forKey: .sistrum)
        self = .sistrum
    } else if container.contains(.sizzleCymbal) {
        _ = try container.decodeNil(forKey: .sizzleCymbal)
        self = .sizzleCymbal
    } else if container.contains(.sleighBells) {
        _ = try container.decodeNil(forKey: .sleighBells)
        self = .sleighBells
    } else if container.contains(.suspendedCymbal) {
        _ = try container.decodeNil(forKey: .suspendedCymbal)
        self = .suspendedCymbal
    } else if container.contains(.tamTam) {
        _ = try container.decodeNil(forKey: .tamTam)
        self = .tamTam
    } else if container.contains(.triangle) {
        _ = try container.decodeNil(forKey: .triangle)
        self = .triangle
    } else if container.contains(.vietnameseHat) {
        _ = try container.decodeNil(forKey: .vietnameseHat)
        self = .vietnameseHat
    } else {
        throw DecodingError.typeMismatch(
            Metal.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Mode.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .major:
        try container.encodeNil(forKey: .major)
    case .minor:
        try container.encodeNil(forKey: .minor)
    case .dorian:
        try container.encodeNil(forKey: .dorian)
    case .phrygian:
        try container.encodeNil(forKey: .phrygian)
    case .lydian:
        try container.encodeNil(forKey: .lydian)
    case .mixolydian:
        try container.encodeNil(forKey: .mixolydian)
    case .aeolian:
        try container.encodeNil(forKey: .aeolian)
    case .ionian:
        try container.encodeNil(forKey: .ionian)
    case .locrian:
        try container.encodeNil(forKey: .locrian)
    case .none:
        try container.encodeNil(forKey: .none)
    }
}
// sourcery:end

// sourcery:inline:Mode.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.major) {
        _ = try container.decodeNil(forKey: .major)
        self = .major
    } else if container.contains(.minor) {
        _ = try container.decodeNil(forKey: .minor)
        self = .minor
    } else if container.contains(.dorian) {
        _ = try container.decodeNil(forKey: .dorian)
        self = .dorian
    } else if container.contains(.phrygian) {
        _ = try container.decodeNil(forKey: .phrygian)
        self = .phrygian
    } else if container.contains(.lydian) {
        _ = try container.decodeNil(forKey: .lydian)
        self = .lydian
    } else if container.contains(.mixolydian) {
        _ = try container.decodeNil(forKey: .mixolydian)
        self = .mixolydian
    } else if container.contains(.aeolian) {
        _ = try container.decodeNil(forKey: .aeolian)
        self = .aeolian
    } else if container.contains(.ionian) {
        _ = try container.decodeNil(forKey: .ionian)
        self = .ionian
    } else if container.contains(.locrian) {
        _ = try container.decodeNil(forKey: .locrian)
        self = .locrian
    } else if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else {
        throw DecodingError.typeMismatch(
            Mode.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Mute.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .on:
        try container.encodeNil(forKey: .on)
    case .off:
        try container.encodeNil(forKey: .off)
    case .straight:
        try container.encodeNil(forKey: .straight)
    case .cup:
        try container.encodeNil(forKey: .cup)
    case .harmonNoStem:
        try container.encodeNil(forKey: .harmonNoStem)
    case .harmonStem:
        try container.encodeNil(forKey: .harmonStem)
    case .bucket:
        try container.encodeNil(forKey: .bucket)
    case .plunger:
        try container.encodeNil(forKey: .plunger)
    case .hat:
        try container.encodeNil(forKey: .hat)
    case .solotone:
        try container.encodeNil(forKey: .solotone)
    case .practice:
        try container.encodeNil(forKey: .practice)
    case .stopMute:
        try container.encodeNil(forKey: .stopMute)
    case .stopHand:
        try container.encodeNil(forKey: .stopHand)
    case .echo:
        try container.encodeNil(forKey: .echo)
    case .palm:
        try container.encodeNil(forKey: .palm)
    }
}
// sourcery:end

// sourcery:inline:Mute.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.on) {
        _ = try container.decodeNil(forKey: .on)
        self = .on
    } else if container.contains(.off) {
        _ = try container.decodeNil(forKey: .off)
        self = .off
    } else if container.contains(.straight) {
        _ = try container.decodeNil(forKey: .straight)
        self = .straight
    } else if container.contains(.cup) {
        _ = try container.decodeNil(forKey: .cup)
        self = .cup
    } else if container.contains(.harmonNoStem) {
        _ = try container.decodeNil(forKey: .harmonNoStem)
        self = .harmonNoStem
    } else if container.contains(.harmonStem) {
        _ = try container.decodeNil(forKey: .harmonStem)
        self = .harmonStem
    } else if container.contains(.bucket) {
        _ = try container.decodeNil(forKey: .bucket)
        self = .bucket
    } else if container.contains(.plunger) {
        _ = try container.decodeNil(forKey: .plunger)
        self = .plunger
    } else if container.contains(.hat) {
        _ = try container.decodeNil(forKey: .hat)
        self = .hat
    } else if container.contains(.solotone) {
        _ = try container.decodeNil(forKey: .solotone)
        self = .solotone
    } else if container.contains(.practice) {
        _ = try container.decodeNil(forKey: .practice)
        self = .practice
    } else if container.contains(.stopMute) {
        _ = try container.decodeNil(forKey: .stopMute)
        self = .stopMute
    } else if container.contains(.stopHand) {
        _ = try container.decodeNil(forKey: .stopHand)
        self = .stopHand
    } else if container.contains(.echo) {
        _ = try container.decodeNil(forKey: .echo)
        self = .echo
    } else if container.contains(.palm) {
        _ = try container.decodeNil(forKey: .palm)
        self = .palm
    } else {
        throw DecodingError.typeMismatch(
            Mute.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:NoteSizeType.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .cue:
        try container.encodeNil(forKey: .cue)
    case .grace:
        try container.encodeNil(forKey: .grace)
    case .large:
        try container.encodeNil(forKey: .large)
    }
}
// sourcery:end

// sourcery:inline:NoteSizeType.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.cue) {
        _ = try container.decodeNil(forKey: .cue)
        self = .cue
    } else if container.contains(.grace) {
        _ = try container.decodeNil(forKey: .grace)
        self = .grace
    } else if container.contains(.large) {
        _ = try container.decodeNil(forKey: .large)
        self = .large
    } else {
        throw DecodingError.typeMismatch(
            NoteSizeType.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:NoteTypeValue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .maxima:
        try container.encodeNil(forKey: .maxima)
    case .long:
        try container.encodeNil(forKey: .long)
    case .breve:
        try container.encodeNil(forKey: .breve)
    case .whole:
        try container.encodeNil(forKey: .whole)
    case .half:
        try container.encodeNil(forKey: .half)
    case .quarter:
        try container.encodeNil(forKey: .quarter)
    case .eighth:
        try container.encodeNil(forKey: .eighth)
    case .sixteenth:
        try container.encodeNil(forKey: .sixteenth)
    case .thirysecond:
        try container.encodeNil(forKey: .thirysecond)
    case .sixtyfourth:
        try container.encodeNil(forKey: .sixtyfourth)
    case .onehundredtwentyeighth:
        try container.encodeNil(forKey: .onehundredtwentyeighth)
    case .twohundredfiftysixth:
        try container.encodeNil(forKey: .twohundredfiftysixth)
    case .fivehundredtwelfth:
        try container.encodeNil(forKey: .fivehundredtwelfth)
    case .onethousandtwentyfourth:
        try container.encodeNil(forKey: .onethousandtwentyfourth)
    }
}
// sourcery:end

// sourcery:inline:NoteTypeValue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.maxima) {
        _ = try container.decodeNil(forKey: .maxima)
        self = .maxima
    } else if container.contains(.long) {
        _ = try container.decodeNil(forKey: .long)
        self = .long
    } else if container.contains(.breve) {
        _ = try container.decodeNil(forKey: .breve)
        self = .breve
    } else if container.contains(.whole) {
        _ = try container.decodeNil(forKey: .whole)
        self = .whole
    } else if container.contains(.half) {
        _ = try container.decodeNil(forKey: .half)
        self = .half
    } else if container.contains(.quarter) {
        _ = try container.decodeNil(forKey: .quarter)
        self = .quarter
    } else if container.contains(.eighth) {
        _ = try container.decodeNil(forKey: .eighth)
        self = .eighth
    } else if container.contains(.sixteenth) {
        _ = try container.decodeNil(forKey: .sixteenth)
        self = .sixteenth
    } else if container.contains(.thirysecond) {
        _ = try container.decodeNil(forKey: .thirysecond)
        self = .thirysecond
    } else if container.contains(.sixtyfourth) {
        _ = try container.decodeNil(forKey: .sixtyfourth)
        self = .sixtyfourth
    } else if container.contains(.onehundredtwentyeighth) {
        _ = try container.decodeNil(forKey: .onehundredtwentyeighth)
        self = .onehundredtwentyeighth
    } else if container.contains(.twohundredfiftysixth) {
        _ = try container.decodeNil(forKey: .twohundredfiftysixth)
        self = .twohundredfiftysixth
    } else if container.contains(.fivehundredtwelfth) {
        _ = try container.decodeNil(forKey: .fivehundredtwelfth)
        self = .fivehundredtwelfth
    } else if container.contains(.onethousandtwentyfourth) {
        _ = try container.decodeNil(forKey: .onethousandtwentyfourth)
        self = .onethousandtwentyfourth
    } else {
        throw DecodingError.typeMismatch(
            NoteTypeValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:NoteheadValue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .slash:
        try container.encodeNil(forKey: .slash)
    case .triangle:
        try container.encodeNil(forKey: .triangle)
    case .diamond:
        try container.encodeNil(forKey: .diamond)
    case .square:
        try container.encodeNil(forKey: .square)
    case .cross:
        try container.encodeNil(forKey: .cross)
    case .x:
        try container.encodeNil(forKey: .x)
    case .circleX:
        try container.encodeNil(forKey: .circleX)
    case .invertedTriangle:
        try container.encodeNil(forKey: .invertedTriangle)
    case .arrowDown:
        try container.encodeNil(forKey: .arrowDown)
    case .arrowUp:
        try container.encodeNil(forKey: .arrowUp)
    case .circled:
        try container.encodeNil(forKey: .circled)
    case .slashed:
        try container.encodeNil(forKey: .slashed)
    case .backSlashed:
        try container.encodeNil(forKey: .backSlashed)
    case .normal:
        try container.encodeNil(forKey: .normal)
    case .cluster:
        try container.encodeNil(forKey: .cluster)
    case .circleDot:
        try container.encodeNil(forKey: .circleDot)
    case .leftTriangle:
        try container.encodeNil(forKey: .leftTriangle)
    case .rectangle:
        try container.encodeNil(forKey: .rectangle)
    case .other:
        try container.encodeNil(forKey: .other)
    case .none:
        try container.encodeNil(forKey: .none)
    case .`do`:
        try container.encodeNil(forKey: .`do`)
    case .re:
        try container.encodeNil(forKey: .re)
    case .mi:
        try container.encodeNil(forKey: .mi)
    case .fa:
        try container.encodeNil(forKey: .fa)
    case .faUp:
        try container.encodeNil(forKey: .faUp)
    case .so:
        try container.encodeNil(forKey: .so)
    case .la:
        try container.encodeNil(forKey: .la)
    case .ti:
        try container.encodeNil(forKey: .ti)
    }
}
// sourcery:end

// sourcery:inline:NoteheadValue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.slash) {
        _ = try container.decodeNil(forKey: .slash)
        self = .slash
    } else if container.contains(.triangle) {
        _ = try container.decodeNil(forKey: .triangle)
        self = .triangle
    } else if container.contains(.diamond) {
        _ = try container.decodeNil(forKey: .diamond)
        self = .diamond
    } else if container.contains(.square) {
        _ = try container.decodeNil(forKey: .square)
        self = .square
    } else if container.contains(.cross) {
        _ = try container.decodeNil(forKey: .cross)
        self = .cross
    } else if container.contains(.x) {
        _ = try container.decodeNil(forKey: .x)
        self = .x
    } else if container.contains(.circleX) {
        _ = try container.decodeNil(forKey: .circleX)
        self = .circleX
    } else if container.contains(.invertedTriangle) {
        _ = try container.decodeNil(forKey: .invertedTriangle)
        self = .invertedTriangle
    } else if container.contains(.arrowDown) {
        _ = try container.decodeNil(forKey: .arrowDown)
        self = .arrowDown
    } else if container.contains(.arrowUp) {
        _ = try container.decodeNil(forKey: .arrowUp)
        self = .arrowUp
    } else if container.contains(.circled) {
        _ = try container.decodeNil(forKey: .circled)
        self = .circled
    } else if container.contains(.slashed) {
        _ = try container.decodeNil(forKey: .slashed)
        self = .slashed
    } else if container.contains(.backSlashed) {
        _ = try container.decodeNil(forKey: .backSlashed)
        self = .backSlashed
    } else if container.contains(.normal) {
        _ = try container.decodeNil(forKey: .normal)
        self = .normal
    } else if container.contains(.cluster) {
        _ = try container.decodeNil(forKey: .cluster)
        self = .cluster
    } else if container.contains(.circleDot) {
        _ = try container.decodeNil(forKey: .circleDot)
        self = .circleDot
    } else if container.contains(.leftTriangle) {
        _ = try container.decodeNil(forKey: .leftTriangle)
        self = .leftTriangle
    } else if container.contains(.rectangle) {
        _ = try container.decodeNil(forKey: .rectangle)
        self = .rectangle
    } else if container.contains(.other) {
        _ = try container.decodeNil(forKey: .other)
        self = .other
    } else if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else if container.contains(.`do`) {
        _ = try container.decodeNil(forKey: .`do`)
        self = .`do`
    } else if container.contains(.re) {
        _ = try container.decodeNil(forKey: .re)
        self = .re
    } else if container.contains(.mi) {
        _ = try container.decodeNil(forKey: .mi)
        self = .mi
    } else if container.contains(.fa) {
        _ = try container.decodeNil(forKey: .fa)
        self = .fa
    } else if container.contains(.faUp) {
        _ = try container.decodeNil(forKey: .faUp)
        self = .faUp
    } else if container.contains(.so) {
        _ = try container.decodeNil(forKey: .so)
        self = .so
    } else if container.contains(.la) {
        _ = try container.decodeNil(forKey: .la)
        self = .la
    } else if container.contains(.ti) {
        _ = try container.decodeNil(forKey: .ti)
        self = .ti
    } else {
        throw DecodingError.typeMismatch(
            NoteheadValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end


// sourcery:inline:NumberOrNormal.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .number:
        try container.encodeNil(forKey: .number)
    case .normal:
        try container.encodeNil(forKey: .normal)
    }
}
// sourcery:end

// sourcery:inline:NumberOrNormal.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.number) {
        _ = try container.decodeNil(forKey: .number)
        self = .number
    } else if container.contains(.normal) {
        _ = try container.decodeNil(forKey: .normal)
        self = .normal
    } else {
        throw DecodingError.typeMismatch(
            NumberOrNormal.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:OnOff.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .on:
        try container.encodeNil(forKey: .on)
    case .off:
        try container.encodeNil(forKey: .off)
    }
}
// sourcery:end

// sourcery:inline:OnOff.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.on) {
        _ = try container.decodeNil(forKey: .on)
        self = .on
    } else if container.contains(.off) {
        _ = try container.decodeNil(forKey: .off)
        self = .off
    } else {
        throw DecodingError.typeMismatch(
            OnOff.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:OverUnder.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .over:
        try container.encodeNil(forKey: .over)
    case .under:
        try container.encodeNil(forKey: .under)
    }
}
// sourcery:end

// sourcery:inline:OverUnder.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.over) {
        _ = try container.decodeNil(forKey: .over)
        self = .over
    } else if container.contains(.under) {
        _ = try container.decodeNil(forKey: .under)
        self = .under
    } else {
        throw DecodingError.typeMismatch(
            OverUnder.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Pitched.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .chimes:
        try container.encodeNil(forKey: .chimes)
    case .glockenspiel:
        try container.encodeNil(forKey: .glockenspiel)
    case .mallet:
        try container.encodeNil(forKey: .mallet)
    case .marimba:
        try container.encodeNil(forKey: .marimba)
    case .tubularChimes:
        try container.encodeNil(forKey: .tubularChimes)
    case .vibraphone:
        try container.encodeNil(forKey: .vibraphone)
    case .xylophone:
        try container.encodeNil(forKey: .xylophone)
    }
}
// sourcery:end

// sourcery:inline:Pitched.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.chimes) {
        _ = try container.decodeNil(forKey: .chimes)
        self = .chimes
    } else if container.contains(.glockenspiel) {
        _ = try container.decodeNil(forKey: .glockenspiel)
        self = .glockenspiel
    } else if container.contains(.mallet) {
        _ = try container.decodeNil(forKey: .mallet)
        self = .mallet
    } else if container.contains(.marimba) {
        _ = try container.decodeNil(forKey: .marimba)
        self = .marimba
    } else if container.contains(.tubularChimes) {
        _ = try container.decodeNil(forKey: .tubularChimes)
        self = .tubularChimes
    } else if container.contains(.vibraphone) {
        _ = try container.decodeNil(forKey: .vibraphone)
        self = .vibraphone
    } else if container.contains(.xylophone) {
        _ = try container.decodeNil(forKey: .xylophone)
        self = .xylophone
    } else {
        throw DecodingError.typeMismatch(
            Pitched.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:PrincipleVoiceSymbol.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .haupstimme:
        try container.encodeNil(forKey: .haupstimme)
    case .nebenstimme:
        try container.encodeNil(forKey: .nebenstimme)
    case .plain:
        try container.encodeNil(forKey: .plain)
    case .none:
        try container.encodeNil(forKey: .none)
    }
}
// sourcery:end

// sourcery:inline:PrincipleVoiceSymbol.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.haupstimme) {
        _ = try container.decodeNil(forKey: .haupstimme)
        self = .haupstimme
    } else if container.contains(.nebenstimme) {
        _ = try container.decodeNil(forKey: .nebenstimme)
        self = .nebenstimme
    } else if container.contains(.plain) {
        _ = try container.decodeNil(forKey: .plain)
        self = .plain
    } else if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else {
        throw DecodingError.typeMismatch(
            PrincipleVoiceSymbol.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:RightLeftMiddle.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .right:
        try container.encodeNil(forKey: .right)
    case .left:
        try container.encodeNil(forKey: .left)
    case .middle:
        try container.encodeNil(forKey: .middle)
    }
}
// sourcery:end

// sourcery:inline:RightLeftMiddle.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.right) {
        _ = try container.decodeNil(forKey: .right)
        self = .right
    } else if container.contains(.left) {
        _ = try container.decodeNil(forKey: .left)
        self = .left
    } else if container.contains(.middle) {
        _ = try container.decodeNil(forKey: .middle)
        self = .middle
    } else {
        throw DecodingError.typeMismatch(
            RightLeftMiddle.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:SemiPitched.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .high:
        try container.encodeNil(forKey: .high)
    case .mediumHigh:
        try container.encodeNil(forKey: .mediumHigh)
    case .medium:
        try container.encodeNil(forKey: .medium)
    case .mediumLow:
        try container.encodeNil(forKey: .mediumLow)
    case .low:
        try container.encodeNil(forKey: .low)
    case .veryLow:
        try container.encodeNil(forKey: .veryLow)
    }
}
// sourcery:end

// sourcery:inline:SemiPitched.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.high) {
        _ = try container.decodeNil(forKey: .high)
        self = .high
    } else if container.contains(.mediumHigh) {
        _ = try container.decodeNil(forKey: .mediumHigh)
        self = .mediumHigh
    } else if container.contains(.medium) {
        _ = try container.decodeNil(forKey: .medium)
        self = .medium
    } else if container.contains(.mediumLow) {
        _ = try container.decodeNil(forKey: .mediumLow)
        self = .mediumLow
    } else if container.contains(.low) {
        _ = try container.decodeNil(forKey: .low)
        self = .low
    } else if container.contains(.veryLow) {
        _ = try container.decodeNil(forKey: .veryLow)
        self = .veryLow
    } else {
        throw DecodingError.typeMismatch(
            SemiPitched.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:ShowFrets.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .numbers:
        try container.encodeNil(forKey: .numbers)
    case .letters:
        try container.encodeNil(forKey: .letters)
    }
}
// sourcery:end

// sourcery:inline:ShowFrets.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.numbers) {
        _ = try container.decodeNil(forKey: .numbers)
        self = .numbers
    } else if container.contains(.letters) {
        _ = try container.decodeNil(forKey: .letters)
        self = .letters
    } else {
        throw DecodingError.typeMismatch(
            ShowFrets.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:ShowTuplet.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .actual:
        try container.encodeNil(forKey: .actual)
    case .both:
        try container.encodeNil(forKey: .both)
    case .none:
        try container.encodeNil(forKey: .none)
    }
}
// sourcery:end

// sourcery:inline:ShowTuplet.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.actual) {
        _ = try container.decodeNil(forKey: .actual)
        self = .actual
    } else if container.contains(.both) {
        _ = try container.decodeNil(forKey: .both)
        self = .both
    } else if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else {
        throw DecodingError.typeMismatch(
            ShowTuplet.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:StaffType.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .ossia:
        try container.encodeNil(forKey: .ossia)
    case .cue:
        try container.encodeNil(forKey: .cue)
    case .editorial:
        try container.encodeNil(forKey: .editorial)
    case .regular:
        try container.encodeNil(forKey: .regular)
    case .alternate:
        try container.encodeNil(forKey: .alternate)
    }
}
// sourcery:end

// sourcery:inline:StaffType.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.ossia) {
        _ = try container.decodeNil(forKey: .ossia)
        self = .ossia
    } else if container.contains(.cue) {
        _ = try container.decodeNil(forKey: .cue)
        self = .cue
    } else if container.contains(.editorial) {
        _ = try container.decodeNil(forKey: .editorial)
        self = .editorial
    } else if container.contains(.regular) {
        _ = try container.decodeNil(forKey: .regular)
        self = .regular
    } else if container.contains(.alternate) {
        _ = try container.decodeNil(forKey: .alternate)
        self = .alternate
    } else {
        throw DecodingError.typeMismatch(
            StaffType.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:StartNote.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .upper:
        try container.encodeNil(forKey: .upper)
    case .main:
        try container.encodeNil(forKey: .main)
    case .below:
        try container.encodeNil(forKey: .below)
    }
}
// sourcery:end

// sourcery:inline:StartNote.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.upper) {
        _ = try container.decodeNil(forKey: .upper)
        self = .upper
    } else if container.contains(.main) {
        _ = try container.decodeNil(forKey: .main)
        self = .main
    } else if container.contains(.below) {
        _ = try container.decodeNil(forKey: .below)
        self = .below
    } else {
        throw DecodingError.typeMismatch(
            StartNote.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:StartStop.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .start:
        try container.encodeNil(forKey: .start)
    case .stop:
        try container.encodeNil(forKey: .stop)
    }
}
// sourcery:end

// sourcery:inline:StartStop.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.start) {
        _ = try container.decodeNil(forKey: .start)
        self = .start
    } else if container.contains(.stop) {
        _ = try container.decodeNil(forKey: .stop)
        self = .stop
    } else {
        throw DecodingError.typeMismatch(
            StartStop.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:StartStopChangeContinue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .start:
        try container.encodeNil(forKey: .start)
    case .stop:
        try container.encodeNil(forKey: .stop)
    case .change:
        try container.encodeNil(forKey: .change)
    case .`continue`:
        try container.encodeNil(forKey: .`continue`)
    }
}
// sourcery:end

// sourcery:inline:StartStopChangeContinue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.start) {
        _ = try container.decodeNil(forKey: .start)
        self = .start
    } else if container.contains(.stop) {
        _ = try container.decodeNil(forKey: .stop)
        self = .stop
    } else if container.contains(.change) {
        _ = try container.decodeNil(forKey: .change)
        self = .change
    } else if container.contains(.`continue`) {
        _ = try container.decodeNil(forKey: .`continue`)
        self = .`continue`
    } else {
        throw DecodingError.typeMismatch(
            StartStopChangeContinue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:StartStopContinue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .start:
        try container.encodeNil(forKey: .start)
    case .stop:
        try container.encodeNil(forKey: .stop)
    case .`continue`:
        try container.encodeNil(forKey: .`continue`)
    }
}
// sourcery:end

// sourcery:inline:StartStopContinue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.start) {
        _ = try container.decodeNil(forKey: .start)
        self = .start
    } else if container.contains(.stop) {
        _ = try container.decodeNil(forKey: .stop)
        self = .stop
    } else if container.contains(.`continue`) {
        _ = try container.decodeNil(forKey: .`continue`)
        self = .`continue`
    } else {
        throw DecodingError.typeMismatch(
            StartStopContinue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:StartStopDiscontinue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .start:
        try container.encodeNil(forKey: .start)
    case .stop:
        try container.encodeNil(forKey: .stop)
    case .discontinue:
        try container.encodeNil(forKey: .discontinue)
    }
}
// sourcery:end

// sourcery:inline:StartStopDiscontinue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.start) {
        _ = try container.decodeNil(forKey: .start)
        self = .start
    } else if container.contains(.stop) {
        _ = try container.decodeNil(forKey: .stop)
        self = .stop
    } else if container.contains(.discontinue) {
        _ = try container.decodeNil(forKey: .discontinue)
        self = .discontinue
    } else {
        throw DecodingError.typeMismatch(
            StartStopDiscontinue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:StartStopSingle.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .start:
        try container.encodeNil(forKey: .start)
    case .stop:
        try container.encodeNil(forKey: .stop)
    case .single:
        try container.encodeNil(forKey: .single)
    }
}
// sourcery:end

// sourcery:inline:StartStopSingle.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.start) {
        _ = try container.decodeNil(forKey: .start)
        self = .start
    } else if container.contains(.stop) {
        _ = try container.decodeNil(forKey: .stop)
        self = .stop
    } else if container.contains(.single) {
        _ = try container.decodeNil(forKey: .single)
        self = .single
    } else {
        throw DecodingError.typeMismatch(
            StartStopSingle.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:StemValue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .down:
        try container.encodeNil(forKey: .down)
    case .up:
        try container.encodeNil(forKey: .up)
    case .double:
        try container.encodeNil(forKey: .double)
    case .none:
        try container.encodeNil(forKey: .none)
    }
}
// sourcery:end

// sourcery:inline:StemValue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.down) {
        _ = try container.decodeNil(forKey: .down)
        self = .down
    } else if container.contains(.up) {
        _ = try container.decodeNil(forKey: .up)
        self = .up
    } else if container.contains(.double) {
        _ = try container.decodeNil(forKey: .double)
        self = .double
    } else if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else {
        throw DecodingError.typeMismatch(
            StemValue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Step.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .a:
        try container.encodeNil(forKey: .a)
    case .b:
        try container.encodeNil(forKey: .b)
    case .c:
        try container.encodeNil(forKey: .c)
    case .d:
        try container.encodeNil(forKey: .d)
    case .e:
        try container.encodeNil(forKey: .e)
    case .f:
        try container.encodeNil(forKey: .f)
    case .g:
        try container.encodeNil(forKey: .g)
    }
}
// sourcery:end

// sourcery:inline:Step.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.a) {
        _ = try container.decodeNil(forKey: .a)
        self = .a
    } else if container.contains(.b) {
        _ = try container.decodeNil(forKey: .b)
        self = .b
    } else if container.contains(.c) {
        _ = try container.decodeNil(forKey: .c)
        self = .c
    } else if container.contains(.d) {
        _ = try container.decodeNil(forKey: .d)
        self = .d
    } else if container.contains(.e) {
        _ = try container.decodeNil(forKey: .e)
        self = .e
    } else if container.contains(.f) {
        _ = try container.decodeNil(forKey: .f)
        self = .f
    } else if container.contains(.g) {
        _ = try container.decodeNil(forKey: .g)
        self = .g
    } else {
        throw DecodingError.typeMismatch(
            Step.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:StickLocation.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .center:
        try container.encodeNil(forKey: .center)
    case .rim:
        try container.encodeNil(forKey: .rim)
    case .cymbalBell:
        try container.encodeNil(forKey: .cymbalBell)
    case .cymbalEdge:
        try container.encodeNil(forKey: .cymbalEdge)
    }
}
// sourcery:end

// sourcery:inline:StickLocation.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.center) {
        _ = try container.decodeNil(forKey: .center)
        self = .center
    } else if container.contains(.rim) {
        _ = try container.decodeNil(forKey: .rim)
        self = .rim
    } else if container.contains(.cymbalBell) {
        _ = try container.decodeNil(forKey: .cymbalBell)
        self = .cymbalBell
    } else if container.contains(.cymbalEdge) {
        _ = try container.decodeNil(forKey: .cymbalEdge)
        self = .cymbalEdge
    } else {
        throw DecodingError.typeMismatch(
            StickLocation.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:StickMaterial.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .soft:
        try container.encodeNil(forKey: .soft)
    case .medium:
        try container.encodeNil(forKey: .medium)
    case .hard:
        try container.encodeNil(forKey: .hard)
    case .shaded:
        try container.encodeNil(forKey: .shaded)
    case .x:
        try container.encodeNil(forKey: .x)
    }
}
// sourcery:end

// sourcery:inline:StickMaterial.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.soft) {
        _ = try container.decodeNil(forKey: .soft)
        self = .soft
    } else if container.contains(.medium) {
        _ = try container.decodeNil(forKey: .medium)
        self = .medium
    } else if container.contains(.hard) {
        _ = try container.decodeNil(forKey: .hard)
        self = .hard
    } else if container.contains(.shaded) {
        _ = try container.decodeNil(forKey: .shaded)
        self = .shaded
    } else if container.contains(.x) {
        _ = try container.decodeNil(forKey: .x)
        self = .x
    } else {
        throw DecodingError.typeMismatch(
            StickMaterial.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:StickType.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .bassDrum:
        try container.encodeNil(forKey: .bassDrum)
    case .doubleBassDrum:
        try container.encodeNil(forKey: .doubleBassDrum)
    case .timpani:
        try container.encodeNil(forKey: .timpani)
    case .xylophone:
        try container.encodeNil(forKey: .xylophone)
    case .yarn:
        try container.encodeNil(forKey: .yarn)
    }
}
// sourcery:end

// sourcery:inline:StickType.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.bassDrum) {
        _ = try container.decodeNil(forKey: .bassDrum)
        self = .bassDrum
    } else if container.contains(.doubleBassDrum) {
        _ = try container.decodeNil(forKey: .doubleBassDrum)
        self = .doubleBassDrum
    } else if container.contains(.timpani) {
        _ = try container.decodeNil(forKey: .timpani)
        self = .timpani
    } else if container.contains(.xylophone) {
        _ = try container.decodeNil(forKey: .xylophone)
        self = .xylophone
    } else if container.contains(.yarn) {
        _ = try container.decodeNil(forKey: .yarn)
        self = .yarn
    } else {
        throw DecodingError.typeMismatch(
            StickType.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Syllabic.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .single:
        try container.encodeNil(forKey: .single)
    case .begin:
        try container.encodeNil(forKey: .begin)
    case .end:
        try container.encodeNil(forKey: .end)
    case .middle:
        try container.encodeNil(forKey: .middle)
    }
}
// sourcery:end

// sourcery:inline:Syllabic.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.single) {
        _ = try container.decodeNil(forKey: .single)
        self = .single
    } else if container.contains(.begin) {
        _ = try container.decodeNil(forKey: .begin)
        self = .begin
    } else if container.contains(.end) {
        _ = try container.decodeNil(forKey: .end)
        self = .end
    } else if container.contains(.middle) {
        _ = try container.decodeNil(forKey: .middle)
        self = .middle
    } else {
        throw DecodingError.typeMismatch(
            Syllabic.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:SymbolSize.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .full:
        try container.encodeNil(forKey: .full)
    case .cue:
        try container.encodeNil(forKey: .cue)
    case .large:
        try container.encodeNil(forKey: .large)
    }
}
// sourcery:end

// sourcery:inline:SymbolSize.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.full) {
        _ = try container.decodeNil(forKey: .full)
        self = .full
    } else if container.contains(.cue) {
        _ = try container.decodeNil(forKey: .cue)
        self = .cue
    } else if container.contains(.large) {
        _ = try container.decodeNil(forKey: .large)
        self = .large
    } else {
        throw DecodingError.typeMismatch(
            SymbolSize.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:TextDirection.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .leftToRightEmbed:
        try container.encodeNil(forKey: .leftToRightEmbed)
    case .rightToLeftEmbed:
        try container.encodeNil(forKey: .rightToLeftEmbed)
    case .leftToRightOverride:
        try container.encodeNil(forKey: .leftToRightOverride)
    case .rightToLeftOverride:
        try container.encodeNil(forKey: .rightToLeftOverride)
    }
}
// sourcery:end

// sourcery:inline:TextDirection.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.leftToRightEmbed) {
        _ = try container.decodeNil(forKey: .leftToRightEmbed)
        self = .leftToRightEmbed
    } else if container.contains(.rightToLeftEmbed) {
        _ = try container.decodeNil(forKey: .rightToLeftEmbed)
        self = .rightToLeftEmbed
    } else if container.contains(.leftToRightOverride) {
        _ = try container.decodeNil(forKey: .leftToRightOverride)
        self = .leftToRightOverride
    } else if container.contains(.rightToLeftOverride) {
        _ = try container.decodeNil(forKey: .rightToLeftOverride)
        self = .rightToLeftOverride
    } else {
        throw DecodingError.typeMismatch(
            TextDirection.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:TimeRelation.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .parentheses:
        try container.encodeNil(forKey: .parentheses)
    case .bracket:
        try container.encodeNil(forKey: .bracket)
    case .equals:
        try container.encodeNil(forKey: .equals)
    case .slash:
        try container.encodeNil(forKey: .slash)
    case .space:
        try container.encodeNil(forKey: .space)
    case .hyphen:
        try container.encodeNil(forKey: .hyphen)
    }
}
// sourcery:end

// sourcery:inline:TimeRelation.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.parentheses) {
        _ = try container.decodeNil(forKey: .parentheses)
        self = .parentheses
    } else if container.contains(.bracket) {
        _ = try container.decodeNil(forKey: .bracket)
        self = .bracket
    } else if container.contains(.equals) {
        _ = try container.decodeNil(forKey: .equals)
        self = .equals
    } else if container.contains(.slash) {
        _ = try container.decodeNil(forKey: .slash)
        self = .slash
    } else if container.contains(.space) {
        _ = try container.decodeNil(forKey: .space)
        self = .space
    } else if container.contains(.hyphen) {
        _ = try container.decodeNil(forKey: .hyphen)
        self = .hyphen
    } else {
        throw DecodingError.typeMismatch(
            TimeRelation.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:TimeSeparator.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .none:
        try container.encodeNil(forKey: .none)
    case .horizontal:
        try container.encodeNil(forKey: .horizontal)
    case .diagonal:
        try container.encodeNil(forKey: .diagonal)
    case .vertical:
        try container.encodeNil(forKey: .vertical)
    case .adjacent:
        try container.encodeNil(forKey: .adjacent)
    }
}
// sourcery:end

// sourcery:inline:TimeSeparator.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else if container.contains(.horizontal) {
        _ = try container.decodeNil(forKey: .horizontal)
        self = .horizontal
    } else if container.contains(.diagonal) {
        _ = try container.decodeNil(forKey: .diagonal)
        self = .diagonal
    } else if container.contains(.vertical) {
        _ = try container.decodeNil(forKey: .vertical)
        self = .vertical
    } else if container.contains(.adjacent) {
        _ = try container.decodeNil(forKey: .adjacent)
        self = .adjacent
    } else {
        throw DecodingError.typeMismatch(
            TimeSeparator.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:TimeSymbol.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .common:
        try container.encodeNil(forKey: .common)
    case .cut:
        try container.encodeNil(forKey: .cut)
    case .singleNumber:
        try container.encodeNil(forKey: .singleNumber)
    case .note:
        try container.encodeNil(forKey: .note)
    case .dottedNote:
        try container.encodeNil(forKey: .dottedNote)
    case .normal:
        try container.encodeNil(forKey: .normal)
    }
}
// sourcery:end

// sourcery:inline:TimeSymbol.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.common) {
        _ = try container.decodeNil(forKey: .common)
        self = .common
    } else if container.contains(.cut) {
        _ = try container.decodeNil(forKey: .cut)
        self = .cut
    } else if container.contains(.singleNumber) {
        _ = try container.decodeNil(forKey: .singleNumber)
        self = .singleNumber
    } else if container.contains(.note) {
        _ = try container.decodeNil(forKey: .note)
        self = .note
    } else if container.contains(.dottedNote) {
        _ = try container.decodeNil(forKey: .dottedNote)
        self = .dottedNote
    } else if container.contains(.normal) {
        _ = try container.decodeNil(forKey: .normal)
        self = .normal
    } else {
        throw DecodingError.typeMismatch(
            TimeSymbol.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:TipDirection.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .left:
        try container.encodeNil(forKey: .left)
    case .up:
        try container.encodeNil(forKey: .up)
    case .right:
        try container.encodeNil(forKey: .right)
    case .down:
        try container.encodeNil(forKey: .down)
    case .northwest:
        try container.encodeNil(forKey: .northwest)
    case .northeast:
        try container.encodeNil(forKey: .northeast)
    case .southeast:
        try container.encodeNil(forKey: .southeast)
    case .southwest:
        try container.encodeNil(forKey: .southwest)
    case .leftRight:
        try container.encodeNil(forKey: .leftRight)
    case .upDown:
        try container.encodeNil(forKey: .upDown)
    case .northwestSoutheast:
        try container.encodeNil(forKey: .northwestSoutheast)
    case .northeastSouthwest:
        try container.encodeNil(forKey: .northeastSouthwest)
    }
}
// sourcery:end

// sourcery:inline:TipDirection.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.left) {
        _ = try container.decodeNil(forKey: .left)
        self = .left
    } else if container.contains(.up) {
        _ = try container.decodeNil(forKey: .up)
        self = .up
    } else if container.contains(.right) {
        _ = try container.decodeNil(forKey: .right)
        self = .right
    } else if container.contains(.down) {
        _ = try container.decodeNil(forKey: .down)
        self = .down
    } else if container.contains(.northwest) {
        _ = try container.decodeNil(forKey: .northwest)
        self = .northwest
    } else if container.contains(.northeast) {
        _ = try container.decodeNil(forKey: .northeast)
        self = .northeast
    } else if container.contains(.southeast) {
        _ = try container.decodeNil(forKey: .southeast)
        self = .southeast
    } else if container.contains(.southwest) {
        _ = try container.decodeNil(forKey: .southwest)
        self = .southwest
    } else if container.contains(.leftRight) {
        _ = try container.decodeNil(forKey: .leftRight)
        self = .leftRight
    } else if container.contains(.upDown) {
        _ = try container.decodeNil(forKey: .upDown)
        self = .upDown
    } else if container.contains(.northwestSoutheast) {
        _ = try container.decodeNil(forKey: .northwestSoutheast)
        self = .northwestSoutheast
    } else if container.contains(.northeastSouthwest) {
        _ = try container.decodeNil(forKey: .northeastSouthwest)
        self = .northeastSouthwest
    } else {
        throw DecodingError.typeMismatch(
            TipDirection.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:TopBottom.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .top:
        try container.encodeNil(forKey: .top)
    case .bottom:
        try container.encodeNil(forKey: .bottom)
    }
}
// sourcery:end

// sourcery:inline:TopBottom.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.top) {
        _ = try container.decodeNil(forKey: .top)
        self = .top
    } else if container.contains(.bottom) {
        _ = try container.decodeNil(forKey: .bottom)
        self = .bottom
    } else {
        throw DecodingError.typeMismatch(
            TopBottom.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:TrillStep.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .whole:
        try container.encodeNil(forKey: .whole)
    case .half:
        try container.encodeNil(forKey: .half)
    case .unison:
        try container.encodeNil(forKey: .unison)
    }
}
// sourcery:end

// sourcery:inline:TrillStep.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.whole) {
        _ = try container.decodeNil(forKey: .whole)
        self = .whole
    } else if container.contains(.half) {
        _ = try container.decodeNil(forKey: .half)
        self = .half
    } else if container.contains(.unison) {
        _ = try container.decodeNil(forKey: .unison)
        self = .unison
    } else {
        throw DecodingError.typeMismatch(
            TrillStep.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:TwoNoteTurn.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .whole:
        try container.encodeNil(forKey: .whole)
    case .half:
        try container.encodeNil(forKey: .half)
    case .none:
        try container.encodeNil(forKey: .none)
    }
}
// sourcery:end

// sourcery:inline:TwoNoteTurn.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.whole) {
        _ = try container.decodeNil(forKey: .whole)
        self = .whole
    } else if container.contains(.half) {
        _ = try container.decodeNil(forKey: .half)
        self = .half
    } else if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else {
        throw DecodingError.typeMismatch(
            TwoNoteTurn.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:UpDown.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .up:
        try container.encodeNil(forKey: .up)
    case .down:
        try container.encodeNil(forKey: .down)
    }
}
// sourcery:end

// sourcery:inline:UpDown.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.up) {
        _ = try container.decodeNil(forKey: .up)
        self = .up
    } else if container.contains(.down) {
        _ = try container.decodeNil(forKey: .down)
        self = .down
    } else {
        throw DecodingError.typeMismatch(
            UpDown.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:UpDownStopContinue.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .up:
        try container.encodeNil(forKey: .up)
    case .down:
        try container.encodeNil(forKey: .down)
    case .stop:
        try container.encodeNil(forKey: .stop)
    case .`continue`:
        try container.encodeNil(forKey: .`continue`)
    }
}
// sourcery:end

// sourcery:inline:UpDownStopContinue.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.up) {
        _ = try container.decodeNil(forKey: .up)
        self = .up
    } else if container.contains(.down) {
        _ = try container.decodeNil(forKey: .down)
        self = .down
    } else if container.contains(.stop) {
        _ = try container.decodeNil(forKey: .stop)
        self = .stop
    } else if container.contains(.`continue`) {
        _ = try container.decodeNil(forKey: .`continue`)
        self = .`continue`
    } else {
        throw DecodingError.typeMismatch(
            UpDownStopContinue.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:UprightInverted.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .upright:
        try container.encodeNil(forKey: .upright)
    case .inverted:
        try container.encodeNil(forKey: .inverted)
    }
}
// sourcery:end

// sourcery:inline:UprightInverted.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.upright) {
        _ = try container.decodeNil(forKey: .upright)
        self = .upright
    } else if container.contains(.inverted) {
        _ = try container.decodeNil(forKey: .inverted)
        self = .inverted
    } else {
        throw DecodingError.typeMismatch(
            UprightInverted.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:VAlign.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .top:
        try container.encodeNil(forKey: .top)
    case .middle:
        try container.encodeNil(forKey: .middle)
    case .bottom:
        try container.encodeNil(forKey: .bottom)
    case .baseline:
        try container.encodeNil(forKey: .baseline)
    }
}
// sourcery:end

// sourcery:inline:VAlign.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.top) {
        _ = try container.decodeNil(forKey: .top)
        self = .top
    } else if container.contains(.middle) {
        _ = try container.decodeNil(forKey: .middle)
        self = .middle
    } else if container.contains(.bottom) {
        _ = try container.decodeNil(forKey: .bottom)
        self = .bottom
    } else if container.contains(.baseline) {
        _ = try container.decodeNil(forKey: .baseline)
        self = .baseline
    } else {
        throw DecodingError.typeMismatch(
            VAlign.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:VAlignImage.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .top:
        try container.encodeNil(forKey: .top)
    case .middle:
        try container.encodeNil(forKey: .middle)
    case .bottom:
        try container.encodeNil(forKey: .bottom)
    }
}
// sourcery:end

// sourcery:inline:VAlignImage.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.top) {
        _ = try container.decodeNil(forKey: .top)
        self = .top
    } else if container.contains(.middle) {
        _ = try container.decodeNil(forKey: .middle)
        self = .middle
    } else if container.contains(.bottom) {
        _ = try container.decodeNil(forKey: .bottom)
        self = .bottom
    } else {
        throw DecodingError.typeMismatch(
            VAlignImage.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:WedgeType.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .crescendo:
        try container.encodeNil(forKey: .crescendo)
    case .diminuendo:
        try container.encodeNil(forKey: .diminuendo)
    case .stop:
        try container.encodeNil(forKey: .stop)
    case .`continue`:
        try container.encodeNil(forKey: .`continue`)
    }
}
// sourcery:end

// sourcery:inline:WedgeType.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.crescendo) {
        _ = try container.decodeNil(forKey: .crescendo)
        self = .crescendo
    } else if container.contains(.diminuendo) {
        _ = try container.decodeNil(forKey: .diminuendo)
        self = .diminuendo
    } else if container.contains(.stop) {
        _ = try container.decodeNil(forKey: .stop)
        self = .stop
    } else if container.contains(.`continue`) {
        _ = try container.decodeNil(forKey: .`continue`)
        self = .`continue`
    } else {
        throw DecodingError.typeMismatch(
            WedgeType.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Winged.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .none:
        try container.encodeNil(forKey: .none)
    case .straight:
        try container.encodeNil(forKey: .straight)
    case .curved:
        try container.encodeNil(forKey: .curved)
    case .doubleStraight:
        try container.encodeNil(forKey: .doubleStraight)
    case .doubleCurved:
        try container.encodeNil(forKey: .doubleCurved)
    }
}
// sourcery:end

// sourcery:inline:Winged.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.none) {
        _ = try container.decodeNil(forKey: .none)
        self = .none
    } else if container.contains(.straight) {
        _ = try container.decodeNil(forKey: .straight)
        self = .straight
    } else if container.contains(.curved) {
        _ = try container.decodeNil(forKey: .curved)
        self = .curved
    } else if container.contains(.doubleStraight) {
        _ = try container.decodeNil(forKey: .doubleStraight)
        self = .doubleStraight
    } else if container.contains(.doubleCurved) {
        _ = try container.decodeNil(forKey: .doubleCurved)
        self = .doubleCurved
    } else {
        throw DecodingError.typeMismatch(
            Winged.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:Wood.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .boardClapper:
        try container.encodeNil(forKey: .boardClapper)
    case .cabasa:
        try container.encodeNil(forKey: .cabasa)
    case .castanets:
        try container.encodeNil(forKey: .castanets)
    case .claves:
        try container.encodeNil(forKey: .claves)
    case .guiro:
        try container.encodeNil(forKey: .guiro)
    case .logDrum:
        try container.encodeNil(forKey: .logDrum)
    case .maraca:
        try container.encodeNil(forKey: .maraca)
    case .maracas:
        try container.encodeNil(forKey: .maracas)
    case .ratchet:
        try container.encodeNil(forKey: .ratchet)
    case .sandpaperBlocks:
        try container.encodeNil(forKey: .sandpaperBlocks)
    case .slitDrum:
        try container.encodeNil(forKey: .slitDrum)
    case .templeBlock:
        try container.encodeNil(forKey: .templeBlock)
    case .vibraslap:
        try container.encodeNil(forKey: .vibraslap)
    case .woodBlock:
        try container.encodeNil(forKey: .woodBlock)
    }
}
// sourcery:end

// sourcery:inline:Wood.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.boardClapper) {
        _ = try container.decodeNil(forKey: .boardClapper)
        self = .boardClapper
    } else if container.contains(.cabasa) {
        _ = try container.decodeNil(forKey: .cabasa)
        self = .cabasa
    } else if container.contains(.castanets) {
        _ = try container.decodeNil(forKey: .castanets)
        self = .castanets
    } else if container.contains(.claves) {
        _ = try container.decodeNil(forKey: .claves)
        self = .claves
    } else if container.contains(.guiro) {
        _ = try container.decodeNil(forKey: .guiro)
        self = .guiro
    } else if container.contains(.logDrum) {
        _ = try container.decodeNil(forKey: .logDrum)
        self = .logDrum
    } else if container.contains(.maraca) {
        _ = try container.decodeNil(forKey: .maraca)
        self = .maraca
    } else if container.contains(.maracas) {
        _ = try container.decodeNil(forKey: .maracas)
        self = .maracas
    } else if container.contains(.ratchet) {
        _ = try container.decodeNil(forKey: .ratchet)
        self = .ratchet
    } else if container.contains(.sandpaperBlocks) {
        _ = try container.decodeNil(forKey: .sandpaperBlocks)
        self = .sandpaperBlocks
    } else if container.contains(.slitDrum) {
        _ = try container.decodeNil(forKey: .slitDrum)
        self = .slitDrum
    } else if container.contains(.templeBlock) {
        _ = try container.decodeNil(forKey: .templeBlock)
        self = .templeBlock
    } else if container.contains(.vibraslap) {
        _ = try container.decodeNil(forKey: .vibraslap)
        self = .vibraslap
    } else if container.contains(.woodBlock) {
        _ = try container.decodeNil(forKey: .woodBlock)
        self = .woodBlock
    } else {
        throw DecodingError.typeMismatch(
            Wood.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
// sourcery:inline:YesNo.AutoXMLChoiceEncoding
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .yes:
        try container.encodeNil(forKey: .yes)
    case .no:
        try container.encodeNil(forKey: .no)
    }
}
// sourcery:end

// sourcery:inline:YesNo.AutoXMLChoiceDecoding
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.yes) {
        _ = try container.decodeNil(forKey: .yes)
        self = .yes
    } else if container.contains(.no) {
        _ = try container.decodeNil(forKey: .no)
        self = .no
    } else {
        throw DecodingError.typeMismatch(
            YesNo.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end


// sourcery:inline:YesNoNumber.CodingKeys.AutoXMLChoiceEncoding
internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    switch self {
    case .yes:
        try container.encodeNil(forKey: .yes)
    case .no:
        try container.encodeNil(forKey: .no)
    case .number:
        try container.encodeNil(forKey: .number)
    }
}
// sourcery:end

// sourcery:inline:YesNoNumber.CodingKeys.AutoXMLChoiceDecoding
internal init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    func decode <T> (_ key: CodingKeys) throws -> T where T: Codable {
        return try container.decode(T.self, forKey: key)
    }

    if container.contains(.yes) {
        _ = try container.decodeNil(forKey: .yes)
        self = .yes
    } else if container.contains(.no) {
        _ = try container.decodeNil(forKey: .no)
        self = .no
    } else if container.contains(.number) {
        _ = try container.decodeNil(forKey: .number)
        self = .number
    } else {
        throw DecodingError.typeMismatch(
            YesNoNumber.CodingKeys.self,
            DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Unrecognized choice"
            )
        )
    }
}
// sourcery:end
