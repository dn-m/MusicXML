// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// sourcery:inline:Accidental.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(cautionary, forKey: .cautionary)
    try container.encodeIfPresent(editorial, forKey: .editorial)
    try container.encodeIfPresent(parentheses, forKey: .parentheses)
    try container.encodeIfPresent(bracket, forKey: .bracket)
    try container.encodeIfPresent(size, forKey: .size)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:Accidental.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(AccidentalValue.self, forKey: .value)
    cautionary = try container.decodeIfPresent(Bool.self, forKey: .cautionary)
    editorial = try container.decodeIfPresent(Bool.self, forKey: .editorial)
    parentheses = try container.decodeIfPresent(Bool.self, forKey: .parentheses)
    bracket = try container.decodeIfPresent(Bool.self, forKey: .bracket)
    size = try container.decodeIfPresent(SymbolSize.self, forKey: .size)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:AccidentalMark.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(placement, forKey: .placement)
    try position.encode(to: encoder)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:AccidentalMark.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(AccidentalValue.self, forKey: .value)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    position = try Position(from: decoder)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:AccidentalText.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(justify, forKey: .justify)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(hAlign, forKey: .hAlign)
    try container.encodeIfPresent(vAlign, forKey: .vAlign)
    try container.encodeIfPresent(underline, forKey: .underline)
    try container.encodeIfPresent(overline, forKey: .overline)
    try container.encodeIfPresent(lineThrough, forKey: .lineThrough)
    try container.encodeIfPresent(rotation, forKey: .rotation)
    try container.encodeIfPresent(letterSpacing, forKey: .letterSpacing)
    try container.encodeIfPresent(lineHeight, forKey: .lineHeight)
    try container.encodeIfPresent(direction, forKey: .direction)
    try container.encodeIfPresent(enclosure, forKey: .enclosure)
    try container.encode(value, forKey: .value)
}
// sourcery:end

// sourcery:inline:AccidentalText.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    justify = try container.decodeIfPresent(LeftCenterRight.self, forKey: .justify)
    printStyle = try PrintStyle(from: decoder)
    hAlign = try container.decodeIfPresent(LeftCenterRight.self, forKey: .hAlign)
    vAlign = try container.decodeIfPresent(VAlign.self, forKey: .vAlign)
    underline = try container.decodeIfPresent(Int.self, forKey: .underline)
    overline = try container.decodeIfPresent(Int.self, forKey: .overline)
    lineThrough = try container.decodeIfPresent(Int.self, forKey: .lineThrough)
    rotation = try container.decodeIfPresent(Double.self, forKey: .rotation)
    letterSpacing = try container.decodeIfPresent(NumberOrNormal.self, forKey: .letterSpacing)
    lineHeight = try container.decodeIfPresent(NumberOrNormal.self, forKey: .lineHeight)
    direction = try container.decodeIfPresent(TextDirection.self, forKey: .direction)
    enclosure = try container.decodeIfPresent(EnclosureShape.self, forKey: .enclosure)
    value = try container.decode(AccidentalValue.self, forKey: .value)
}
// sourcery:end
// sourcery:inline:Accord.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(string, forKey: .string)
    try container.encode(tuningStep, forKey: .tuningStep)
    try container.encodeIfPresent(tuningAlter, forKey: .tuningAlter)
    try container.encodeIfPresent(tuningOctave, forKey: .tuningOctave)
}
// sourcery:end

// sourcery:inline:Accord.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    string = try container.decode(Int.self, forKey: .string)
    tuningStep = try container.decode(Step.self, forKey: .tuningStep)
    tuningAlter = try container.decodeIfPresent(Double.self, forKey: .tuningAlter)
    tuningOctave = try container.decodeIfPresent(Int.self, forKey: .tuningOctave)
}
// sourcery:end
// sourcery:inline:AccordionRegistration.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try printStyleAlign.encode(to: encoder)
    try container.encode(high, forKey: .high)
    try container.encodeIfPresent(middle, forKey: .middle)
    try container.encode(low, forKey: .low)
}
// sourcery:end

// sourcery:inline:AccordionRegistration.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    printStyleAlign = try PrintStyleAlign(from: decoder)
    high = try container.decode(Bool.self, forKey: .high)
    middle = try container.decodeIfPresent(AccordionMiddle.self, forKey: .middle)
    low = try container.decode(Bool.self, forKey: .low)
}
// sourcery:end
// sourcery:inline:Appearance.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(lineWidths, forKey: .lineWidths)
    try container.encode(noteSizes, forKey: .noteSizes)
    try container.encode(distances, forKey: .distances)
    try container.encode(otherAppearances, forKey: .otherAppearances)
}
// sourcery:end

// sourcery:inline:Appearance.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    lineWidths = try container.decode([LineWidth].self, forKey: .lineWidths)
    noteSizes = try container.decode([NoteSize].self, forKey: .noteSizes)
    distances = try container.decode([Distance].self, forKey: .distances)
    otherAppearances = try container.decode([OtherAppearance].self, forKey: .otherAppearances)
}
// sourcery:end
// sourcery:inline:Arpeggiate.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(direction, forKey: .direction)
    try position.encode(to: encoder)
    try container.encodeIfPresent(placement, forKey: .placement)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:Arpeggiate.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    direction = try container.decodeIfPresent(UpDown.self, forKey: .direction)
    position = try Position?(from: decoder)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:Arrow.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(kind, forKey: .kind)
    try position.encode(to: encoder)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(placement, forKey: .placement)
}
// sourcery:end

// sourcery:inline:Arrow.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    kind = try container.decode(Kind.self, forKey: .kind)
    position = try Position(from: decoder)
    printStyle = try PrintStyle(from: decoder)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
}
// sourcery:end
// sourcery:inline:Articulations.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(values, forKey: .values)
}
// sourcery:end

// sourcery:inline:Articulations.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    values = try container.decode([Articulation].self, forKey: .values)
}
// sourcery:end
// sourcery:inline:Attributes.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(footnote, forKey: .footnote)
    try container.encodeIfPresent(level, forKey: .level)
    try container.encodeIfPresent(divisions, forKey: .divisions)
    try container.encodeIfPresent(keys, forKey: .keys)
    try container.encodeIfPresent(times, forKey: .times)
    try container.encodeIfPresent(staves, forKey: .staves)
    try container.encodeIfPresent(partSymbol, forKey: .partSymbol)
    try container.encodeIfPresent(instruments, forKey: .instruments)
    try container.encodeIfPresent(clefs, forKey: .clefs)
    try container.encodeIfPresent(staffDetails, forKey: .staffDetails)
    try container.encodeIfPresent(transpose, forKey: .transpose)
    try container.encodeIfPresent(measureStyles, forKey: .measureStyles)
}
// sourcery:end

// sourcery:inline:Attributes.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    footnote = try container.decodeIfPresent(FormattedText.self, forKey: .footnote)
    level = try container.decodeIfPresent(Level.self, forKey: .level)
    divisions = try container.decodeIfPresent(Int.self, forKey: .divisions)
    keys = try container.decodeIfPresent([Key].self, forKey: .keys)
    times = try container.decodeIfPresent([Time].self, forKey: .times)
    staves = try container.decodeIfPresent(Int.self, forKey: .staves)
    partSymbol = try container.decodeIfPresent(PartSymbol.self, forKey: .partSymbol)
    instruments = try container.decodeIfPresent(Int.self, forKey: .instruments)
    clefs = try container.decodeIfPresent([Clef].self, forKey: .clefs)
    staffDetails = try container.decodeIfPresent([StaffDetails].self, forKey: .staffDetails)
    transpose = try container.decodeIfPresent([Transpose].self, forKey: .transpose)
    measureStyles = try container.decodeIfPresent([MeasureStyle].self, forKey: .measureStyles)
}
// sourcery:end
// sourcery:inline:Backup.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(duration, forKey: .duration)
    try container.encodeIfPresent(editorial, forKey: .editorial)
}
// sourcery:end

// sourcery:inline:Backup.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    duration = try container.decode(Int.self, forKey: .duration)
    editorial = try container.decodeIfPresent(Editorial.self, forKey: .editorial)
}
// sourcery:end
// sourcery:inline:BarStyleColor.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:BarStyleColor.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(BarStyle.self, forKey: .value)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:Barline.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(location, forKey: .location)
    try segno.encode(to: encoder)
    try coda.encode(to: encoder)
    try container.encodeIfPresent(divisions, forKey: .divisions)
    try container.encodeIfPresent(barStyle, forKey: .barStyle)
    try container.encodeIfPresent(editorial, forKey: .editorial)
    try container.encodeIfPresent(wavyLine, forKey: .wavyLine)
    try container.encodeIfPresent(fermata, forKey: .fermata)
    try container.encodeIfPresent(ending, forKey: .ending)
    try container.encodeIfPresent(`repeat`, forKey: .`repeat`)
}
// sourcery:end

// sourcery:inline:Barline.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    location = try container.decodeIfPresent(RightLeftMiddle.self, forKey: .location)
    segno = try PrintStyleAlign?(from: decoder)
    coda = try PrintStyleAlign?(from: decoder)
    divisions = try container.decodeIfPresent(Int.self, forKey: .divisions)
    barStyle = try container.decodeIfPresent(BarStyleColor.self, forKey: .barStyle)
    editorial = try container.decodeIfPresent(Editorial.self, forKey: .editorial)
    wavyLine = try container.decodeIfPresent(WavyLine.self, forKey: .wavyLine)
    fermata = try container.decodeIfPresent(Fermata.self, forKey: .fermata)
    ending = try container.decodeIfPresent(Ending.self, forKey: .ending)
    `repeat` = try container.decodeIfPresent(Repeat.self, forKey: .`repeat`)
}
// sourcery:end
// sourcery:inline:Barre.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encode(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:Barre.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(StartStop.self, forKey: .type)
    color = try container.decode(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:Bass.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(step, forKey: .step)
    try container.encodeIfPresent(alter, forKey: .alter)
}
// sourcery:end

// sourcery:inline:Bass.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    step = try container.decode(BassStep.self, forKey: .step)
    alter = try container.decodeIfPresent(BassAlter.self, forKey: .alter)
}
// sourcery:end
// sourcery:inline:BassAlter.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(location, forKey: .location)
}
// sourcery:end

// sourcery:inline:BassAlter.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Double.self, forKey: .value)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    printStyle = try PrintStyle(from: decoder)
    location = try container.decodeIfPresent(LeftRight.self, forKey: .location)
}
// sourcery:end
// sourcery:inline:BassStep.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(text, forKey: .text)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:BassStep.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Step.self, forKey: .value)
    text = try container.decodeIfPresent(String.self, forKey: .text)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:Beam.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(repeater, forKey: .repeater)
    try container.encodeIfPresent(fan, forKey: .fan)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:Beam.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(BeamValue.self, forKey: .value)
    number = try container.decodeIfPresent(BeamLevel.self, forKey: .number)
    repeater = try container.decodeIfPresent(Bool.self, forKey: .repeater)
    fan = try container.decodeIfPresent(Fan.self, forKey: .fan)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:BeatRepeat.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encode(slashes, forKey: .slashes)
    try container.encode(useDots, forKey: .useDots)
}
// sourcery:end

// sourcery:inline:BeatRepeat.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(StartStop.self, forKey: .type)
    slashes = try container.decode(Int.self, forKey: .slashes)
    useDots = try container.decode(Bool.self, forKey: .useDots)
}
// sourcery:end
// sourcery:inline:Beater.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(tip, forKey: .tip)
}
// sourcery:end

// sourcery:inline:Beater.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(BeaterValue.self, forKey: .value)
    tip = try container.decodeIfPresent(TipDirection.self, forKey: .tip)
}
// sourcery:end
// sourcery:inline:Bend.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(accelerate, forKey: .accelerate)
    try container.encodeIfPresent(beats, forKey: .beats)
    try container.encodeIfPresent(firstBeat, forKey: .firstBeat)
    try container.encodeIfPresent(lastBeat, forKey: .lastBeat)
    try container.encodeIfPresent(bendAlter, forKey: .bendAlter)
    try container.encodeIfPresent(prependOrRelease, forKey: .prependOrRelease)
    try container.encodeIfPresent(withBar, forKey: .withBar)
}
// sourcery:end

// sourcery:inline:Bend.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    printStyle = try PrintStyle(from: decoder)
    accelerate = try container.decodeIfPresent(Bool.self, forKey: .accelerate)
    beats = try container.decodeIfPresent(Bool.self, forKey: .beats)
    firstBeat = try container.decodeIfPresent(Double.self, forKey: .firstBeat)
    lastBeat = try container.decodeIfPresent(Double.self, forKey: .lastBeat)
    bendAlter = try container.decodeIfPresent(Double.self, forKey: .bendAlter)
    prependOrRelease = try container.decodeIfPresent(PreBendOrRelease.self, forKey: .prependOrRelease)
    withBar = try container.decodeIfPresent(PlacementText.self, forKey: .withBar)
}
// sourcery:end
// sourcery:inline:BendSound.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(accelerate, forKey: .accelerate)
    try container.encodeIfPresent(beats, forKey: .beats)
    try container.encodeIfPresent(firstBeat, forKey: .firstBeat)
    try container.encodeIfPresent(lastBeat, forKey: .lastBeat)
}
// sourcery:end

// sourcery:inline:BendSound.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    accelerate = try container.decodeIfPresent(Bool.self, forKey: .accelerate)
    beats = try container.decodeIfPresent(Int.self, forKey: .beats)
    firstBeat = try container.decodeIfPresent(Int.self, forKey: .firstBeat)
    lastBeat = try container.decodeIfPresent(Int.self, forKey: .lastBeat)
}
// sourcery:end
// sourcery:inline:Bezier.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(bezierX, forKey: .bezierX)
    try container.encode(bezierY, forKey: .bezierY)
    try container.encode(bezierX2, forKey: .bezierX2)
    try container.encode(bezierY2, forKey: .bezierY2)
    try container.encode(bezierOffset, forKey: .bezierOffset)
    try container.encode(bezierOffset2, forKey: .bezierOffset2)
}
// sourcery:end

