'--------------------------------------------------------------------------------------------------'
' ArrayUnique                                                                                      '
'--------------------------------------------------------------------------------------------------'
' Returns an array containing elements of input array without duplicate values.                    '
'                                                                                                  '
' Parameters:                                                                                      '
'                                                                                                  '
'   Arr As Variant                                                                                 '
'     The input array.                                                                             '
'                                                                                                  '
' Examples:                                                                                        '
'--------------------------------------------------------------------------------------------------'
'                                                                                                  '
'     result_array = ArrayUnique(input_array)                                                      '
'                                                                                                  '
' Expected values:                                                                                 '
'                                                                                                  '
'   input_array:                                                                                   '
'     Array(10,"vodka","10","beer","water",12,"beer","applejuice",12)                              '
'   result_array:                                                                                  '
'     Array(10,"vodka","10","beer","water",12,"applejuice")                                        '
'--------------------------------------------------------------------------------------------------'
'                                                                                                  '
'     Sub TestArrayUnique                                                                          '
'         Dim item As Variant                                                                      '
'         Dim result As String                                                                     '
'         Dim inputarr As Variant                                                                  '
'         Dim resultarr As Variant                                                                 '
'         result = ""                                                                              '
'         inputarr = Array(10,"vodka","10","beer","water",12,"beer","applejuice",12)               '
'         resultarr = ArrayUnique(inputarr)                                                        '
'         For Each item In resultarr                                                               '
'             result = result + IIf(TypeName(item) = "String", """" + item + """", item) + ","     '
'         Next item                                                                                '
'         MsgBox(result)                                                                           '
'     End Sub                                                                                      '
'                                                                                                  '
'--------------------------------------------------------------------------------------------------'
' Feedback & Issues:                                                                               '
'   https://github.com/aa6/libreoffice_calc_basic_extras/issues                                    '
'--------------------------------------------------------------------------------------------------'
Function ArrayUnique(Arr As Variant)

    Dim item As Variant
    Dim entry As Variant
    Dim result() As Variant

    For Each item In Arr
        For Each entry In result
            If item = entry Then
                Goto ArrayUniqueNextArrItem
            End If
        Next entry
        Redim Preserve result(UBound(result) + 1) As Variant
        result(UBound(result)) = item
        ArrayUniqueNextArrItem:
    Next item
    ArrayUnique = result

End Function