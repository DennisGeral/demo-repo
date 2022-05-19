tableextension 50103 "Cust Ext Table" extends Customer
{
    fields
    {
        // Add changes to table fields here
        field(9014; "TestID"; Text[20])
        {
            Caption = 'ID No.';
            trigger OnValidate()
            var
                temp: Text;
            begin
                temp := Rec.TestID;

                // if not Rec.TestID.Contains('-') then begin
                //     validateID(temp);
                //     addSlashes(temp);
                //     temp := temp.ToUpper();
                //     Rec.TestID := temp;
                // end
                // else begin
                //     // validateID(temp);
                //     temp := Rec.TestID;
                //     temp := DelChr(temp, '=', '-');
                //     Message('%1',temp);

                //     temp := temp.ToUpper();
                //     addSlashes(temp);
                //     Rec.TestID := temp;
                // end;

                If not Rec.TestID.Contains('-') then begin
                    ValidateID(temp);
                    AddSlashes(temp);
                end
                else
                    Message('Slashes are present');





            end;

        }
    }

    var
        myInt: Integer;

    local procedure AddSlashes(var temp: Text)
    var
        i: Integer;
    begin
        temp := Rec.TestID.ToLower();
        for i := 1 to StrLen(Rec.TestID) do begin
            temp := CopyStr(Rec.TestID, 1, 2);
            temp := temp + '-';
            temp := temp + CopyStr(Rec.TestID, 3, StrLen(Rec.TestID) - 5);
            temp := temp + '-';
            temp := temp + CopyStr(Rec.TestID, StrLen(Rec.TestID) - 2, 1);
            temp := temp + '-';
            temp := temp + CopyStr(Rec.TestID, StrLen(Rec.TestID) - 1, 2);
        end;
        Rec.TestID := temp;
    end;

    local procedure ValidateID(var temp: Text)
    var
        i: Integer;
        letterList: List of [Char];
    begin
        letterList.AddRange('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'g', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z');
        temp := Rec.TestID.ToLower();
        for i := 1 to StrLen(temp) do begin
            // Message('%1 at position %2', Rec.TestID[i], i);
            if letterList.Contains(temp[1]) or letterList.Contains(temp[2]) then
                Error('First 2 letters should be numbers');

            if not letterList.Contains(Rec.TestID[StrLen(Rec.TestID) - 2]) then
                Error('Valid IDs have a letter 3rd from last');
            if letterList.Contains(Rec.TestID[i]) and (i <> StrLen(Rec.TestID) - 2) then
                Error('Letters not in valid position');

            if StrLen(temp) < 12 then
                Error('ID cannot be less than 12');
            // else
            if StrLen(Rec.TestID) > 13 then
                Error('ID cannot be greater than 15 characters');
        end;
        Rec.TestID := Rec.TestID.ToUpper();
    end;
}