// sourcery:inline:Bezier.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    bezierX = try container.decode(Int.self, forKey: .bezierX)
    bezierY = try container.decode(Int.self, forKey: .bezierY)
    bezierX2 = try container.decode(Int.self, forKey: .bezierX2)
    bezierY2 = try container.decode(Int.self, forKey: .bezierY2)
    bezierOffset = try container.decode(Int.self, forKey: .bezierOffset)
    bezierOffset2 = try container.decode(Int.self, forKey: .bezierOffset2)
}
// sourcery:end
// sourcery:inline:Bookmark.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encodeIfPresent(name, forKey: .name)
    try container.encodeIfPresent(element, forKey: .element)
    try container.encodeIfPresent(position, forKey: .position)
}
// sourcery:end

// sourcery:inline:Bookmark.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    element = try container.decodeIfPresent(String.self, forKey: .element)
    position = try container.decodeIfPresent(Int.self, forKey: .position)
}
// sourcery:end
// sourcery:inline:Bracket.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encode(lineEnd, forKey: .lineEnd)
    try container.encodeIfPresent(endLength, forKey: .endLength)
    try container.encodeIfPresent(lineType, forKey: .lineType)
    try container.encodeIfPresent(dashLength, forKey: .dashLength)
    try container.encodeIfPresent(spaceLength, forKey: .spaceLength)
    try position.encode(to: encoder)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:Bracket.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(StartStopContinue.self, forKey: .type)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    lineEnd = try container.decode(LineEnd.self, forKey: .lineEnd)
    endLength = try container.decodeIfPresent(Tenths.self, forKey: .endLength)
    lineType = try container.decodeIfPresent(LineType.self, forKey: .lineType)
    dashLength = try container.decodeIfPresent(Tenths.self, forKey: .dashLength)
    spaceLength = try container.decodeIfPresent(Tenths.self, forKey: .spaceLength)
    position = try Position(from: decoder)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:BreathMark.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(placement, forKey: .placement)
    try position.encode(to: encoder)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:BreathMark.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(BreathMarkValue.self, forKey: .value)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    position = try Position(from: decoder)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:Cancel.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(fifths, forKey: .fifths)
    try container.encode(location, forKey: .location)
}
// sourcery:end

// sourcery:inline:Cancel.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    fifths = try container.decode(Int.self, forKey: .fifths)
    location = try container.decode(CancelLocation.self, forKey: .location)
}
// sourcery:end
// sourcery:inline:Clef.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(additional, forKey: .additional)
    try container.encodeIfPresent(size, forKey: .size)
    try container.encodeIfPresent(afterBarline, forKey: .afterBarline)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try container.encode(sign, forKey: .sign)
    try container.encodeIfPresent(line, forKey: .line)
    try container.encodeIfPresent(clefOctaveChange, forKey: .clefOctaveChange)
}
// sourcery:end

// sourcery:inline:Clef.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    additional = try container.decodeIfPresent(Bool.self, forKey: .additional)
    size = try container.decodeIfPresent(SymbolSize.self, forKey: .size)
    afterBarline = try container.decodeIfPresent(Bool.self, forKey: .afterBarline)
    printStyle = try PrintStyle(from: decoder)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    sign = try container.decode(ClefSign.self, forKey: .sign)
    line = try container.decodeIfPresent(Int.self, forKey: .line)
    clefOctaveChange = try container.decodeIfPresent(Int.self, forKey: .clefOctaveChange)
}
// sourcery:end
// sourcery:inline:Creator.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(type, forKey: .type)
}
// sourcery:end

// sourcery:inline:Creator.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    type = try container.decodeIfPresent(String.self, forKey: .type)
}
// sourcery:end
// sourcery:inline:Credit.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(page, forKey: .page)
    try container.encodeIfPresent(types, forKey: .types)
    try container.encodeIfPresent(link, forKey: .link)
    try container.encodeIfPresent(bookmarks, forKey: .bookmarks)
}
// sourcery:end

// sourcery:inline:Credit.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    page = try container.decodeIfPresent(Int.self, forKey: .page)
    types = try container.decodeIfPresent([String].self, forKey: .types)
    link = try container.decodeIfPresent([Link].self, forKey: .link)
    bookmarks = try container.decodeIfPresent([Bookmark].self, forKey: .bookmarks)
}
// sourcery:end
// sourcery:inline:Credit.Words.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(words, forKey: .words)
    try container.encode(links, forKey: .links)
    try container.encode(bookmark, forKey: .bookmark)
}
// sourcery:end

// sourcery:inline:Credit.Words.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    words = try container.decode(FormattedText.self, forKey: .words)
    links = try container.decode([Link].self, forKey: .links)
    bookmark = try container.decode([Bookmark].self, forKey: .bookmark)
}
// sourcery:end
// sourcery:inline:DashedFormatting.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(dashLength, forKey: .dashLength)
    try container.encodeIfPresent(spaceLength, forKey: .spaceLength)
}
// sourcery:end

// sourcery:inline:DashedFormatting.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    dashLength = try container.decodeIfPresent(Tenths.self, forKey: .dashLength)
    spaceLength = try container.decodeIfPresent(Tenths.self, forKey: .spaceLength)
}
// sourcery:end
// sourcery:inline:Dashes.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try dashedFormatting.encode(to: encoder)
    try container.encode(type, forKey: .type)
}
// sourcery:end

// sourcery:inline:Dashes.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    dashedFormatting = try DashedFormatting(from: decoder)
    type = try container.decode(StartStopContinue.self, forKey: .type)
}
// sourcery:end
// sourcery:inline:Defaults.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(scaling, forKey: .scaling)
    try container.encodeIfPresent(pageLayout, forKey: .pageLayout)
    try container.encodeIfPresent(systemLayout, forKey: .systemLayout)
    try container.encodeIfPresent(staffLayout, forKey: .staffLayout)
    try container.encodeIfPresent(appearance, forKey: .appearance)
    try musicFont.encode(to: encoder)
    try wordFont.encode(to: encoder)
    try container.encode(lyricFonts, forKey: .lyricFonts)
    try container.encode(lyricLanguages, forKey: .lyricLanguages)
}
// sourcery:end

// sourcery:inline:Defaults.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    scaling = try container.decodeIfPresent(Scaling.self, forKey: .scaling)
    pageLayout = try container.decodeIfPresent(PageLayout.self, forKey: .pageLayout)
    systemLayout = try container.decodeIfPresent(SystemLayout.self, forKey: .systemLayout)
    staffLayout = try container.decodeIfPresent(StaffLayout.self, forKey: .staffLayout)
    appearance = try container.decodeIfPresent(Appearance.self, forKey: .appearance)
    musicFont = try Font?(from: decoder)
    wordFont = try Font?(from: decoder)
    lyricFonts = try container.decode([LyricFont].self, forKey: .lyricFonts)
    lyricLanguages = try container.decode([LyricLanguage].self, forKey: .lyricLanguages)
}
// sourcery:end
// sourcery:inline:Degree.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try container.encode(alter, forKey: .alter)
    try container.encode(type, forKey: .type)
}
// sourcery:end

// sourcery:inline:Degree.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(DegreeValue.self, forKey: .value)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    alter = try container.decode(DegreeAlter.self, forKey: .alter)
    type = try container.decode(DegreeType.self, forKey: .type)
}
// sourcery:end
// sourcery:inline:DegreeAlter.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(plusMinus, forKey: .plusMinus)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:DegreeAlter.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Int.self, forKey: .value)
    plusMinus = try container.decodeIfPresent(Bool.self, forKey: .plusMinus)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:DegreeType.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(text, forKey: .text)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:DegreeType.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(DegreeTypeValue.self, forKey: .value)
    text = try container.decodeIfPresent(String.self, forKey: .text)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:DegreeValue.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(symbol, forKey: .symbol)
    try container.encodeIfPresent(text, forKey: .text)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:DegreeValue.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Int.self, forKey: .value)
    symbol = try container.decodeIfPresent(DegreeSymbolValue.self, forKey: .symbol)
    text = try container.decodeIfPresent(String.self, forKey: .text)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:Direction.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(placement, forKey: .placement)
    try container.encodeIfPresent(directive, forKey: .directive)
    try container.encode(directionTypes, forKey: .directionTypes)
    try container.encodeIfPresent(offset, forKey: .offset)
    try container.encodeIfPresent(footnote, forKey: .footnote)
    try container.encodeIfPresent(level, forKey: .level)
    try container.encodeIfPresent(voice, forKey: .voice)
    try container.encodeIfPresent(staff, forKey: .staff)
    try container.encodeIfPresent(sound, forKey: .sound)
}
// sourcery:end

// sourcery:inline:Direction.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    directive = try container.decodeIfPresent(Bool.self, forKey: .directive)
    directionTypes = try container.decode([DirectionType].self, forKey: .directionTypes)
    offset = try container.decodeIfPresent(Offset.self, forKey: .offset)
    footnote = try container.decodeIfPresent(FormattedText.self, forKey: .footnote)
    level = try container.decodeIfPresent(Level.self, forKey: .level)
    voice = try container.decodeIfPresent(String.self, forKey: .voice)
    staff = try container.decodeIfPresent(UInt.self, forKey: .staff)
    sound = try container.decodeIfPresent(Sound.self, forKey: .sound)
}
// sourcery:end
// sourcery:inline:Distance.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encode(type, forKey: .type)
}
// sourcery:end

// sourcery:inline:Distance.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Tenths.self, forKey: .value)
    type = try container.decode(DistanceType.self, forKey: .type)
}
// sourcery:end
// sourcery:inline:Dynamics.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(values, forKey: .values)
    try printStyleAlign.encode(to: encoder)
    try textDecoration.encode(to: encoder)
    try container.encodeIfPresent(placement, forKey: .placement)
    try container.encodeIfPresent(enclosure, forKey: .enclosure)
}
// sourcery:end

// sourcery:inline:Dynamics.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    values = try container.decode([Dynamic].self, forKey: .values)
    printStyleAlign = try PrintStyleAlign(from: decoder)
    textDecoration = try TextDecoration(from: decoder)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    enclosure = try container.decodeIfPresent(EnclosureShape.self, forKey: .enclosure)
}
// sourcery:end
// sourcery:inline:Editorial.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(footnote, forKey: .footnote)
    try container.encodeIfPresent(level, forKey: .level)
}
// sourcery:end

// sourcery:inline:Editorial.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    footnote = try container.decodeIfPresent(FormattedText.self, forKey: .footnote)
    level = try container.decodeIfPresent(Level.self, forKey: .level)
}
// sourcery:end
// sourcery:inline:EditorialVoice.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(footnote, forKey: .footnote)
    try container.encodeIfPresent(level, forKey: .level)
    try container.encodeIfPresent(voice, forKey: .voice)
}
// sourcery:end

// sourcery:inline:EditorialVoice.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    footnote = try container.decodeIfPresent(FormattedText.self, forKey: .footnote)
    level = try container.decodeIfPresent(Level.self, forKey: .level)
    voice = try container.decodeIfPresent(Int.self, forKey: .voice)
}
// sourcery:end
// sourcery:inline:Encoding.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(values, forKey: .values)
}
// sourcery:end

// sourcery:inline:Encoding.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    values = try container.decode([Kind].self, forKey: .values)
}
// sourcery:end
// sourcery:inline:Ending.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encode(number, forKey: .number)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try container.encodeIfPresent(endLength, forKey: .endLength)
    try container.encodeIfPresent(textX, forKey: .textX)
    try container.encodeIfPresent(textY, forKey: .textY)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:Ending.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    number = try container.decode(String.self, forKey: .number)
    type = try container.decode(StartStopDiscontinue.self, forKey: .type)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    endLength = try container.decodeIfPresent(Tenths.self, forKey: .endLength)
    textX = try container.decodeIfPresent(Tenths.self, forKey: .textX)
    textY = try container.decodeIfPresent(Tenths.self, forKey: .textY)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:Extend.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(type, forKey: .type)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:Extend.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decodeIfPresent(StartStopContinue.self, forKey: .type)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:Feature.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(type, forKey: .type)
}
// sourcery:end

// sourcery:inline:Feature.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    type = try container.decodeIfPresent(String.self, forKey: .type)
}
// sourcery:end
// sourcery:inline:Fermata.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(type, forKey: .type)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:Fermata.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(FermataShape.self, forKey: .value)
    type = try container.decodeIfPresent(UprightInverted.self, forKey: .type)
    printStyle = try PrintStyle?(from: decoder)
}
// sourcery:end
// sourcery:inline:Figure.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(prefix, forKey: .prefix)
    try container.encodeIfPresent(figureNumber, forKey: .figureNumber)
    try container.encodeIfPresent(suffix, forKey: .suffix)
    try container.encodeIfPresent(extend, forKey: .extend)
}
// sourcery:end

// sourcery:inline:Figure.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    prefix = try container.decodeIfPresent(StyleText.self, forKey: .prefix)
    figureNumber = try container.decodeIfPresent(StyleText.self, forKey: .figureNumber)
    suffix = try container.decodeIfPresent(StyleText.self, forKey: .suffix)
    extend = try container.decodeIfPresent(Extend.self, forKey: .extend)
}
// sourcery:end
// sourcery:inline:FiguredBass.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try printStyle.encode(to: encoder)
    try printout.encode(to: encoder)
    try container.encodeIfPresent(parentheses, forKey: .parentheses)
    try container.encode(figures, forKey: .figures)
    try container.encodeIfPresent(duration, forKey: .duration)
    try container.encodeIfPresent(footnote, forKey: .footnote)
    try container.encodeIfPresent(level, forKey: .level)
}
// sourcery:end

// sourcery:inline:FiguredBass.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    printStyle = try PrintStyle(from: decoder)
    printout = try Printout(from: decoder)
    parentheses = try container.decodeIfPresent(Bool.self, forKey: .parentheses)
    figures = try container.decode([Figure].self, forKey: .figures)
    duration = try container.decodeIfPresent(Int.self, forKey: .duration)
    footnote = try container.decodeIfPresent(FormattedText.self, forKey: .footnote)
    level = try container.decodeIfPresent(Level.self, forKey: .level)
}
// sourcery:end
// sourcery:inline:Fingering.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(substitution, forKey: .substitution)
    try container.encodeIfPresent(alternate, forKey: .alternate)
    try container.encodeIfPresent(placement, forKey: .placement)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:Fingering.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    substitution = try container.decodeIfPresent(Bool.self, forKey: .substitution)
    alternate = try container.decodeIfPresent(Bool.self, forKey: .alternate)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:FirstFret.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(text, forKey: .text)
    try container.encodeIfPresent(location, forKey: .location)
}
// sourcery:end

