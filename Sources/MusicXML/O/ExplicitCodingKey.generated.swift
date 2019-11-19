// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// sourcery:inline:Accidental.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case cautionary
    case editorial
    case parentheses
    case bracket
    case size
    case value = ""
}
// sourcery:end

// sourcery:inline:AccidentalMark.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case placement
    case value = ""
}
// sourcery:end

// sourcery:inline:AccidentalText.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case justify
    case hAlign
    case vAlign
    case underline
    case overline
    case lineThrough
    case rotation
    case letterSpacing
    case lineHeight
    case direction
    case enclosure
    case value = ""
}
// sourcery:end

// sourcery:inline:Accord.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case string
    case tuningStep
    case tuningAlter
    case tuningOctave
}
// sourcery:end

// sourcery:inline:AccordionRegistration.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case high
    case middle
    case low
}
// sourcery:end

// sourcery:inline:Appearance.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case lineWidths
    case noteSizes
    case distances
    case otherAppearances
}
// sourcery:end

// sourcery:inline:Arpeggiate.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case direction
    case placement
    case color
}
// sourcery:end

// sourcery:inline:Arrow.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case kind
    case placement
}
// sourcery:end

// sourcery:inline:Articulations.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case values
}
// sourcery:end

// sourcery:inline:Attributes.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case footnote
    case level
    case divisions
    case keys
    case times
    case staves
    case partSymbol
    case instruments
    case clefs
    case staffDetails
    case transpose
    case measureStyles
}
// sourcery:end

// sourcery:inline:Backup.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case duration
    case editorial
}
// sourcery:end

// sourcery:inline:BarStyleColor.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case color
    case value = ""
}
// sourcery:end

// sourcery:inline:Barline.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case location
    case divisions
    case barStyle
    case editorial
    case wavyLine
    case fermata
    case ending
    case `repeat`
}
// sourcery:end

// sourcery:inline:Barre.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case color
}
// sourcery:end

// sourcery:inline:Bass.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case step
    case alter
}
// sourcery:end

// sourcery:inline:BassAlter.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case printObject
    case location
    case value = ""
}
// sourcery:end

// sourcery:inline:BassStep.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case text
    case value = ""
}
// sourcery:end

// sourcery:inline:Beam.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case repeater
    case fan
    case color
    case value = ""
}
// sourcery:end

// sourcery:inline:BeatRepeat.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case slashes
    case useDots
}
// sourcery:end

// sourcery:inline:Beater.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case tip
    case value = ""
}
// sourcery:end

// sourcery:inline:Bend.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case accelerate
    case beats
    case firstBeat
    case lastBeat
    case bendAlter
    case prependOrRelease
    case withBar
}
// sourcery:end

// sourcery:inline:BendSound.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case accelerate
    case beats
    case firstBeat
    case lastBeat
}
// sourcery:end

// sourcery:inline:Bezier.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case bezierX
    case bezierY
    case bezierX2
    case bezierY2
    case bezierOffset
    case bezierOffset2
}
// sourcery:end

// sourcery:inline:Bookmark.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case id
    case name
    case element
    case position
}
// sourcery:end

// sourcery:inline:Bracket.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case number
    case lineEnd
    case endLength
    case lineType
    case dashLength
    case spaceLength
    case color
}
// sourcery:end

// sourcery:inline:BreathMark.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case placement
    case value = ""
}
// sourcery:end

// sourcery:inline:Cancel.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case fifths
    case location
}
// sourcery:end

// sourcery:inline:Clef.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case additional
    case size
    case afterBarline
    case printObject
    case sign
    case line
    case clefOctaveChange
}
// sourcery:end

// sourcery:inline:Creator.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case value = ""
}
// sourcery:end

// sourcery:inline:Credit.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case page
    case types
    case link
    case bookmarks
}
// sourcery:end

// sourcery:inline:Credit.Words.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case words
    case links
    case bookmark
}
// sourcery:end

// sourcery:inline:DashedFormatting.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case dashLength
    case spaceLength
}
// sourcery:end

// sourcery:inline:Dashes.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
}
// sourcery:end

