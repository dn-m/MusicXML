groups="BendSound|\
Bezier|\
DashedFormatting|\
Font|\
PlacementPrintStyle|\
Position|\
Printout|\
PrintStyle|\
PrintStyleAlign|\
PrintStyleAlignObject|\
PrintStyleTrillSound|\
TextDecoration|\
TrillSound"
if [[ -z $(grep 'Attribute Groups' "$1") &&
    $(gsed -r -n "/$groups/ p" "$1") ]] ; then
    gsed -i -n -r "
/public (let|var).*($groups).*/ {
    H
}
/public (let|var).*($groups).*/ !{
    /Initializers/ {
        x
        i\
\ \ \ \ // MARK: Attribute Groups
        p;x
        i\

        p
}
    /Initializers/ !{
        p
    }
}" "$1"
fi