// sourcery:inline:FirstFret.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Int.self, forKey: .value)
    text = try container.decodeIfPresent(String.self, forKey: .text)
    location = try container.decodeIfPresent(LeftRight.self, forKey: .location)
}
// sourcery:end
// sourcery:inline:Font.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(family, forKey: .family)
    try container.encodeIfPresent(style, forKey: .style)
    try container.encodeIfPresent(size, forKey: .size)
    try container.encodeIfPresent(weight, forKey: .weight)
}
// sourcery:end

// sourcery:inline:Font.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    family = try container.decodeIfPresent(String.self, forKey: .family)
    style = try container.decodeIfPresent(FontStyle.self, forKey: .style)
    size = try container.decodeIfPresent(FontSize.self, forKey: .size)
    weight = try container.decodeIfPresent(FontWeight.self, forKey: .weight)
}
// sourcery:end
// sourcery:inline:FormattedText.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(justify, forKey: .justify)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(hAlign, forKey: .hAlign)
    try container.encodeIfPresent(vAlign, forKey: .vAlign)
    try container.encodeIfPresent(underline, forKey: .underline)
    try container.encodeIfPresent(overline, forKey: .overline)
    try container.encodeIfPresent(lineThrough, forKey: .lineThrough)
    try container.encodeIfPresent(rotation, forKey: .rotation)
    try container.encodeIfPresent(letterSpacing, forKey: .letterSpacing)
    try container.encodeIfPresent(lineHeight, forKey: .lineHeight)
    try container.encodeIfPresent(direction, forKey: .direction)
    try container.encodeIfPresent(enclosure, forKey: .enclosure)
}
// sourcery:end

// sourcery:inline:FormattedText.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    justify = try container.decodeIfPresent(LeftCenterRight.self, forKey: .justify)
    printStyle = try PrintStyle(from: decoder)
    hAlign = try container.decodeIfPresent(LeftCenterRight.self, forKey: .hAlign)
    vAlign = try container.decodeIfPresent(VAlign.self, forKey: .vAlign)
    underline = try container.decodeIfPresent(Int.self, forKey: .underline)
    overline = try container.decodeIfPresent(Int.self, forKey: .overline)
    lineThrough = try container.decodeIfPresent(Int.self, forKey: .lineThrough)
    rotation = try container.decodeIfPresent(Double.self, forKey: .rotation)
    letterSpacing = try container.decodeIfPresent(NumberOrNormal.self, forKey: .letterSpacing)
    lineHeight = try container.decodeIfPresent(NumberOrNormal.self, forKey: .lineHeight)
    direction = try container.decodeIfPresent(TextDirection.self, forKey: .direction)
    enclosure = try container.decodeIfPresent(EnclosureShape.self, forKey: .enclosure)
}
// sourcery:end
// sourcery:inline:Forward.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(duration, forKey: .duration)
    try container.encodeIfPresent(editorialVoice, forKey: .editorialVoice)
    try container.encodeIfPresent(staff, forKey: .staff)
}
// sourcery:end

// sourcery:inline:Forward.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    duration = try container.decode(Int.self, forKey: .duration)
    editorialVoice = try container.decodeIfPresent(EditorialVoice.self, forKey: .editorialVoice)
    staff = try container.decodeIfPresent(Int.self, forKey: .staff)
}
// sourcery:end
// sourcery:inline:Frame.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try position.encode(to: encoder)
    try container.encodeIfPresent(color, forKey: .color)
    try container.encodeIfPresent(hAlign, forKey: .hAlign)
    try container.encodeIfPresent(vAlign, forKey: .vAlign)
    try container.encodeIfPresent(height, forKey: .height)
    try container.encodeIfPresent(width, forKey: .width)
    try container.encodeIfPresent(unplayed, forKey: .unplayed)
    try container.encode(frameStrings, forKey: .frameStrings)
    try container.encode(frameFrets, forKey: .frameFrets)
    try container.encodeIfPresent(firstFret, forKey: .firstFret)
    try container.encode(frameNotes, forKey: .frameNotes)
}
// sourcery:end

// sourcery:inline:Frame.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    position = try Position(from: decoder)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
    hAlign = try container.decodeIfPresent(LeftCenterRight.self, forKey: .hAlign)
    vAlign = try container.decodeIfPresent(VAlignImage.self, forKey: .vAlign)
    height = try container.decodeIfPresent(Tenths.self, forKey: .height)
    width = try container.decodeIfPresent(Tenths.self, forKey: .width)
    unplayed = try container.decodeIfPresent(String.self, forKey: .unplayed)
    frameStrings = try container.decode(Int.self, forKey: .frameStrings)
    frameFrets = try container.decode(Int.self, forKey: .frameFrets)
    firstFret = try container.decodeIfPresent(FirstFret.self, forKey: .firstFret)
    frameNotes = try container.decode([FrameNote].self, forKey: .frameNotes)
}
// sourcery:end
// sourcery:inline:FrameNote.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(string, forKey: .string)
    try container.encode(fret, forKey: .fret)
    try container.encodeIfPresent(fingering, forKey: .fingering)
    try container.encodeIfPresent(barre, forKey: .barre)
}
// sourcery:end

// sourcery:inline:FrameNote.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    string = try container.decode(MusicXML.String.self, forKey: .string)
    fret = try container.decode(Fret.self, forKey: .fret)
    fingering = try container.decodeIfPresent(Fingering.self, forKey: .fingering)
    barre = try container.decodeIfPresent(Barre.self, forKey: .barre)
}
// sourcery:end
// sourcery:inline:Fret.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(color, forKey: .color)
    try font.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:Fret.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Int.self, forKey: .value)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
    font = try Font(from: decoder)
}
// sourcery:end
// sourcery:inline:Glissando.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(lineType, forKey: .lineType)
    try dashedFormatting.encode(to: encoder)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:Glissando.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    type = try container.decode(StartStop.self, forKey: .type)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    lineType = try container.decodeIfPresent(LineType.self, forKey: .lineType)
    dashedFormatting = try DashedFormatting?(from: decoder)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:Grace.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(stealTimePrevious, forKey: .stealTimePrevious)
    try container.encodeIfPresent(stealTimeFollowing, forKey: .stealTimeFollowing)
    try container.encodeIfPresent(makeTime, forKey: .makeTime)
    try container.encodeIfPresent(slash, forKey: .slash)
}
// sourcery:end

// sourcery:inline:Grace.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    stealTimePrevious = try container.decodeIfPresent(Int.self, forKey: .stealTimePrevious)
    stealTimeFollowing = try container.decodeIfPresent(Int.self, forKey: .stealTimeFollowing)
    makeTime = try container.decodeIfPresent(Divisions.self, forKey: .makeTime)
    slash = try container.decodeIfPresent(Bool.self, forKey: .slash)
}
// sourcery:end
// sourcery:inline:GroupBarline.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:GroupBarline.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(GroupBarlineValue.self, forKey: .value)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:GroupName.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(justify, forKey: .justify)
}
// sourcery:end

// sourcery:inline:GroupName.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    printStyle = try PrintStyle(from: decoder)
    justify = try container.decodeIfPresent(Justify.self, forKey: .justify)
}
// sourcery:end
// sourcery:inline:GroupSymbol.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try position.encode(to: encoder)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:GroupSymbol.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(GroupSymbolValue.self, forKey: .value)
    position = try Position?(from: decoder)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:Grouping.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encode(feature, forKey: .feature)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(memberOf, forKey: .memberOf)
}
// sourcery:end

// sourcery:inline:Grouping.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(StartStopSingle.self, forKey: .type)
    feature = try container.decode([Feature].self, forKey: .feature)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    memberOf = try container.decodeIfPresent(String.self, forKey: .memberOf)
}
// sourcery:end


// sourcery:inline:Handbell.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(placement, forKey: .placement)
}
// sourcery:end

// sourcery:inline:Handbell.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(HandbellValue.self, forKey: .value)
    printStyle = try PrintStyle?(from: decoder)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
}
// sourcery:end
// sourcery:inline:Harmonic.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(naturalArtificial, forKey: .naturalArtificial)
    try container.encodeIfPresent(baseSoundingTouchingPitch, forKey: .baseSoundingTouchingPitch)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try container.encodeIfPresent(placement, forKey: .placement)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:Harmonic.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    naturalArtificial = try container.decodeIfPresent(NaturalArtificial.self, forKey: .naturalArtificial)
    baseSoundingTouchingPitch = try container.decodeIfPresent(BaseSoundingTouchingPitch.self, forKey: .baseSoundingTouchingPitch)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:Harmony.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(type, forKey: .type)
    try container.encodeIfPresent(placement, forKey: .placement)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try container.encodeIfPresent(printFrame, forKey: .printFrame)
    try printStyle.encode(to: encoder)
    try container.encode(chords, forKey: .chords)
    try container.encodeIfPresent(frame, forKey: .frame)
    try container.encodeIfPresent(offset, forKey: .offset)
    try container.encode(editorial, forKey: .editorial)
    try container.encodeIfPresent(staff, forKey: .staff)
}
// sourcery:end

// sourcery:inline:Harmony.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decodeIfPresent(HarmonyType.self, forKey: .type)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    printFrame = try container.decodeIfPresent(Bool.self, forKey: .printFrame)
    printStyle = try PrintStyle(from: decoder)
    chords = try container.decode([HarmonyChord].self, forKey: .chords)
    frame = try container.decodeIfPresent(Frame.self, forKey: .frame)
    offset = try container.decodeIfPresent(Offset.self, forKey: .offset)
    editorial = try container.decode(Editorial.self, forKey: .editorial)
    staff = try container.decodeIfPresent(Int.self, forKey: .staff)
}
// sourcery:end
// sourcery:inline:HarmonyChord.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(rootOrFunction, forKey: .rootOrFunction)
    try container.encode(kind, forKey: .kind)
    try container.encodeIfPresent(inversion, forKey: .inversion)
    try container.encodeIfPresent(bass, forKey: .bass)
    try container.encodeIfPresent(degrees, forKey: .degrees)
}
// sourcery:end

// sourcery:inline:HarmonyChord.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    rootOrFunction = try container.decode(RootOrFunction.self, forKey: .rootOrFunction)
    kind = try container.decode(Kind.self, forKey: .kind)
    inversion = try container.decodeIfPresent(Inversion.self, forKey: .inversion)
    bass = try container.decodeIfPresent(Bass.self, forKey: .bass)
    degrees = try container.decodeIfPresent([Degree].self, forKey: .degrees)
}
// sourcery:end
// sourcery:inline:HarpPedals.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try printStyleAlign.encode(to: encoder)
    try container.encode(pedalTunings, forKey: .pedalTunings)
}
// sourcery:end

// sourcery:inline:HarpPedals.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    printStyleAlign = try PrintStyleAlign(from: decoder)
    pedalTunings = try container.decode([PedalTuning].self, forKey: .pedalTunings)
}
// sourcery:end
// sourcery:inline:Header.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(work, forKey: .work)
    try container.encodeIfPresent(movementNumber, forKey: .movementNumber)
    try container.encodeIfPresent(movementTitle, forKey: .movementTitle)
    try container.encodeIfPresent(identification, forKey: .identification)
    try container.encodeIfPresent(defaults, forKey: .defaults)
    try container.encodeIfPresent(credits, forKey: .credits)
    try container.encode(partList, forKey: .partList)
}
// sourcery:end

// sourcery:inline:Header.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    work = try container.decodeIfPresent(Work.self, forKey: .work)
    movementNumber = try container.decodeIfPresent(String.self, forKey: .movementNumber)
    movementTitle = try container.decodeIfPresent(String.self, forKey: .movementTitle)
    identification = try container.decodeIfPresent(Identification.self, forKey: .identification)
    defaults = try container.decodeIfPresent(Defaults.self, forKey: .defaults)
    credits = try container.decodeIfPresent([Credit].self, forKey: .credits)
    partList = try container.decode(PartList.self, forKey: .partList)
}
// sourcery:end
// sourcery:inline:HeelToe.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(placement, forKey: .placement)
    try container.encodeIfPresent(substitution, forKey: .substitution)
}
// sourcery:end

// sourcery:inline:HeelToe.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    substitution = try container.decodeIfPresent(Bool.self, forKey: .substitution)
}
// sourcery:end
// sourcery:inline:Hole.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(holeType, forKey: .holeType)
    try container.encode(holeClosed, forKey: .holeClosed)
    try container.encodeIfPresent(holeShape, forKey: .holeShape)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(placement, forKey: .placement)
}
// sourcery:end

// sourcery:inline:Hole.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    holeType = try container.decodeIfPresent(String.self, forKey: .holeType)
    holeClosed = try container.decode(HoleClosed.self, forKey: .holeClosed)
    holeShape = try container.decodeIfPresent(String.self, forKey: .holeShape)
    printStyle = try PrintStyle?(from: decoder)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
}
// sourcery:end
// sourcery:inline:HoleClosed.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(location, forKey: .location)
}
// sourcery:end

// sourcery:inline:HoleClosed.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(HoleClosedValue.self, forKey: .value)
    location = try container.decodeIfPresent(HoleClosedLocation.self, forKey: .location)
}
// sourcery:end
// sourcery:inline:HorizontalTurn.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(placement, forKey: .placement)
    try trillSound.encode(to: encoder)
    try container.encodeIfPresent(slash, forKey: .slash)
}
// sourcery:end

// sourcery:inline:HorizontalTurn.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    printStyle = try PrintStyle?(from: decoder)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    trillSound = try TrillSound?(from: decoder)
    slash = try container.decodeIfPresent(Bool.self, forKey: .slash)
}
// sourcery:end
// sourcery:inline:Identification.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(creators, forKey: .creators)
    try container.encodeIfPresent(rights, forKey: .rights)
    try container.encodeIfPresent(encoding, forKey: .encoding)
    try container.encodeIfPresent(source, forKey: .source)
    try container.encodeIfPresent(relation, forKey: .relation)
    try container.encodeIfPresent(miscellaneous, forKey: .miscellaneous)
}
// sourcery:end