// sourcery:inline:Defaults.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case scaling
    case pageLayout
    case systemLayout
    case staffLayout
    case appearance
    case lyricFonts
    case lyricLanguages
}
// sourcery:end

// sourcery:inline:Degree.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case printObject
    case alter
    case type
    case value = ""
}
// sourcery:end

// sourcery:inline:DegreeAlter.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case plusMinus
    case value = ""
}
// sourcery:end

// sourcery:inline:DegreeType.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case text
    case value = ""
}
// sourcery:end

// sourcery:inline:DegreeValue.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case symbol
    case text
    case value = ""
}
// sourcery:end

// sourcery:inline:Direction.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case placement
    case directive
    case directionTypes
    case offset
    case footnote
    case level
    case voice
    case staff
    case sound
}
// sourcery:end

// sourcery:inline:Distance.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case value = ""
}
// sourcery:end

// sourcery:inline:Dynamics.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case values
    case placement
    case enclosure
}
// sourcery:end

// sourcery:inline:Editorial.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case footnote
    case level
}
// sourcery:end

// sourcery:inline:EditorialVoice.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case footnote
    case level
    case voice
}
// sourcery:end

// sourcery:inline:Encoding.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case values
}
// sourcery:end

// sourcery:inline:Ending.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case type
    case printObject
    case endLength
    case textX
    case textY
    case value = ""
}
// sourcery:end

// sourcery:inline:Extend.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
}
// sourcery:end

// sourcery:inline:Feature.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case value = ""
}
// sourcery:end

// sourcery:inline:Fermata.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case value = ""
}
// sourcery:end

// sourcery:inline:Figure.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case prefix
    case figureNumber
    case suffix
    case extend
}
// sourcery:end

// sourcery:inline:FiguredBass.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case parentheses
    case figures
    case duration
    case footnote
    case level
}
// sourcery:end

// sourcery:inline:Fingering.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case substitution
    case alternate
    case placement
    case value = ""
}
// sourcery:end

// sourcery:inline:FirstFret.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case text
    case location
    case value = ""
}
// sourcery:end

// sourcery:inline:Font.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case family
    case style
    case size
    case weight
}
// sourcery:end

// sourcery:inline:FormattedText.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case justify
    case hAlign
    case vAlign
    case underline
    case overline
    case lineThrough
    case rotation
    case letterSpacing
    case lineHeight
    case direction
    case enclosure
    case value = ""
}
// sourcery:end

// sourcery:inline:Forward.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case duration
    case editorialVoice
    case staff
}
// sourcery:end

// sourcery:inline:Frame.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case color
    case hAlign
    case vAlign
    case height
    case width
    case unplayed
    case frameStrings
    case frameFrets
    case firstFret
    case frameNotes
}
// sourcery:end

// sourcery:inline:FrameNote.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case string
    case fret
    case fingering
    case barre
}
// sourcery:end

// sourcery:inline:Fret.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case color
    case value = ""
}
// sourcery:end

// sourcery:inline:Glissando.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case number
    case lineType
    case value = ""
}
// sourcery:end

// sourcery:inline:Grace.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case stealTimePrevious
    case stealTimeFollowing
    case makeTime
    case slash
}
// sourcery:end

// sourcery:inline:GroupBarline.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case color
    case value = ""
}
// sourcery:end

// sourcery:inline:GroupName.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case justify
    case value = ""
}
// sourcery:end

// sourcery:inline:GroupSymbol.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case color
    case value = ""
}
// sourcery:end

// sourcery:inline:Grouping.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case feature
    case number
    case memberOf
}
// sourcery:end

// sourcery:inline:HammerOnPullOff.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case number
    case placement
    case value = ""
}
// sourcery:end

// sourcery:inline:Handbell.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case placement
    case value = ""
}
// sourcery:end

// sourcery:inline:Harmonic.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case naturalArtificial
    case baseSoundingTouchingPitch
    case printObject
    case placement
}
// sourcery:end

// sourcery:inline:Harmony.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case placement
    case printObject
    case printFrame
    case chords
    case frame
    case offset
    case editorial
    case staff
}
// sourcery:end

// sourcery:inline:HarmonyChord.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case rootOrFunction
    case kind
    case inversion
    case bass
    case degrees
}
// sourcery:end