// sourcery:inline:Identification.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    creators = try container.decodeIfPresent([Creator].self, forKey: .creators)
    rights = try container.decodeIfPresent([Rights].self, forKey: .rights)
    encoding = try container.decodeIfPresent(Encoding.self, forKey: .encoding)
    source = try container.decodeIfPresent(String.self, forKey: .source)
    relation = try container.decodeIfPresent([String].self, forKey: .relation)
    miscellaneous = try container.decodeIfPresent(Miscellaneous.self, forKey: .miscellaneous)
}
// sourcery:end
// sourcery:inline:Image.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(source, forKey: .source)
    try container.encode(type, forKey: .type)
    try position.encode(to: encoder)
    try container.encodeIfPresent(hAlign, forKey: .hAlign)
    try container.encodeIfPresent(vAlign, forKey: .vAlign)
}
// sourcery:end

// sourcery:inline:Image.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    source = try container.decode(String.self, forKey: .source)
    type = try container.decode(String.self, forKey: .type)
    position = try Position?(from: decoder)
    hAlign = try container.decodeIfPresent(LeftCenterRight.self, forKey: .hAlign)
    vAlign = try container.decodeIfPresent(VAlignImage.self, forKey: .vAlign)
}
// sourcery:end
// sourcery:inline:Instrument.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
}
// sourcery:end

// sourcery:inline:Instrument.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
}
// sourcery:end
// sourcery:inline:Interchangeable.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(symbol, forKey: .symbol)
    try container.encode(separator, forKey: .separator)
}
// sourcery:end

// sourcery:inline:Interchangeable.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    symbol = try container.decode(TimeSymbol.self, forKey: .symbol)
    separator = try container.decode(TimeSeparator.self, forKey: .separator)
}
// sourcery:end
// sourcery:inline:Inversion.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:Inversion.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Int.self, forKey: .value)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:Key.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(number, forKey: .number)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try container.encode(kind, forKey: .kind)
    try container.encode(keyOctaves, forKey: .keyOctaves)
}
// sourcery:end

// sourcery:inline:Key.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    printStyle = try PrintStyle(from: decoder)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    kind = try container.decode(Kind.self, forKey: .kind)
    keyOctaves = try container.decode([KeyOctave].self, forKey: .keyOctaves)
}
// sourcery:end
// sourcery:inline:Key.AlteredTone.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(step, forKey: .step)
    try container.encode(alter, forKey: .alter)
    try container.encodeIfPresent(accidental, forKey: .accidental)
}
// sourcery:end

// sourcery:inline:Key.AlteredTone.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    step = try container.decode(Step.self, forKey: .step)
    alter = try container.decode(Double.self, forKey: .alter)
    accidental = try container.decodeIfPresent(AccidentalValue.self, forKey: .accidental)
}
// sourcery:end
// sourcery:inline:Key.Traditional.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(cancel, forKey: .cancel)
    try container.encode(fifths, forKey: .fifths)
    try container.encodeIfPresent(mode, forKey: .mode)
}
// sourcery:end

// sourcery:inline:Key.Traditional.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    cancel = try container.decodeIfPresent(Cancel.self, forKey: .cancel)
    fifths = try container.decode(Int.self, forKey: .fifths)
    mode = try container.decodeIfPresent(Mode.self, forKey: .mode)
}
// sourcery:end
// sourcery:inline:KeyOctave.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encode(number, forKey: .number)
    try container.encode(cancel, forKey: .cancel)
}
// sourcery:end

// sourcery:inline:KeyOctave.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Int.self, forKey: .value)
    number = try container.decode(Int.self, forKey: .number)
    cancel = try container.decode(Bool.self, forKey: .cancel)
}
// sourcery:end
// sourcery:inline:Kind.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(useSymbols, forKey: .useSymbols)
    try container.encodeIfPresent(text, forKey: .text)
    try container.encodeIfPresent(stackDegrees, forKey: .stackDegrees)
    try container.encodeIfPresent(parenthesesDegrees, forKey: .parenthesesDegrees)
    try container.encodeIfPresent(bracketDegrees, forKey: .bracketDegrees)
    try container.encodeIfPresent(hAlign, forKey: .hAlign)
    try container.encodeIfPresent(vAlign, forKey: .vAlign)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:Kind.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(KindValue.self, forKey: .value)
    useSymbols = try container.decodeIfPresent(Bool.self, forKey: .useSymbols)
    text = try container.decodeIfPresent(String.self, forKey: .text)
    stackDegrees = try container.decodeIfPresent(Bool.self, forKey: .stackDegrees)
    parenthesesDegrees = try container.decodeIfPresent(Bool.self, forKey: .parenthesesDegrees)
    bracketDegrees = try container.decodeIfPresent(Bool.self, forKey: .bracketDegrees)
    hAlign = try container.decodeIfPresent(LeftCenterRight.self, forKey: .hAlign)
    vAlign = try container.decodeIfPresent(VAlign.self, forKey: .vAlign)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:Level.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(reference, forKey: .reference)
    try container.encode(levelDisplay, forKey: .levelDisplay)
}
// sourcery:end

// sourcery:inline:Level.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    reference = try container.decode(Bool.self, forKey: .reference)
    levelDisplay = try container.decode(LevelDisplay.self, forKey: .levelDisplay)
}
// sourcery:end
// sourcery:inline:LevelDisplay.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(parentheses, forKey: .parentheses)
    try container.encode(bracket, forKey: .bracket)
    try container.encode(size, forKey: .size)
}
// sourcery:end

// sourcery:inline:LevelDisplay.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    parentheses = try container.decode(Bool.self, forKey: .parentheses)
    bracket = try container.decode(Bool.self, forKey: .bracket)
    size = try container.decode(SymbolSize.self, forKey: .size)
}
// sourcery:end
// sourcery:inline:Line.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(lineShape, forKey: .lineShape)
    try container.encodeIfPresent(lineType, forKey: .lineType)
    try dashedFormatting.encode(to: encoder)
    try position.encode(to: encoder)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(placement, forKey: .placement)
}
// sourcery:end

// sourcery:inline:Line.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    lineShape = try container.decodeIfPresent(LineShape.self, forKey: .lineShape)
    lineType = try container.decodeIfPresent(LineType.self, forKey: .lineType)
    dashedFormatting = try DashedFormatting?(from: decoder)
    position = try Position?(from: decoder)
    printStyle = try PrintStyle?(from: decoder)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
}
// sourcery:end
// sourcery:inline:LineWidth.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encode(type, forKey: .type)
}
// sourcery:end

// sourcery:inline:LineWidth.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Tenths.self, forKey: .value)
    type = try container.decode(LineWidthType.self, forKey: .type)
}
// sourcery:end
// sourcery:inline:LinearArrow.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(direction, forKey: .direction)
    try container.encodeIfPresent(style, forKey: .style)
}
// sourcery:end

// sourcery:inline:LinearArrow.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    direction = try container.decode(ArrowDirection.self, forKey: .direction)
    style = try container.decodeIfPresent(ArrowStyle.self, forKey: .style)
}
// sourcery:end
// sourcery:inline:Link.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(name, forKey: .name)
    try container.encodeIfPresent(element, forKey: .element)
    try container.encodeIfPresent(position, forKey: .position)
}
// sourcery:end

// sourcery:inline:Link.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    element = try container.decodeIfPresent(String.self, forKey: .element)
    position = try container.decodeIfPresent(String.self, forKey: .position)
}
// sourcery:end
// sourcery:inline:Lyric.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(kind, forKey: .kind)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(name, forKey: .name)
    try container.encodeIfPresent(justify, forKey: .justify)
    try container.encodeIfPresent(color, forKey: .color)
    try container.encodeIfPresent(placement, forKey: .placement)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try position.encode(to: encoder)
    try container.encode(endLine, forKey: .endLine)
    try container.encode(endParagraph, forKey: .endParagraph)
    try container.encodeIfPresent(level, forKey: .level)
}
// sourcery:end

// sourcery:inline:Lyric.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    kind = try container.decode(Kind.self, forKey: .kind)
    number = try container.decodeIfPresent(String.self, forKey: .number)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    justify = try container.decodeIfPresent(LeftCenterRight.self, forKey: .justify)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    position = try Position(from: decoder)
    endLine = try container.decode(Bool.self, forKey: .endLine)
    endParagraph = try container.decode(Bool.self, forKey: .endParagraph)
    level = try container.decodeIfPresent(Level.self, forKey: .level)
}
// sourcery:end
// sourcery:inline:Lyric.Verbal.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(text, forKey: .text)
    try container.encodeIfPresent(syllabic, forKey: .syllabic)
}
// sourcery:end

// sourcery:inline:Lyric.Verbal.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    text = try container.decode(TextElementData.self, forKey: .text)
    syllabic = try container.decodeIfPresent(Syllabic.self, forKey: .syllabic)
}
// sourcery:end
// sourcery:inline:LyricFont.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try font.encode(to: encoder)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(name, forKey: .name)
}
// sourcery:end

// sourcery:inline:LyricFont.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    font = try Font(from: decoder)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    name = try container.decodeIfPresent(String.self, forKey: .name)
}
// sourcery:end
// sourcery:inline:LyricLanguage.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(name, forKey: .name)
    try container.encodeIfPresent(language, forKey: .language)
}
// sourcery:end

// sourcery:inline:LyricLanguage.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    language = try container.decodeIfPresent(String.self, forKey: .language)
}
// sourcery:end
// sourcery:inline:MIDIDevice.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(value, forKey: .value)
    try container.encodeIfPresent(port, forKey: .port)
    try container.encodeIfPresent(id, forKey: .id)
}
// sourcery:end

// sourcery:inline:MIDIDevice.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decodeIfPresent(String.self, forKey: .value)
    port = try container.decodeIfPresent(Int.self, forKey: .port)
    id = try container.decodeIfPresent(String.self, forKey: .id)
}
// sourcery:end
// sourcery:inline:MIDIInstrument.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encodeIfPresent(channel, forKey: .channel)
    try container.encodeIfPresent(name, forKey: .name)
    try container.encodeIfPresent(bank, forKey: .bank)
    try container.encodeIfPresent(program, forKey: .program)
    try container.encodeIfPresent(unpitched, forKey: .unpitched)
    try container.encodeIfPresent(volume, forKey: .volume)
    try container.encodeIfPresent(pan, forKey: .pan)
    try container.encodeIfPresent(elevation, forKey: .elevation)
}
// sourcery:end

// sourcery:inline:MIDIInstrument.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    channel = try container.decodeIfPresent(Int.self, forKey: .channel)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    bank = try container.decodeIfPresent(Int.self, forKey: .bank)
    program = try container.decodeIfPresent(Int.self, forKey: .program)
    unpitched = try container.decodeIfPresent(Int.self, forKey: .unpitched)
    volume = try container.decodeIfPresent(Double.self, forKey: .volume)
    pan = try container.decodeIfPresent(Int.self, forKey: .pan)
    elevation = try container.decodeIfPresent(Int.self, forKey: .elevation)
}
// sourcery:end
// sourcery:inline:MeasureAttributes.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(number, forKey: .number)
    try container.encodeIfPresent(text, forKey: .text)
    try container.encodeIfPresent(implicit, forKey: .implicit)
    try container.encodeIfPresent(nonControlling, forKey: .nonControlling)
    try container.encodeIfPresent(width, forKey: .width)
    try container.encodeIfPresent(optionalUniqueID, forKey: .optionalUniqueID)
}
// sourcery:end

// sourcery:inline:MeasureAttributes.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    number = try container.decode(String.self, forKey: .number)
    text = try container.decodeIfPresent(String.self, forKey: .text)
    implicit = try container.decodeIfPresent(Bool.self, forKey: .implicit)
    nonControlling = try container.decodeIfPresent(Bool.self, forKey: .nonControlling)
    width = try container.decodeIfPresent(Tenths.self, forKey: .width)
    optionalUniqueID = try container.decodeIfPresent(Int.self, forKey: .optionalUniqueID)
}
// sourcery:end
// sourcery:inline:MeasureLayout.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(measureDistance, forKey: .measureDistance)
}
// sourcery:end

// sourcery:inline:MeasureLayout.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    measureDistance = try container.decodeIfPresent(Tenths.self, forKey: .measureDistance)
}
// sourcery:end
// sourcery:inline:MeasureNumbering.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try printStyleAlign.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:MeasureNumbering.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(MeasureNumberingValue.self, forKey: .value)
    printStyleAlign = try PrintStyleAlign(from: decoder)
}
// sourcery:end
// sourcery:inline:MeasureRepeat.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encode(slashes, forKey: .slashes)
}
// sourcery:end

// sourcery:inline:MeasureRepeat.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(StartStop.self, forKey: .type)
    slashes = try container.decode(Int.self, forKey: .slashes)
}
// sourcery:end
// sourcery:inline:MeasureStyle.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(number, forKey: .number)
    try font.encode(to: encoder)
    try container.encodeIfPresent(color, forKey: .color)
    try container.encode(kind, forKey: .kind)
}
// sourcery:end

// sourcery:inline:MeasureStyle.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    font = try Font?(from: decoder)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
    kind = try container.decode(Kind.self, forKey: .kind)
}
// sourcery:end
// sourcery:inline:Metronome.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(kind, forKey: .kind)
    try position.encode(to: encoder)
    try printStyleAlign.encode(to: encoder)
    try container.encodeIfPresent(justify, forKey: .justify)
    try container.encodeIfPresent(parentheses, forKey: .parentheses)
}
// sourcery:end

// sourcery:inline:Metronome.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    kind = try container.decode(Kind.self, forKey: .kind)
    position = try Position(from: decoder)
    printStyleAlign = try PrintStyleAlign?(from: decoder)
    justify = try container.decodeIfPresent(Justify.self, forKey: .justify)
    parentheses = try container.decodeIfPresent(Bool.self, forKey: .parentheses)
}
// sourcery:end
// sourcery:inline:Metronome.Complicated.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(metronomeNote, forKey: .metronomeNote)
    try container.encode(metronomeRelation, forKey: .metronomeRelation)
    try container.encode(otherMetronomeNote, forKey: .otherMetronomeNote)
}
// sourcery:end

// sourcery:inline:Metronome.Complicated.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    metronomeNote = try container.decode([MetronomeNote].self, forKey: .metronomeNote)
    metronomeRelation = try container.decode(String.self, forKey: .metronomeRelation)
    otherMetronomeNote = try container.decode([MetronomeNote].self, forKey: .otherMetronomeNote)
}
// sourcery:end
// sourcery:inline:Metronome.Regular.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(beatUnit, forKey: .beatUnit)
    try container.encode(beatUnitDotCount, forKey: .beatUnitDotCount)
    try container.encode(relation, forKey: .relation)
}
// sourcery:end

// sourcery:inline:Metronome.Regular.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    beatUnit = try container.decode(NoteTypeValue.self, forKey: .beatUnit)
    beatUnitDotCount = try container.decode(Int.self, forKey: .beatUnitDotCount)
    relation = try container.decode(Relation.self, forKey: .relation)
}
// sourcery:end
// sourcery:inline:MetronomeBeam.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(number, forKey: .number)
}
// sourcery:end

// sourcery:inline:MetronomeBeam.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(BeamValue.self, forKey: .value)
    number = try container.decodeIfPresent(BeamLevel.self, forKey: .number)
}
// sourcery:end
// sourcery:inline:MetronomeNote.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(metronomeType, forKey: .metronomeType)
    try container.encode(metronomeDotCount, forKey: .metronomeDotCount)
    try container.encode(metronomeBeams, forKey: .metronomeBeams)
    try container.encodeIfPresent(metronomeTuplet, forKey: .metronomeTuplet)
}
// sourcery:end

// sourcery:inline:MetronomeNote.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    metronomeType = try container.decode(NoteTypeValue.self, forKey: .metronomeType)
    metronomeDotCount = try container.decode(Int.self, forKey: .metronomeDotCount)
    metronomeBeams = try container.decode([MetronomeBeam].self, forKey: .metronomeBeams)
    metronomeTuplet = try container.decodeIfPresent(MetronomeTuplet.self, forKey: .metronomeTuplet)
}
// sourcery:end
// sourcery:inline:MetronomeTuplet.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(bracket, forKey: .bracket)
    try container.encodeIfPresent(showNumber, forKey: .showNumber)
}
// sourcery:end

// sourcery:inline:MetronomeTuplet.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(TimeModification.self, forKey: .value)
    type = try container.decode(StartStop.self, forKey: .type)
    bracket = try container.decodeIfPresent(Bool.self, forKey: .bracket)
    showNumber = try container.decodeIfPresent(ShowTuplet.self, forKey: .showNumber)
}
// sourcery:end
// sourcery:inline:Miscellaneous.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(fields, forKey: .fields)
}
// sourcery:end

// sourcery:inline:Miscellaneous.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    fields = try container.decode([MiscellaneousField].self, forKey: .fields)
}
// sourcery:end
// sourcery:inline:MiscellaneousField.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
    try container.encode(value, forKey: .value)
}
// sourcery:end

// sourcery:inline:MiscellaneousField.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
    value = try container.decode(String.self, forKey: .value)
}
// sourcery:end
// sourcery:inline:Mordent.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try value.encode(to: encoder)
    try container.encodeIfPresent(long, forKey: .long)
    try container.encodeIfPresent(approach, forKey: .approach)
    try container.encodeIfPresent(departure, forKey: .departure)
}
// sourcery:end

// sourcery:inline:Mordent.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try PrintStyleTrillSound?(from: decoder)
    long = try container.decodeIfPresent(Bool.self, forKey: .long)
    approach = try container.decodeIfPresent(AboveBelow.self, forKey: .approach)
    departure = try container.decodeIfPresent(AboveBelow.self, forKey: .departure)
}
// sourcery:end
// sourcery:inline:MultipleRest.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(useSymbols, forKey: .useSymbols)
    try container.encode(value, forKey: .value)
}
// sourcery:end

// sourcery:inline:MultipleRest.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    useSymbols = try container.decodeIfPresent(Bool.self, forKey: .useSymbols)
    value = try container.decode(Int.self, forKey: .value)
}
// sourcery:end
// sourcery:inline:MusicXML.String.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(placement, forKey: .placement)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:MusicXML.String.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Int.self, forKey: .value)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:NameDisplay.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try container.encode(texts, forKey: .texts)
}
// sourcery:end

// sourcery:inline:NameDisplay.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    texts = try container.decode([Text].self, forKey: .texts)
}
// sourcery:end
// sourcery:inline:NonArpeggiate.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(number, forKey: .number)
    try position.encode(to: encoder)
    try container.encodeIfPresent(placement, forKey: .placement)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:NonArpeggiate.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(TopBottom.self, forKey: .type)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    position = try Position?(from: decoder)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:Notations.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try container.encodeIfPresent(footnote, forKey: .footnote)
    try container.encodeIfPresent(level, forKey: .level)
    try container.encode(values, forKey: .values)
}
// sourcery:end

// sourcery:inline:Notations.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    footnote = try container.decodeIfPresent(FormattedText.self, forKey: .footnote)
    level = try container.decodeIfPresent(Level.self, forKey: .level)
    values = try container.decode([Notation].self, forKey: .values)
}
// sourcery:end
// sourcery:inline:Note.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(kind, forKey: .kind)
    try container.encodeIfPresent(instrument, forKey: .instrument)
    try container.encodeIfPresent(footnote, forKey: .footnote)
    try container.encodeIfPresent(level, forKey: .level)
    try container.encodeIfPresent(voice, forKey: .voice)
    try container.encodeIfPresent(type, forKey: .type)
    try container.encodeIfPresent(dots, forKey: .dots)
    try container.encodeIfPresent(accidental, forKey: .accidental)
    try container.encodeIfPresent(timeModification, forKey: .timeModification)
    try container.encodeIfPresent(stem, forKey: .stem)
    try container.encodeIfPresent(notehead, forKey: .notehead)
    try container.encodeIfPresent(noteheadText, forKey: .noteheadText)
    try container.encodeIfPresent(staff, forKey: .staff)
    try container.encodeIfPresent(beams, forKey: .beams)
    try container.encodeIfPresent(notations, forKey: .notations)
    try container.encode(lyrics, forKey: .lyrics)
    try container.encodeIfPresent(play, forKey: .play)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try container.encodeIfPresent(printDot, forKey: .printDot)
    try container.encodeIfPresent(printSpacing, forKey: .printSpacing)
    try container.encodeIfPresent(printLyric, forKey: .printLyric)
    try container.encodeIfPresent(dynamics, forKey: .dynamics)
    try container.encodeIfPresent(endDynamics, forKey: .endDynamics)
    try container.encodeIfPresent(attack, forKey: .attack)
    try container.encodeIfPresent(release, forKey: .release)
    try container.encodeIfPresent(timeOnly, forKey: .timeOnly)
    try container.encodeIfPresent(pizzicato, forKey: .pizzicato)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:Note.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    kind = try container.decode(Kind.self, forKey: .kind)
    instrument = try container.decodeIfPresent(Instrument.self, forKey: .instrument)
    footnote = try container.decodeIfPresent(FormattedText.self, forKey: .footnote)
    level = try container.decodeIfPresent(Level.self, forKey: .level)
    voice = try container.decodeIfPresent(String.self, forKey: .voice)
    type = try container.decodeIfPresent(NoteType.self, forKey: .type)
    dots = try container.decodeIfPresent([PlacementPrintStyle].self, forKey: .dots)
    accidental = try container.decodeIfPresent(Accidental.self, forKey: .accidental)
    timeModification = try container.decodeIfPresent(TimeModification.self, forKey: .timeModification)
    stem = try container.decodeIfPresent(Stem.self, forKey: .stem)
    notehead = try container.decodeIfPresent(Notehead.self, forKey: .notehead)
    noteheadText = try container.decodeIfPresent(NoteheadText.self, forKey: .noteheadText)
    staff = try container.decodeIfPresent(Int.self, forKey: .staff)
    beams = try container.decodeIfPresent([Beam].self, forKey: .beams)
    notations = try container.decodeIfPresent(Notations.self, forKey: .notations)
    lyrics = try container.decode([Lyric].self, forKey: .lyrics)
    play = try container.decodeIfPresent(Play.self, forKey: .play)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    printDot = try container.decodeIfPresent(Bool.self, forKey: .printDot)
    printSpacing = try container.decodeIfPresent(Bool.self, forKey: .printSpacing)
    printLyric = try container.decodeIfPresent(Bool.self, forKey: .printLyric)
    dynamics = try container.decodeIfPresent(Double.self, forKey: .dynamics)
    endDynamics = try container.decodeIfPresent(Double.self, forKey: .endDynamics)
    attack = try container.decodeIfPresent(Divisions.self, forKey: .attack)
    release = try container.decodeIfPresent(Divisions.self, forKey: .release)
    timeOnly = try container.decodeIfPresent(TimeOnly.self, forKey: .timeOnly)
    pizzicato = try container.decodeIfPresent(Bool.self, forKey: .pizzicato)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:Note.Cue.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(isChord, forKey: .isChord)
    try container.encode(pitchUnpitchedOrRest, forKey: .pitchUnpitchedOrRest)
    try container.encode(duration, forKey: .duration)
}
// sourcery:end

// sourcery:inline:Note.Cue.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    isChord = try container.decode(Bool.self, forKey: .isChord)
    pitchUnpitchedOrRest = try container.decode(PitchUnpitchedOrRest.self, forKey: .pitchUnpitchedOrRest)
    duration = try container.decode(Int.self, forKey: .duration)
}
// sourcery:end
// sourcery:inline:Note.Grace.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(isChord, forKey: .isChord)
    try container.encode(pitchUnpitchedOrRest, forKey: .pitchUnpitchedOrRest)
    try container.encode(ties, forKey: .ties)
}
// sourcery:end

// sourcery:inline:Note.Grace.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    isChord = try container.decode(Bool.self, forKey: .isChord)
    pitchUnpitchedOrRest = try container.decode(PitchUnpitchedOrRest.self, forKey: .pitchUnpitchedOrRest)
    ties = try container.decode(Ties.self, forKey: .ties)
}
// sourcery:end
// sourcery:inline:Note.Normal.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(isChord, forKey: .isChord)
    try container.encode(pitchUnpitchedOrRest, forKey: .pitchUnpitchedOrRest)
    try container.encode(duration, forKey: .duration)
    try container.encode(ties, forKey: .ties)
}
// sourcery:end

// sourcery:inline:Note.Normal.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    isChord = try container.decode(Bool.self, forKey: .isChord)
    pitchUnpitchedOrRest = try container.decode(PitchUnpitchedOrRest.self, forKey: .pitchUnpitchedOrRest)
    duration = try container.decode(Int.self, forKey: .duration)
    ties = try container.decode(Ties.self, forKey: .ties)
}
// sourcery:end
// sourcery:inline:NoteSize.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encode(type, forKey: .type)
}
// sourcery:end

// sourcery:inline:NoteSize.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Double.self, forKey: .value)
    type = try container.decode(NoteSizeType.self, forKey: .type)
}
// sourcery:end
// sourcery:inline:NoteType.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(size, forKey: .size)
}
// sourcery:end

// sourcery:inline:NoteType.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(NoteTypeValue.self, forKey: .value)
    size = try container.decodeIfPresent(SymbolSize.self, forKey: .size)
}
// sourcery:end
// sourcery:inline:Notehead.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(filled, forKey: .filled)
    try container.encodeIfPresent(parentheses, forKey: .parentheses)
    try font.encode(to: encoder)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:Notehead.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(NoteheadValue.self, forKey: .value)
    filled = try container.decodeIfPresent(Bool.self, forKey: .filled)
    parentheses = try container.decodeIfPresent(Bool.self, forKey: .parentheses)
    font = try Font(from: decoder)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:NoteheadText.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(values, forKey: .values)
}
// sourcery:end

// sourcery:inline:NoteheadText.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    values = try container.decode([Kind].self, forKey: .values)
}
// sourcery:end
// sourcery:inline:OctaveShift.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(size, forKey: .size)
    try dashedFormatting.encode(to: encoder)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:OctaveShift.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(UpDownStopContinue.self, forKey: .type)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    size = try container.decodeIfPresent(Int.self, forKey: .size)
    dashedFormatting = try DashedFormatting(from: decoder)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:Offset.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(sound, forKey: .sound)
}
// sourcery:end

// sourcery:inline:Offset.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Divisions.self, forKey: .value)
    sound = try container.decodeIfPresent(Bool.self, forKey: .sound)
}
// sourcery:end
// sourcery:inline:Opus.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
}
// sourcery:end

// sourcery:inline:Opus.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
}
// sourcery:end
// sourcery:inline:Ornaments.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(values, forKey: .values)
    try container.encode(accidentalMarks, forKey: .accidentalMarks)
}
// sourcery:end

// sourcery:inline:Ornaments.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    values = try container.decode([Ornament].self, forKey: .values)
    accidentalMarks = try container.decode([AccidentalMark].self, forKey: .accidentalMarks)
}
// sourcery:end
// sourcery:inline:OtherAppearance.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encode(type, forKey: .type)
}
// sourcery:end

// sourcery:inline:OtherAppearance.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    type = try container.decode(String.self, forKey: .type)
}
// sourcery:end
// sourcery:inline:OtherDirection.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try printStyleAlign.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:OtherDirection.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    printStyleAlign = try PrintStyleAlign?(from: decoder)
}
// sourcery:end
// sourcery:inline:OtherDynamics.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(smufl, forKey: .smufl)
}
// sourcery:end

// sourcery:inline:OtherDynamics.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    smufl = try container.decode(SMuFL.self, forKey: .smufl)
}
// sourcery:end
// sourcery:inline:OtherNotation.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(placement, forKey: .placement)
}
// sourcery:end

// sourcery:inline:OtherNotation.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    type = try container.decode(StartStopSingle.self, forKey: .type)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    printStyle = try PrintStyle?(from: decoder)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
}
// sourcery:end
// sourcery:inline:OtherPlay.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encode(type, forKey: .type)
}
// sourcery:end

// sourcery:inline:OtherPlay.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    type = try container.decode(String.self, forKey: .type)
}
// sourcery:end
// sourcery:inline:PageLayout.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(height, forKey: .height)
    try container.encodeIfPresent(width, forKey: .width)
    try container.encode(margins, forKey: .margins)
}
// sourcery:end