// sourcery:inline:HarpPedals.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case pedalTunings
}
// sourcery:end

// sourcery:inline:Header.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case work
    case movementNumber
    case movementTitle
    case identification
    case defaults
    case credits
    case partList
}
// sourcery:end

// sourcery:inline:HeelToe.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case placement
    case substitution
}
// sourcery:end

// sourcery:inline:Hole.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case holeType
    case holeClosed
    case holeShape
    case placement
}
// sourcery:end

// sourcery:inline:HoleClosed.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case location
    case value = ""
}
// sourcery:end

// sourcery:inline:HorizontalTurn.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case placement
    case slash
}
// sourcery:end

// sourcery:inline:Identification.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case creators
    case rights
    case encoding
    case source
    case relation
    case miscellaneous
}
// sourcery:end

// sourcery:inline:Image.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case source
    case type
    case hAlign
    case vAlign
}
// sourcery:end

// sourcery:inline:Instrument.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case id
}
// sourcery:end

// sourcery:inline:Interchangeable.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case symbol
    case separator
}
// sourcery:end

// sourcery:inline:Inversion.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case value = ""
}
// sourcery:end

// sourcery:inline:Key.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case printObject
    case kind
    case keyOctaves
}
// sourcery:end

// sourcery:inline:Key.AlteredTone.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case step
    case alter
    case accidental
}
// sourcery:end

// sourcery:inline:Key.Traditional.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case cancel
    case fifths
    case mode
}
// sourcery:end

// sourcery:inline:KeyOctave.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case cancel
    case value = ""
}
// sourcery:end

// sourcery:inline:Kind.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case useSymbols
    case text
    case stackDegrees
    case parenthesesDegrees
    case bracketDegrees
    case hAlign
    case vAlign
    case value = ""
}
// sourcery:end

// sourcery:inline:Level.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case reference
    case levelDisplay
}
// sourcery:end

// sourcery:inline:LevelDisplay.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case parentheses
    case bracket
    case size
}
// sourcery:end

// sourcery:inline:Line.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case lineShape
    case lineType
    case placement
}
// sourcery:end

// sourcery:inline:LineWidth.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case value = ""
}
// sourcery:end

// sourcery:inline:LinearArrow.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case direction
    case style
}
// sourcery:end

// sourcery:inline:Link.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case name
    case element
    case position
}
// sourcery:end

// sourcery:inline:Lyric.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case kind
    case number
    case name
    case justify
    case color
    case placement
    case printObject
    case endLine
    case endParagraph
    case level
}
// sourcery:end

// sourcery:inline:Lyric.Verbal.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case text
    case syllabic
}
// sourcery:end

// sourcery:inline:LyricFont.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case name
}
// sourcery:end

// sourcery:inline:LyricLanguage.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case name
    case language
}
// sourcery:end

// sourcery:inline:MIDIDevice.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case port
    case id
    case value = ""
}
// sourcery:end

// sourcery:inline:MIDIInstrument.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case id
    case channel
    case name
    case bank
    case program
    case unpitched
    case volume
    case pan
    case elevation
}
// sourcery:end

// sourcery:inline:MeasureAttributes.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case text
    case implicit
    case nonControlling
    case width
    case optionalUniqueID
}
// sourcery:end

// sourcery:inline:MeasureLayout.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case measureDistance
}
// sourcery:end

// sourcery:inline:MeasureNumbering.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case value = ""
}
// sourcery:end

// sourcery:inline:MeasureRepeat.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case slashes
}
// sourcery:end

// sourcery:inline:MeasureStyle.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case color
    case kind
}
// sourcery:end

// sourcery:inline:Metronome.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case kind
    case justify
    case parentheses
}
// sourcery:end

// sourcery:inline:Metronome.Complicated.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case metronomeNote
    case metronomeRelation
    case otherMetronomeNote
}
// sourcery:end

// sourcery:inline:Metronome.Regular.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case beatUnit
    case beatUnitDotCount
    case relation
}
// sourcery:end

// sourcery:inline:MetronomeBeam.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case value = ""
}
// sourcery:end

// sourcery:inline:MetronomeNote.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case metronomeType
    case metronomeDotCount
    case metronomeBeams
    case metronomeTuplet
}
// sourcery:end

// sourcery:inline:MetronomeTuplet.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case bracket
    case showNumber
    case value = ""
}
// sourcery:end

// sourcery:inline:Miscellaneous.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case fields
}
// sourcery:end

// sourcery:inline:MiscellaneousField.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case name
    case value = ""
}
// sourcery:end

// sourcery:inline:Mordent.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case long
    case approach
    case departure
    case value = ""
}
// sourcery:end

// sourcery:inline:MultipleRest.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case useSymbols
    case value = ""
}
// sourcery:end

// sourcery:inline:MusicXML.String.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case placement
    case value = ""
}
// sourcery:end

// sourcery:inline:NameDisplay.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case printObject
    case texts
}
// sourcery:end

// sourcery:inline:NonArpeggiate.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case number
    case placement
    case color
}
// sourcery:end

// sourcery:inline:Notations.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case printObject
    case footnote
    case level
    case values
}
// sourcery:end

// sourcery:inline:Note.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case kind
    case instrument
    case footnote
    case level
    case voice
    case type
    case dots
    case accidental
    case timeModification
    case stem
    case notehead
    case noteheadText
    case staff
    case beams
    case notations
    case lyrics
    case play
    case printObject
    case printDot
    case printSpacing
    case printLyric
    case dynamics
    case endDynamics
    case attack
    case release
    case timeOnly
    case pizzicato
}
// sourcery:end

// sourcery:inline:Note.Cue.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case isChord
    case pitchUnpitchedOrRest
    case duration
}
// sourcery:end

// sourcery:inline:Note.Grace.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case isChord
    case pitchUnpitchedOrRest
    case ties
}
// sourcery:end

// sourcery:inline:Note.Normal.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case isChord
    case pitchUnpitchedOrRest
    case duration
    case ties
}
// sourcery:end

// sourcery:inline:NoteSize.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case value = ""
}
// sourcery:end

// sourcery:inline:NoteType.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case size
    case value = ""
}
// sourcery:end

// sourcery:inline:Notehead.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case filled
    case parentheses
    case color
    case value = ""
}
// sourcery:end

// sourcery:inline:NoteheadText.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case values
}
// sourcery:end

// sourcery:inline:OctaveShift.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case number
    case size
}
// sourcery:end

// sourcery:inline:Offset.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case sound
    case value = ""
}
// sourcery:end

// sourcery:inline:Opus.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
}
// sourcery:end

// sourcery:inline:Ornaments.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case values
    case accidentalMarks
}
// sourcery:end

// sourcery:inline:OtherAppearance.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case value = ""
}
// sourcery:end

// sourcery:inline:OtherDirection.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case printObject
    case value = ""
}
// sourcery:end

// sourcery:inline:OtherDynamics.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case smufl
}
// sourcery:end

// sourcery:inline:OtherNotation.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case number
    case printObject
    case placement
    case value = ""
}
// sourcery:end

// sourcery:inline:OtherPlay.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case value = ""
}
// sourcery:end

// sourcery:inline:PageLayout.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case height
    case width
    case margins
}
// sourcery:end

// sourcery:inline:PageMargins.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case left
    case right
    case top
    case bottom
}
// sourcery:end

// sourcery:inline:PartGroup.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case number
    case name
    case nameDisplay
    case abbreviation
    case abbreviationDisplay
    case symbol
    case barline
    case time
    case editorial
}
// sourcery:end

// sourcery:inline:PartList.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case parts
}
// sourcery:end

// sourcery:inline:PartName.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case printObject
    case justify
    case value = ""
}
// sourcery:end

// sourcery:inline:PartSymbol.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case kind
    case topStaff
    case bottomStaff
    case color
    case value = ""
}
// sourcery:end

// sourcery:inline:Partwise.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case header
    case parts
}
// sourcery:end

// sourcery:inline:Partwise.Measure.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case attributes
    case musicData
}
// sourcery:end

// sourcery:inline:Partwise.Part.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case id
    case measures
}
// sourcery:end