// sourcery:inline:PageLayout.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    height = try container.decodeIfPresent(Double.self, forKey: .height)
    width = try container.decodeIfPresent(Double.self, forKey: .width)
    margins = try container.decode([PageMargins].self, forKey: .margins)
}
// sourcery:end
// sourcery:inline:PageMargins.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encode(left, forKey: .left)
    try container.encode(right, forKey: .right)
    try container.encode(top, forKey: .top)
    try container.encode(bottom, forKey: .bottom)
}
// sourcery:end

// sourcery:inline:PageMargins.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(Kind.self, forKey: .type)
    left = try container.decode(Tenths.self, forKey: .left)
    right = try container.decode(Tenths.self, forKey: .right)
    top = try container.decode(Tenths.self, forKey: .top)
    bottom = try container.decode(Tenths.self, forKey: .bottom)
}
// sourcery:end
// sourcery:inline:PartGroup.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(name, forKey: .name)
    try container.encodeIfPresent(nameDisplay, forKey: .nameDisplay)
    try container.encodeIfPresent(abbreviation, forKey: .abbreviation)
    try container.encodeIfPresent(abbreviationDisplay, forKey: .abbreviationDisplay)
    try container.encodeIfPresent(symbol, forKey: .symbol)
    try container.encodeIfPresent(barline, forKey: .barline)
    try container.encodeIfPresent(time, forKey: .time)
    try container.encodeIfPresent(editorial, forKey: .editorial)
}
// sourcery:end

// sourcery:inline:PartGroup.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(StartStop.self, forKey: .type)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    name = try container.decodeIfPresent(GroupName.self, forKey: .name)
    nameDisplay = try container.decodeIfPresent(NameDisplay.self, forKey: .nameDisplay)
    abbreviation = try container.decodeIfPresent(GroupName.self, forKey: .abbreviation)
    abbreviationDisplay = try container.decodeIfPresent(NameDisplay.self, forKey: .abbreviationDisplay)
    symbol = try container.decodeIfPresent(GroupSymbol.self, forKey: .symbol)
    barline = try container.decodeIfPresent(GroupBarline.self, forKey: .barline)
    time = try container.decodeIfPresent(Bool.self, forKey: .time)
    editorial = try container.decodeIfPresent(Editorial.self, forKey: .editorial)
}
// sourcery:end
// sourcery:inline:PartList.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(parts, forKey: .parts)
}
// sourcery:end

// sourcery:inline:PartList.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    parts = try container.decode([Item].self, forKey: .parts)
}
// sourcery:end
// sourcery:inline:PartName.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try container.encodeIfPresent(justify, forKey: .justify)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:PartName.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    justify = try container.decodeIfPresent(Justify.self, forKey: .justify)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:PartSymbol.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encode(kind, forKey: .kind)
    try container.encode(topStaff, forKey: .topStaff)
    try container.encode(bottomStaff, forKey: .bottomStaff)
    try position.encode(to: encoder)
    try container.encode(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:PartSymbol.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(GroupSymbolValue.self, forKey: .value)
    kind = try container.decode(Kind.self, forKey: .kind)
    topStaff = try container.decode(Int.self, forKey: .topStaff)
    bottomStaff = try container.decode(Int.self, forKey: .bottomStaff)
    position = try Position(from: decoder)
    color = try container.decode(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:Partwise.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(header, forKey: .header)
    try container.encode(parts, forKey: .parts)
}
// sourcery:end

// sourcery:inline:Partwise.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    header = try container.decode(Header.self, forKey: .header)
    parts = try container.decode([Part].self, forKey: .parts)
}
// sourcery:end
// sourcery:inline:Partwise.Measure.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(attributes, forKey: .attributes)
    try container.encode(musicData, forKey: .musicData)
}
// sourcery:end

// sourcery:inline:Partwise.Measure.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    attributes = try container.decode(MeasureAttributes.self, forKey: .attributes)
    musicData = try container.decode([MusicData].self, forKey: .musicData)
}
// sourcery:end
// sourcery:inline:Partwise.Part.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(measures, forKey: .measures)
}
// sourcery:end

// sourcery:inline:Partwise.Part.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    measures = try container.decode([Measure].self, forKey: .measures)
}
// sourcery:end
// sourcery:inline:Pedal.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try printStyleAlign.encode(to: encoder)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(line, forKey: .line)
    try container.encodeIfPresent(sign, forKey: .sign)
}
// sourcery:end

// sourcery:inline:Pedal.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    printStyleAlign = try PrintStyleAlign(from: decoder)
    type = try container.decode(StartStopChangeContinue.self, forKey: .type)
    line = try container.decodeIfPresent(Bool.self, forKey: .line)
    sign = try container.decodeIfPresent(Bool.self, forKey: .sign)
}
// sourcery:end
// sourcery:inline:PedalTuning.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(step, forKey: .step)
    try container.encode(alter, forKey: .alter)
}
// sourcery:end

// sourcery:inline:PedalTuning.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    step = try container.decode(Step.self, forKey: .step)
    alter = try container.decode(Int.self, forKey: .alter)
}
// sourcery:end
// sourcery:inline:PerMinute.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try font.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:PerMinute.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    font = try Font?(from: decoder)
}
// sourcery:end
// sourcery:inline:Percussion.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try printStyleAlign.encode(to: encoder)
    try container.encodeIfPresent(enclosure, forKey: .enclosure)
    try container.encode(kind, forKey: .kind)
}
// sourcery:end

// sourcery:inline:Percussion.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    printStyleAlign = try PrintStyleAlign?(from: decoder)
    enclosure = try container.decodeIfPresent(EnclosureShape.self, forKey: .enclosure)
    kind = try container.decode(Kind.self, forKey: .kind)
}
// sourcery:end
// sourcery:inline:Pitch.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(step, forKey: .step)
    try container.encodeIfPresent(alter, forKey: .alter)
    try container.encode(octave, forKey: .octave)
}
// sourcery:end

// sourcery:inline:Pitch.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    step = try container.decode(Step.self, forKey: .step)
    alter = try container.decodeIfPresent(Double.self, forKey: .alter)
    octave = try container.decode(Int.self, forKey: .octave)
}
// sourcery:end
// sourcery:inline:PlacementPrintStyle.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(placement, forKey: .placement)
    try position.encode(to: encoder)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:PlacementPrintStyle.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    position = try Position(from: decoder)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:PlacementText.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(placement, forKey: .placement)
    try position.encode(to: encoder)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:PlacementText.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    position = try Position(from: decoder)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:Play.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(values, forKey: .values)
}
// sourcery:end

// sourcery:inline:Play.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    values = try container.decode([Kind].self, forKey: .values)
}
// sourcery:end
// sourcery:inline:Position.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(defaultX, forKey: .defaultX)
    try container.encodeIfPresent(defaultY, forKey: .defaultY)
    try container.encodeIfPresent(relativeX, forKey: .relativeX)
    try container.encodeIfPresent(relativeY, forKey: .relativeY)
}
// sourcery:end

// sourcery:inline:Position.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    defaultX = try container.decodeIfPresent(Tenths.self, forKey: .defaultX)
    defaultY = try container.decodeIfPresent(Tenths.self, forKey: .defaultY)
    relativeX = try container.decodeIfPresent(Tenths.self, forKey: .relativeX)
    relativeY = try container.decodeIfPresent(Tenths.self, forKey: .relativeY)
}
// sourcery:end
// sourcery:inline:PrincipleVoice.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encode(type, forKey: .type)
    try container.encode(symbol, forKey: .symbol)
    try printStyleAlign.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:PrincipleVoice.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    type = try container.decode(StartStop.self, forKey: .type)
    symbol = try container.decode(PrincipleVoiceSymbol.self, forKey: .symbol)
    printStyleAlign = try PrintStyleAlign?(from: decoder)
}
// sourcery:end
// sourcery:inline:Print.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(staffSpacing, forKey: .staffSpacing)
    try container.encodeIfPresent(newSystem, forKey: .newSystem)
    try container.encodeIfPresent(newPage, forKey: .newPage)
    try container.encodeIfPresent(blankPage, forKey: .blankPage)
    try container.encodeIfPresent(pageNumber, forKey: .pageNumber)
    try container.encodeIfPresent(pageLayout, forKey: .pageLayout)
    try container.encodeIfPresent(systemLayout, forKey: .systemLayout)
    try container.encode(staffLayout, forKey: .staffLayout)
    try container.encodeIfPresent(measureLayout, forKey: .measureLayout)
    try container.encodeIfPresent(measureNumbering, forKey: .measureNumbering)
    try container.encodeIfPresent(partNameDisplay, forKey: .partNameDisplay)
    try container.encodeIfPresent(partAbbreviationDisplay, forKey: .partAbbreviationDisplay)
}
// sourcery:end

// sourcery:inline:Print.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    staffSpacing = try container.decodeIfPresent(Tenths.self, forKey: .staffSpacing)
    newSystem = try container.decodeIfPresent(Bool.self, forKey: .newSystem)
    newPage = try container.decodeIfPresent(Bool.self, forKey: .newPage)
    blankPage = try container.decodeIfPresent(Int.self, forKey: .blankPage)
    pageNumber = try container.decodeIfPresent(String.self, forKey: .pageNumber)
    pageLayout = try container.decodeIfPresent(PageLayout.self, forKey: .pageLayout)
    systemLayout = try container.decodeIfPresent(SystemLayout.self, forKey: .systemLayout)
    staffLayout = try container.decode([StaffLayout].self, forKey: .staffLayout)
    measureLayout = try container.decodeIfPresent(MeasureLayout.self, forKey: .measureLayout)
    measureNumbering = try container.decodeIfPresent(MeasureNumbering.self, forKey: .measureNumbering)
    partNameDisplay = try container.decodeIfPresent(NameDisplay.self, forKey: .partNameDisplay)
    partAbbreviationDisplay = try container.decodeIfPresent(NameDisplay.self, forKey: .partAbbreviationDisplay)
}
// sourcery:end
// sourcery:inline:PrintStyle.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try position.encode(to: encoder)
    try font.encode(to: encoder)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:PrintStyle.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    position = try Position(from: decoder)
    font = try Font(from: decoder)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:PrintStyleAlign.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(hAlign, forKey: .hAlign)
    try container.encodeIfPresent(vAlign, forKey: .vAlign)
}
// sourcery:end

// sourcery:inline:PrintStyleAlign.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    printStyle = try PrintStyle(from: decoder)
    hAlign = try container.decodeIfPresent(LeftCenterRight.self, forKey: .hAlign)
    vAlign = try container.decodeIfPresent(VAlign.self, forKey: .vAlign)
}
// sourcery:end
// sourcery:inline:PrintStyleAlignObject.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try printStyleAlign.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:PrintStyleAlignObject.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    printStyleAlign = try PrintStyleAlign(from: decoder)
}
// sourcery:end
// sourcery:inline:PrintStyleTrillSound.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(placement, forKey: .placement)
    try trillSound.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:PrintStyleTrillSound.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    printStyle = try PrintStyle(from: decoder)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    trillSound = try TrillSound(from: decoder)
}
// sourcery:end
// sourcery:inline:Printout.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try container.encodeIfPresent(printDot, forKey: .printDot)
    try container.encodeIfPresent(printSpacing, forKey: .printSpacing)
    try container.encodeIfPresent(printLyric, forKey: .printLyric)
}
// sourcery:end

// sourcery:inline:Printout.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    printDot = try container.decodeIfPresent(Bool.self, forKey: .printDot)
    printSpacing = try container.decodeIfPresent(Bool.self, forKey: .printSpacing)
    printLyric = try container.decodeIfPresent(Bool.self, forKey: .printLyric)
}
// sourcery:end
// sourcery:inline:Repeat.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(direction, forKey: .direction)
    try container.encodeIfPresent(times, forKey: .times)
    try container.encodeIfPresent(winged, forKey: .winged)
}
// sourcery:end

// sourcery:inline:Repeat.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    direction = try container.decode(BackwardForward.self, forKey: .direction)
    times = try container.decodeIfPresent(Int.self, forKey: .times)
    winged = try container.decodeIfPresent(Winged.self, forKey: .winged)
}
// sourcery:end
// sourcery:inline:Rest.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(measure, forKey: .measure)
    try container.encodeIfPresent(displayStep, forKey: .displayStep)
    try container.encodeIfPresent(displayOctave, forKey: .displayOctave)
}
// sourcery:end

// sourcery:inline:Rest.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    measure = try container.decodeIfPresent(Bool.self, forKey: .measure)
    displayStep = try container.decodeIfPresent(Step.self, forKey: .displayStep)
    displayOctave = try container.decodeIfPresent(Int.self, forKey: .displayOctave)
}
// sourcery:end
// sourcery:inline:Rights.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(type, forKey: .type)
}
// sourcery:end

// sourcery:inline:Rights.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    type = try container.decodeIfPresent(String.self, forKey: .type)
}
// sourcery:end
// sourcery:inline:Root.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(step, forKey: .step)
    try container.encodeIfPresent(alter, forKey: .alter)
}
// sourcery:end

// sourcery:inline:Root.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    step = try container.decode(RootStep.self, forKey: .step)
    alter = try container.decodeIfPresent(RootAlter.self, forKey: .alter)
}
// sourcery:end
// sourcery:inline:RootAlter.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try container.encodeIfPresent(location, forKey: .location)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:RootAlter.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Double.self, forKey: .value)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    location = try container.decodeIfPresent(LeftRight.self, forKey: .location)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:RootStep.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try container.encodeIfPresent(text, forKey: .text)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:RootStep.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Step.self, forKey: .value)
    text = try container.decodeIfPresent(String.self, forKey: .text)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:SMuFL.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(glyph, forKey: .glyph)
}
// sourcery:end

// sourcery:inline:SMuFL.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    glyph = try container.decode(SMuFLGlyph.self, forKey: .glyph)
}
// sourcery:end
// sourcery:inline:SMuFLGlyph.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
}
// sourcery:end

// sourcery:inline:SMuFLGlyph.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
}
// sourcery:end
// sourcery:inline:Scaling.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(millimeters, forKey: .millimeters)
    try container.encode(tenths, forKey: .tenths)
}
// sourcery:end

// sourcery:inline:Scaling.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    millimeters = try container.decode(Double.self, forKey: .millimeters)
    tenths = try container.decode(Tenths.self, forKey: .tenths)
}
// sourcery:end
// sourcery:inline:Scordatura.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(accords, forKey: .accords)
}
// sourcery:end