// sourcery:inline:Pedal.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case line
    case sign
}
// sourcery:end

// sourcery:inline:PedalTuning.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case step
    case alter
}
// sourcery:end

// sourcery:inline:PerMinute.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case value = ""
}
// sourcery:end

// sourcery:inline:Percussion.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case enclosure
    case kind
}
// sourcery:end

// sourcery:inline:Pitch.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case step
    case alter
    case octave
}
// sourcery:end

// sourcery:inline:PlacementPrintStyle.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case placement
}
// sourcery:end

// sourcery:inline:PlacementText.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case placement
    case value = ""
}
// sourcery:end

// sourcery:inline:Play.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case values
}
// sourcery:end

// sourcery:inline:Position.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case defaultX
    case defaultY
    case relativeX
    case relativeY
}
// sourcery:end

// sourcery:inline:PrincipleVoice.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case symbol
    case value = ""
}
// sourcery:end

// sourcery:inline:Print.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case staffSpacing
    case newSystem
    case newPage
    case blankPage
    case pageNumber
    case pageLayout
    case systemLayout
    case staffLayout
    case measureLayout
    case measureNumbering
    case partNameDisplay
    case partAbbreviationDisplay
}
// sourcery:end

// sourcery:inline:PrintStyle.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case color
}
// sourcery:end

// sourcery:inline:PrintStyleAlign.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case hAlign
    case vAlign
}
// sourcery:end

// sourcery:inline:PrintStyleAlignObject.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case printObject
}
// sourcery:end

// sourcery:inline:PrintStyleTrillSound.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case placement
}
// sourcery:end

// sourcery:inline:Printout.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case printObject
    case printDot
    case printSpacing
    case printLyric
}
// sourcery:end

// sourcery:inline:Repeat.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case direction
    case times
    case winged
}
// sourcery:end

// sourcery:inline:Rest.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case measure
    case displayStep
    case displayOctave
}
// sourcery:end

// sourcery:inline:Rights.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case value = ""
}
// sourcery:end

// sourcery:inline:Root.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case step
    case alter
}
// sourcery:end

// sourcery:inline:RootAlter.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case printObject
    case location
    case value = ""
}
// sourcery:end

// sourcery:inline:RootStep.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case text
    case value = ""
}
// sourcery:end

// sourcery:inline:SMuFL.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case glyph
}
// sourcery:end

// sourcery:inline:SMuFLGlyph.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case name
}
// sourcery:end

// sourcery:inline:Scaling.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case millimeters
    case tenths
}
// sourcery:end

// sourcery:inline:Scordatura.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case accords
}
// sourcery:end

// sourcery:inline:ScoreInstrument.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case id
    case name
    case abbreviation
    case sound
    case soloOrEnsemble
    case virtualInstrument
}
// sourcery:end

// sourcery:inline:ScorePart.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case id
    case identification
    case name
    case nameDisplay
    case partAbbreviation
    case partAbbreviationDisplay
    case group
    case scoreInstrument
    case midi
}
// sourcery:end

// sourcery:inline:ScorePart.MIDI.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case midiDevice
    case midiInstrument
}
// sourcery:end

// sourcery:inline:Slash.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case useDots
    case useStems
    case item
}
// sourcery:end

// sourcery:inline:Slash.Item.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case dotsCount
}
// sourcery:end

// sourcery:inline:Slide.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case number
    case lineType
    case value = ""
}
// sourcery:end

// sourcery:inline:Slur.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case number
    case lineType
    case placement
    case orientation
    case color
}
// sourcery:end

// sourcery:inline:Sound.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case tempo
    case dynamics
    case dacapo
    case segno
    case dalsegno
    case coda
    case tocoda
    case divisions
    case forwardRepeat
    case fine
    case timeOnly
    case pizzicato
    case pan
    case elevation
    case damperPedal
    case softPedal
    case sostenutoPedal
    case offset
    case midi
}
// sourcery:end

// sourcery:inline:Sound.MIDI.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case midiDevice
    case midiInstrument
    case play
}
// sourcery:end

// sourcery:inline:StaffDetails.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case showFrets
    case printObject
    case printSpacing
    case staffType
    case staffLines
    case staffTuning
    case capo
    case staffSize
}
// sourcery:end