// sourcery:inline:Scordatura.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    accords = try container.decode([Accord].self, forKey: .accords)
}
// sourcery:end
// sourcery:inline:ScoreInstrument.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(name, forKey: .name)
    try container.encodeIfPresent(abbreviation, forKey: .abbreviation)
    try container.encodeIfPresent(sound, forKey: .sound)
    try container.encodeIfPresent(soloOrEnsemble, forKey: .soloOrEnsemble)
    try container.encodeIfPresent(virtualInstrument, forKey: .virtualInstrument)
}
// sourcery:end

// sourcery:inline:ScoreInstrument.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)
    abbreviation = try container.decodeIfPresent(String.self, forKey: .abbreviation)
    sound = try container.decodeIfPresent(String.self, forKey: .sound)
    soloOrEnsemble = try container.decodeIfPresent(SoloEnsemble.self, forKey: .soloOrEnsemble)
    virtualInstrument = try container.decodeIfPresent(VirtualInstrument.self, forKey: .virtualInstrument)
}
// sourcery:end
// sourcery:inline:ScorePart.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encodeIfPresent(identification, forKey: .identification)
    try container.encode(name, forKey: .name)
    try container.encodeIfPresent(nameDisplay, forKey: .nameDisplay)
    try container.encodeIfPresent(partAbbreviation, forKey: .partAbbreviation)
    try container.encodeIfPresent(partAbbreviationDisplay, forKey: .partAbbreviationDisplay)
    try container.encodeIfPresent(group, forKey: .group)
    try container.encodeIfPresent(scoreInstrument, forKey: .scoreInstrument)
    try container.encodeIfPresent(midi, forKey: .midi)
}
// sourcery:end

// sourcery:inline:ScorePart.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    identification = try container.decodeIfPresent(Identification.self, forKey: .identification)
    name = try container.decode(PartName.self, forKey: .name)
    nameDisplay = try container.decodeIfPresent(NameDisplay.self, forKey: .nameDisplay)
    partAbbreviation = try container.decodeIfPresent(PartName.self, forKey: .partAbbreviation)
    partAbbreviationDisplay = try container.decodeIfPresent(NameDisplay.self, forKey: .partAbbreviationDisplay)
    group = try container.decodeIfPresent([String].self, forKey: .group)
    scoreInstrument = try container.decodeIfPresent([ScoreInstrument].self, forKey: .scoreInstrument)
    midi = try container.decodeIfPresent([MIDI].self, forKey: .midi)
}
// sourcery:end
// sourcery:inline:ScorePart.MIDI.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(midiDevice, forKey: .midiDevice)
    try container.encodeIfPresent(midiInstrument, forKey: .midiInstrument)
}
// sourcery:end

// sourcery:inline:ScorePart.MIDI.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    midiDevice = try container.decodeIfPresent(MIDIDevice.self, forKey: .midiDevice)
    midiInstrument = try container.decodeIfPresent(MIDIInstrument.self, forKey: .midiInstrument)
}
// sourcery:end
// sourcery:inline:Slash.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(useDots, forKey: .useDots)
    try container.encodeIfPresent(useStems, forKey: .useStems)
    try container.encodeIfPresent(item, forKey: .item)
}
// sourcery:end

// sourcery:inline:Slash.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(StartStop.self, forKey: .type)
    useDots = try container.decodeIfPresent(Bool.self, forKey: .useDots)
    useStems = try container.decodeIfPresent(Bool.self, forKey: .useStems)
    item = try container.decodeIfPresent(Item.self, forKey: .item)
}
// sourcery:end
// sourcery:inline:Slash.Item.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encode(dotsCount, forKey: .dotsCount)
}
// sourcery:end

// sourcery:inline:Slash.Item.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(NoteTypeValue.self, forKey: .type)
    dotsCount = try container.decode(Int.self, forKey: .dotsCount)
}
// sourcery:end
// sourcery:inline:Slide.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(value, forKey: .value)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(lineType, forKey: .lineType)
    try dashedFormatting.encode(to: encoder)
    try printStyle.encode(to: encoder)
    try font.encode(to: encoder)
    try bendSound.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:Slide.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decodeIfPresent(String.self, forKey: .value)
    type = try container.decode(StartStop.self, forKey: .type)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    lineType = try container.decodeIfPresent(LineType.self, forKey: .lineType)
    dashedFormatting = try DashedFormatting(from: decoder)
    printStyle = try PrintStyle(from: decoder)
    font = try Font(from: decoder)
    bendSound = try BendSound(from: decoder)
}
// sourcery:end
// sourcery:inline:Slur.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(lineType, forKey: .lineType)
    try dashedFormatting.encode(to: encoder)
    try position.encode(to: encoder)
    try container.encodeIfPresent(placement, forKey: .placement)
    try container.encodeIfPresent(orientation, forKey: .orientation)
    try bezier.encode(to: encoder)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:Slur.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(StartStopContinue.self, forKey: .type)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    lineType = try container.decodeIfPresent(LineType.self, forKey: .lineType)
    dashedFormatting = try DashedFormatting?(from: decoder)
    position = try Position?(from: decoder)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    orientation = try container.decodeIfPresent(OverUnder.self, forKey: .orientation)
    bezier = try Bezier?(from: decoder)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:Sound.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(tempo, forKey: .tempo)
    try container.encodeIfPresent(dynamics, forKey: .dynamics)
    try container.encodeIfPresent(dacapo, forKey: .dacapo)
    try container.encodeIfPresent(segno, forKey: .segno)
    try container.encodeIfPresent(dalsegno, forKey: .dalsegno)
    try container.encodeIfPresent(coda, forKey: .coda)
    try container.encodeIfPresent(tocoda, forKey: .tocoda)
    try container.encodeIfPresent(divisions, forKey: .divisions)
    try container.encodeIfPresent(forwardRepeat, forKey: .forwardRepeat)
    try container.encodeIfPresent(fine, forKey: .fine)
    try container.encodeIfPresent(timeOnly, forKey: .timeOnly)
    try container.encodeIfPresent(pizzicato, forKey: .pizzicato)
    try container.encodeIfPresent(pan, forKey: .pan)
    try container.encodeIfPresent(elevation, forKey: .elevation)
    try container.encodeIfPresent(damperPedal, forKey: .damperPedal)
    try container.encodeIfPresent(softPedal, forKey: .softPedal)
    try container.encodeIfPresent(sostenutoPedal, forKey: .sostenutoPedal)
    try container.encodeIfPresent(offset, forKey: .offset)
    try container.encode(midi, forKey: .midi)
}
// sourcery:end

// sourcery:inline:Sound.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    tempo = try container.decodeIfPresent(Double.self, forKey: .tempo)
    dynamics = try container.decodeIfPresent(Double.self, forKey: .dynamics)
    dacapo = try container.decodeIfPresent(Bool.self, forKey: .dacapo)
    segno = try container.decodeIfPresent(String.self, forKey: .segno)
    dalsegno = try container.decodeIfPresent(String.self, forKey: .dalsegno)
    coda = try container.decodeIfPresent(String.self, forKey: .coda)
    tocoda = try container.decodeIfPresent(String.self, forKey: .tocoda)
    divisions = try container.decodeIfPresent(Divisions.self, forKey: .divisions)
    forwardRepeat = try container.decodeIfPresent(Bool.self, forKey: .forwardRepeat)
    fine = try container.decodeIfPresent(String.self, forKey: .fine)
    timeOnly = try container.decodeIfPresent(TimeOnly.self, forKey: .timeOnly)
    pizzicato = try container.decodeIfPresent(Bool.self, forKey: .pizzicato)
    pan = try container.decodeIfPresent(Double.self, forKey: .pan)
    elevation = try container.decodeIfPresent(Double.self, forKey: .elevation)
    damperPedal = try container.decodeIfPresent(YesNoNumber.self, forKey: .damperPedal)
    softPedal = try container.decodeIfPresent(YesNoNumber.self, forKey: .softPedal)
    sostenutoPedal = try container.decodeIfPresent(YesNoNumber.self, forKey: .sostenutoPedal)
    offset = try container.decodeIfPresent(Offset.self, forKey: .offset)
    midi = try container.decode([MIDI].self, forKey: .midi)
}
// sourcery:end
// sourcery:inline:Sound.MIDI.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(midiDevice, forKey: .midiDevice)
    try container.encodeIfPresent(midiInstrument, forKey: .midiInstrument)
    try container.encodeIfPresent(play, forKey: .play)
}
// sourcery:end

// sourcery:inline:Sound.MIDI.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    midiDevice = try container.decodeIfPresent(MIDIDevice.self, forKey: .midiDevice)
    midiInstrument = try container.decodeIfPresent(MIDIInstrument.self, forKey: .midiInstrument)
    play = try container.decodeIfPresent(Play.self, forKey: .play)
}
// sourcery:end
// sourcery:inline:StaffDetails.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(showFrets, forKey: .showFrets)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try container.encodeIfPresent(printSpacing, forKey: .printSpacing)
    try container.encodeIfPresent(staffType, forKey: .staffType)
    try container.encodeIfPresent(staffLines, forKey: .staffLines)
    try container.encode(staffTuning, forKey: .staffTuning)
    try container.encodeIfPresent(capo, forKey: .capo)
    try container.encodeIfPresent(staffSize, forKey: .staffSize)
}
// sourcery:end

// sourcery:inline:StaffDetails.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    showFrets = try container.decodeIfPresent(ShowFrets.self, forKey: .showFrets)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    printSpacing = try container.decodeIfPresent(Bool.self, forKey: .printSpacing)
    staffType = try container.decodeIfPresent(StaffType.self, forKey: .staffType)
    staffLines = try container.decodeIfPresent(Int.self, forKey: .staffLines)
    staffTuning = try container.decode([StaffTuning].self, forKey: .staffTuning)
    capo = try container.decodeIfPresent(Int.self, forKey: .capo)
    staffSize = try container.decodeIfPresent(Double.self, forKey: .staffSize)
}
// sourcery:end
// sourcery:inline:StaffLayout.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(staffDistance, forKey: .staffDistance)
}
// sourcery:end

// sourcery:inline:StaffLayout.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    staffDistance = try container.decodeIfPresent(Tenths.self, forKey: .staffDistance)
}
// sourcery:end
// sourcery:inline:StaffTuning.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(line, forKey: .line)
    try container.encode(tuningStep, forKey: .tuningStep)
    try container.encodeIfPresent(tuningAlter, forKey: .tuningAlter)
    try container.encode(tuningOctave, forKey: .tuningOctave)
}
// sourcery:end

// sourcery:inline:StaffTuning.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    line = try container.decodeIfPresent(Int.self, forKey: .line)
    tuningStep = try container.decode(Step.self, forKey: .tuningStep)
    tuningAlter = try container.decodeIfPresent(Double.self, forKey: .tuningAlter)
    tuningOctave = try container.decode(Int.self, forKey: .tuningOctave)
}
// sourcery:end
// sourcery:inline:Stem.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try position.encode(to: encoder)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:Stem.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(StemValue.self, forKey: .value)
    position = try Position(from: decoder)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:Stick.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(tip, forKey: .tip)
    try container.encode(stickType, forKey: .stickType)
    try container.encode(stickMaterial, forKey: .stickMaterial)
}
// sourcery:end

// sourcery:inline:Stick.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    tip = try container.decodeIfPresent(TipDirection.self, forKey: .tip)
    stickType = try container.decode(StickType.self, forKey: .stickType)
    stickMaterial = try container.decode(StickMaterial.self, forKey: .stickMaterial)
}
// sourcery:end
// sourcery:inline:StringMute.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try printStyleAlign.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:StringMute.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(OnOff.self, forKey: .type)
    printStyleAlign = try PrintStyleAlign?(from: decoder)
}
// sourcery:end
// sourcery:inline:StrongAccent.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(type, forKey: .type)
    try container.encodeIfPresent(placement, forKey: .placement)
    try position.encode(to: encoder)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:StrongAccent.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decodeIfPresent(UpDown.self, forKey: .type)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    position = try Position(from: decoder)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:StyleText.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:StyleText.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:Supports.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(attribute, forKey: .attribute)
    try container.encode(element, forKey: .element)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(value, forKey: .value)
}
// sourcery:end

// sourcery:inline:Supports.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    attribute = try container.decodeIfPresent(String.self, forKey: .attribute)
    element = try container.decode(String.self, forKey: .element)
    type = try container.decode(Bool.self, forKey: .type)
    value = try container.decodeIfPresent(String.self, forKey: .value)
}
// sourcery:end
// sourcery:inline:SystemDividers.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try left.encode(to: encoder)
    try right.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:SystemDividers.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    left = try PrintStyleAlignObject(from: decoder)
    right = try PrintStyleAlignObject(from: decoder)
}
// sourcery:end
// sourcery:inline:SystemLayout.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(margins, forKey: .margins)
    try container.encodeIfPresent(distance, forKey: .distance)
    try container.encodeIfPresent(topSystemDistance, forKey: .topSystemDistance)
    try container.encodeIfPresent(dividers, forKey: .dividers)
}
// sourcery:end

// sourcery:inline:SystemLayout.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    margins = try container.decodeIfPresent(SystemMargins.self, forKey: .margins)
    distance = try container.decodeIfPresent(Tenths.self, forKey: .distance)
    topSystemDistance = try container.decodeIfPresent(Int.self, forKey: .topSystemDistance)
    dividers = try container.decodeIfPresent(SystemDividers.self, forKey: .dividers)
}
// sourcery:end
// sourcery:inline:SystemMargins.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(left, forKey: .left)
    try container.encode(right, forKey: .right)
}
// sourcery:end

// sourcery:inline:SystemMargins.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    left = try container.decode(Tenths.self, forKey: .left)
    right = try container.decode(Tenths.self, forKey: .right)
}
// sourcery:end
// sourcery:inline:Technical.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(values, forKey: .values)
}
// sourcery:end

// sourcery:inline:Technical.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    values = try container.decode([Technique].self, forKey: .values)
}
// sourcery:end
// sourcery:inline:TextDecoration.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(underline, forKey: .underline)
    try container.encodeIfPresent(overline, forKey: .overline)
    try container.encodeIfPresent(lineThrough, forKey: .lineThrough)
}
// sourcery:end

// sourcery:inline:TextDecoration.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    underline = try container.decodeIfPresent(Int.self, forKey: .underline)
    overline = try container.decodeIfPresent(Int.self, forKey: .overline)
    lineThrough = try container.decodeIfPresent(Int.self, forKey: .lineThrough)
}
// sourcery:end
// sourcery:inline:TextElementData.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try font.encode(to: encoder)
    try textDecoration.encode(to: encoder)
    try container.encodeIfPresent(color, forKey: .color)
    try container.encodeIfPresent(textRotation, forKey: .textRotation)
    try container.encodeIfPresent(letterSpacing, forKey: .letterSpacing)
    try container.encodeIfPresent(direction, forKey: .direction)
}
// sourcery:end

// sourcery:inline:TextElementData.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    font = try Font?(from: decoder)
    textDecoration = try TextDecoration?(from: decoder)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
    textRotation = try container.decodeIfPresent(Double.self, forKey: .textRotation)
    letterSpacing = try container.decodeIfPresent(NumberOrNormal.self, forKey: .letterSpacing)
    direction = try container.decodeIfPresent(TextDirection.self, forKey: .direction)
}
// sourcery:end
// sourcery:inline:TextFontColor.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try font.encode(to: encoder)
    try container.encodeIfPresent(color, forKey: .color)
    try textDecoration.encode(to: encoder)
    try container.encodeIfPresent(textRotation, forKey: .textRotation)
    try container.encodeIfPresent(letterSpacing, forKey: .letterSpacing)
    try container.encodeIfPresent(dir, forKey: .dir)
}
// sourcery:end

// sourcery:inline:TextFontColor.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(String.self, forKey: .value)
    font = try Font?(from: decoder)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
    textDecoration = try TextDecoration?(from: decoder)
    textRotation = try container.decodeIfPresent(Double.self, forKey: .textRotation)
    letterSpacing = try container.decodeIfPresent(NumberOrNormal.self, forKey: .letterSpacing)
    dir = try container.decodeIfPresent(TextDirection.self, forKey: .dir)
}
// sourcery:end
// sourcery:inline:Tie.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(timeOnly, forKey: .timeOnly)
}
// sourcery:end

// sourcery:inline:Tie.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(StartStop.self, forKey: .type)
    timeOnly = try container.decodeIfPresent(TimeOnly.self, forKey: .timeOnly)
}
// sourcery:end
// sourcery:inline:Tied.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(lineType, forKey: .lineType)
    try dashedFormatting.encode(to: encoder)
    try position.encode(to: encoder)
    try container.encodeIfPresent(placement, forKey: .placement)
    try container.encodeIfPresent(orientation, forKey: .orientation)
    try bezier.encode(to: encoder)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:Tied.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(StartStopContinue.self, forKey: .type)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    lineType = try container.decodeIfPresent(LineType.self, forKey: .lineType)
    dashedFormatting = try DashedFormatting?(from: decoder)
    position = try Position?(from: decoder)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    orientation = try container.decodeIfPresent(OverUnder.self, forKey: .orientation)
    bezier = try Bezier?(from: decoder)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:Ties.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(start, forKey: .start)
    try container.encodeIfPresent(stop, forKey: .stop)
}
// sourcery:end

// sourcery:inline:Ties.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    start = try container.decodeIfPresent(Tie.self, forKey: .start)
    stop = try container.decodeIfPresent(Tie.self, forKey: .stop)
}
// sourcery:end
// sourcery:inline:Time.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(symbol, forKey: .symbol)
    try container.encodeIfPresent(separator, forKey: .separator)
    try printStyle.encode(to: encoder)
    try container.encodeIfPresent(hAlign, forKey: .hAlign)
    try container.encodeIfPresent(vAlign, forKey: .vAlign)
    try container.encodeIfPresent(printObject, forKey: .printObject)
    try container.encode(kind, forKey: .kind)
}
// sourcery:end

// sourcery:inline:Time.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    symbol = try container.decodeIfPresent(TimeSymbol.self, forKey: .symbol)
    separator = try container.decodeIfPresent(TimeSeparator.self, forKey: .separator)
    printStyle = try PrintStyle?(from: decoder)
    hAlign = try container.decodeIfPresent(LeftCenterRight.self, forKey: .hAlign)
    vAlign = try container.decodeIfPresent(VAlign.self, forKey: .vAlign)
    printObject = try container.decodeIfPresent(Bool.self, forKey: .printObject)
    kind = try container.decode(Kind.self, forKey: .kind)
}
// sourcery:end
// sourcery:inline:Time.Measured.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(signature, forKey: .signature)
    try container.encodeIfPresent(interchangeable, forKey: .interchangeable)
}
// sourcery:end

// sourcery:inline:Time.Measured.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    signature = try container.decode(Signature.self, forKey: .signature)
    interchangeable = try container.decodeIfPresent(Interchangeable.self, forKey: .interchangeable)
}
// sourcery:end
// sourcery:inline:Time.Signature.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(beats, forKey: .beats)
    try container.encode(beatType, forKey: .beatType)
}
// sourcery:end

// sourcery:inline:Time.Signature.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    beats = try container.decode(Int.self, forKey: .beats)
    beatType = try container.decode(Int.self, forKey: .beatType)
}
// sourcery:end
// sourcery:inline:Time.Unmeasured.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(symbol, forKey: .symbol)
}
// sourcery:end

// sourcery:inline:Time.Unmeasured.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    symbol = try container.decodeIfPresent(String.self, forKey: .symbol)
}
// sourcery:end
// sourcery:inline:TimeModification.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(actualNotes, forKey: .actualNotes)
    try container.encode(normalNotes, forKey: .normalNotes)
    try container.encodeIfPresent(normalType, forKey: .normalType)
    try container.encode(normalDotCount, forKey: .normalDotCount)
}
// sourcery:end

// sourcery:inline:TimeModification.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    actualNotes = try container.decode(Int.self, forKey: .actualNotes)
    normalNotes = try container.decode(Int.self, forKey: .normalNotes)
    normalType = try container.decodeIfPresent(NoteTypeValue.self, forKey: .normalType)
    normalDotCount = try container.decode(Int.self, forKey: .normalDotCount)
}
// sourcery:end
// sourcery:inline:Timewise.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(header, forKey: .header)
    try container.encode(measures, forKey: .measures)
}
// sourcery:end

// sourcery:inline:Timewise.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    header = try container.decode(Header.self, forKey: .header)
    measures = try container.decode([Measure].self, forKey: .measures)
}
// sourcery:end
// sourcery:inline:Timewise.Measure.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(attributes, forKey: .attributes)
    try container.encode(parts, forKey: .parts)
}
// sourcery:end

// sourcery:inline:Timewise.Measure.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    attributes = try container.decode(MeasureAttributes.self, forKey: .attributes)
    parts = try container.decode([Part].self, forKey: .parts)
}
// sourcery:end
// sourcery:inline:Timewise.Part.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(musicData, forKey: .musicData)
}
// sourcery:end

// sourcery:inline:Timewise.Part.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)
    musicData = try container.decode([MusicData].self, forKey: .musicData)
}
// sourcery:end
// sourcery:inline:Transpose.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(diatonic, forKey: .diatonic)
    try container.encode(chromatic, forKey: .chromatic)
    try container.encodeIfPresent(octaveChange, forKey: .octaveChange)
    try container.encodeIfPresent(double, forKey: .double)
}
// sourcery:end

// sourcery:inline:Transpose.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    diatonic = try container.decodeIfPresent(Int.self, forKey: .diatonic)
    chromatic = try container.decode(Int.self, forKey: .chromatic)
    octaveChange = try container.decodeIfPresent(Int.self, forKey: .octaveChange)
    double = try container.decodeIfPresent(Bool.self, forKey: .double)
}
// sourcery:end
// sourcery:inline:Tremolo.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(marks, forKey: .marks)
    try container.encodeIfPresent(type, forKey: .type)
    try container.encodeIfPresent(placement, forKey: .placement)
    try printStyle.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:Tremolo.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    marks = try container.decode(Int.self, forKey: .marks)
    type = try container.decodeIfPresent(StartStopSingle.self, forKey: .type)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    printStyle = try PrintStyle(from: decoder)
}
// sourcery:end
// sourcery:inline:TrillSound.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(startNote, forKey: .startNote)
    try container.encodeIfPresent(trillStep, forKey: .trillStep)
    try container.encodeIfPresent(twoNoteTurn, forKey: .twoNoteTurn)
    try container.encodeIfPresent(accelerate, forKey: .accelerate)
    try container.encodeIfPresent(beats, forKey: .beats)
    try container.encodeIfPresent(secondBeat, forKey: .secondBeat)
    try container.encodeIfPresent(lastBeat, forKey: .lastBeat)
}
// sourcery:end

// sourcery:inline:TrillSound.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    startNote = try container.decodeIfPresent(StartNote.self, forKey: .startNote)
    trillStep = try container.decodeIfPresent(TrillStep.self, forKey: .trillStep)
    twoNoteTurn = try container.decodeIfPresent(TwoNoteTurn.self, forKey: .twoNoteTurn)
    accelerate = try container.decodeIfPresent(Bool.self, forKey: .accelerate)
    beats = try container.decodeIfPresent(Int.self, forKey: .beats)
    secondBeat = try container.decodeIfPresent(Int.self, forKey: .secondBeat)
    lastBeat = try container.decodeIfPresent(Int.self, forKey: .lastBeat)
}
// sourcery:end
// sourcery:inline:Tuplet.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(bracket, forKey: .bracket)
    try container.encodeIfPresent(showNumber, forKey: .showNumber)
    try container.encodeIfPresent(showType, forKey: .showType)
    try container.encodeIfPresent(lineShape, forKey: .lineShape)
    try position.encode(to: encoder)
    try container.encodeIfPresent(placement, forKey: .placement)
    try container.encodeIfPresent(actualNotes, forKey: .actualNotes)
    try container.encodeIfPresent(normalNotes, forKey: .normalNotes)
}
// sourcery:end

// sourcery:inline:Tuplet.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(StartStop.self, forKey: .type)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    bracket = try container.decodeIfPresent(Bool.self, forKey: .bracket)
    showNumber = try container.decodeIfPresent(ShowTuplet.self, forKey: .showNumber)
    showType = try container.decodeIfPresent(ShowTuplet.self, forKey: .showType)
    lineShape = try container.decodeIfPresent(LineShape.self, forKey: .lineShape)
    position = try Position?(from: decoder)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    actualNotes = try container.decodeIfPresent(TupletPortion.self, forKey: .actualNotes)
    normalNotes = try container.decodeIfPresent(TupletPortion.self, forKey: .normalNotes)
}
// sourcery:end
// sourcery:inline:TupletDot.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try font.encode(to: encoder)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:TupletDot.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    font = try Font?(from: decoder)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:TupletNumber.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try font.encode(to: encoder)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:TupletNumber.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(Int.self, forKey: .value)
    font = try Font?(from: decoder)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:TupletPortion.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(tupletNumber, forKey: .tupletNumber)
    try container.encodeIfPresent(tupletType, forKey: .tupletType)
    try container.encode(tupletDots, forKey: .tupletDots)
}
// sourcery:end

// sourcery:inline:TupletPortion.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    tupletNumber = try container.decodeIfPresent(TupletNumber.self, forKey: .tupletNumber)
    tupletType = try container.decodeIfPresent(TupletType.self, forKey: .tupletType)
    tupletDots = try container.decode([TupletDot].self, forKey: .tupletDots)
}
// sourcery:end
// sourcery:inline:TupletType.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(value, forKey: .value)
    try font.encode(to: encoder)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:TupletType.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    value = try container.decode(NoteTypeValue.self, forKey: .value)
    font = try Font?(from: decoder)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:Unpitched.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(displayStep, forKey: .displayStep)
    try container.encode(displayOctave, forKey: .displayOctave)
}
// sourcery:end

// sourcery:inline:Unpitched.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    displayStep = try container.decode(Step.self, forKey: .displayStep)
    displayOctave = try container.decode(Int.self, forKey: .displayOctave)
}
// sourcery:end
// sourcery:inline:VirtualInstrument.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(library, forKey: .library)
    try container.encodeIfPresent(name, forKey: .name)
}
// sourcery:end

// sourcery:inline:VirtualInstrument.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    library = try container.decodeIfPresent(String.self, forKey: .library)
    name = try container.decodeIfPresent(String.self, forKey: .name)
}
// sourcery:end
// sourcery:inline:WavyLine.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(number, forKey: .number)
    try position.encode(to: encoder)
    try container.encodeIfPresent(placement, forKey: .placement)
    try container.encodeIfPresent(color, forKey: .color)
    try trillSound.encode(to: encoder)
}
// sourcery:end

// sourcery:inline:WavyLine.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(StartStopContinue.self, forKey: .type)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    position = try Position?(from: decoder)
    placement = try container.decodeIfPresent(AboveBelow.self, forKey: .placement)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
    trillSound = try TrillSound?(from: decoder)
}
// sourcery:end
// sourcery:inline:Wedge.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(type, forKey: .type)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(spread, forKey: .spread)
    try container.encodeIfPresent(niente, forKey: .niente)
    try container.encodeIfPresent(lineType, forKey: .lineType)
    try dashedFormatting.encode(to: encoder)
    try position.encode(to: encoder)
    try container.encodeIfPresent(color, forKey: .color)
}
// sourcery:end

// sourcery:inline:Wedge.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decode(WedgeType.self, forKey: .type)
    number = try container.decodeIfPresent(Int.self, forKey: .number)
    spread = try container.decodeIfPresent(Tenths.self, forKey: .spread)
    niente = try container.decodeIfPresent(Bool.self, forKey: .niente)
    lineType = try container.decodeIfPresent(LineType.self, forKey: .lineType)
    dashedFormatting = try DashedFormatting?(from: decoder)
    position = try Position?(from: decoder)
    color = try container.decodeIfPresent(Color.self, forKey: .color)
}
// sourcery:end
// sourcery:inline:Work.AutoEncodable
public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encodeIfPresent(number, forKey: .number)
    try container.encodeIfPresent(title, forKey: .title)
    try container.encodeIfPresent(opus, forKey: .opus)
}
// sourcery:end

// sourcery:inline:Work.AutoDecodable
public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    number = try container.decodeIfPresent(String.self, forKey: .number)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    opus = try container.decodeIfPresent(Opus.self, forKey: .opus)
}
// sourcery:end