// sourcery:inline:StaffLayout.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case staffDistance
}
// sourcery:end

// sourcery:inline:StaffTuning.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case line
    case tuningStep
    case tuningAlter
    case tuningOctave
}
// sourcery:end

// sourcery:inline:Stem.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case color
    case value = ""
}
// sourcery:end

// sourcery:inline:Stick.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case tip
    case stickType
    case stickMaterial
}
// sourcery:end

// sourcery:inline:StringMute.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
}
// sourcery:end

// sourcery:inline:StrongAccent.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case placement
}
// sourcery:end

// sourcery:inline:StyleText.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case value = ""
}
// sourcery:end

// sourcery:inline:Supports.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case attribute
    case element
    case type
    case value = ""
}
// sourcery:end

// sourcery:inline:SystemDividers.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
}
// sourcery:end

// sourcery:inline:SystemLayout.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case margins
    case distance
    case topSystemDistance
    case dividers
}
// sourcery:end

// sourcery:inline:SystemMargins.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case left
    case right
}
// sourcery:end

// sourcery:inline:Technical.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case values
}
// sourcery:end

// sourcery:inline:TextDecoration.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case underline
    case overline
    case lineThrough
}
// sourcery:end

// sourcery:inline:TextElementData.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case color
    case textRotation
    case letterSpacing
    case direction
    case value = ""
}
// sourcery:end

// sourcery:inline:TextFontColor.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case color
    case textRotation
    case letterSpacing
    case dir
    case value = ""
}
// sourcery:end

// sourcery:inline:Tie.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case timeOnly
}
// sourcery:end

// sourcery:inline:Tied.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case number
    case lineType
    case placement
    case orientation
    case color
}
// sourcery:end

// sourcery:inline:Ties.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case start
    case stop
}
// sourcery:end

// sourcery:inline:Time.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case symbol
    case separator
    case hAlign
    case vAlign
    case printObject
    case kind
}
// sourcery:end

// sourcery:inline:Time.Measured.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case signature
    case interchangeable
}
// sourcery:end

// sourcery:inline:Time.Signature.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case beats
    case beatType
}
// sourcery:end

// sourcery:inline:Time.Unmeasured.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case symbol
}
// sourcery:end

// sourcery:inline:TimeModification.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case actualNotes
    case normalNotes
    case normalType
    case normalDotCount
}
// sourcery:end

// sourcery:inline:Timewise.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case header
    case measures
}
// sourcery:end

// sourcery:inline:Timewise.Measure.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case attributes
    case parts
}
// sourcery:end

// sourcery:inline:Timewise.Part.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case id
    case musicData
}
// sourcery:end

// sourcery:inline:Transpose.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case diatonic
    case chromatic
    case octaveChange
    case double
}
// sourcery:end

// sourcery:inline:Tremolo.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case marks
    case type
    case placement
}
// sourcery:end

// sourcery:inline:TrillSound.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case startNote
    case trillStep
    case twoNoteTurn
    case accelerate
    case beats
    case secondBeat
    case lastBeat
}
// sourcery:end

// sourcery:inline:Tuplet.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case number
    case bracket
    case showNumber
    case showType
    case lineShape
    case placement
    case actualNotes
    case normalNotes
}
// sourcery:end

// sourcery:inline:TupletDot.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case color
}
// sourcery:end

// sourcery:inline:TupletNumber.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case color
    case value = ""
}
// sourcery:end

// sourcery:inline:TupletPortion.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case tupletNumber
    case tupletType
    case tupletDots
}
// sourcery:end

// sourcery:inline:TupletType.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case color
    case value = ""
}
// sourcery:end

// sourcery:inline:Unpitched.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case displayStep
    case displayOctave
}
// sourcery:end

// sourcery:inline:VirtualInstrument.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case library
    case name
}
// sourcery:end


// sourcery:inline:Wedge.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case type
    case number
    case spread
    case niente
    case lineType
    case color
}
// sourcery:end

// sourcery:inline:Work.ExplicitCodingKey
enum CodingKeys: String, CodingKey {
    case number
    case title
    case opus
}
// sourcery:end

