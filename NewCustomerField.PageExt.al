// pageextension 50116 "New Customer Field" extends "Customer Card"
// {

//     layout
//     {
//         addafter(Name)
//         {
//             field("ID Number"; Rec."ID Number")
//             {
//                 ApplicationArea = all;
//                 ToolTip = 'This specifes the ID Number';

//                 trigger OnValidate()
//                 var
//                     numOldID: Text;
//                     newName: text;
//                     numID: Text;
//                     newName1: Text;
//                     newName2: Text;
//                     IDtext: Text;
//                     secondFromFirst: Text;
//                     IDThirdFromLast: Integer;
//                     i: Integer;
//                     twoIDNo: list of [Text];
//                     aphlabetNos: list of [Text];

//                 begin

//                     if (13 <= StrLen(rec."ID Number")) and (11 >= StrLen(rec."ID Number")) then begin
//                         aphlabetNos.AddRange('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'Z');
//                         numOldID := Rec."ID Number".ToUpper();
//                         newName := CopyStr(numOldID, 1, 2);

//                         for i := 00 to 99 do
//                             twoIDNo.Add(format(i));

//                         if (twoIDNo.Contains(format(newName))) then
//                             IDThirdFromLast := StrLen(rec."ID Number") - 2;

//                         secondFromFirst := CopyStr(numOldID, 2, 1);

//                         IDtext := numOldID.Substring(IDThirdFromLast, 1);

//                         if (aphlabetNos.Contains(IDtext)) then
//                             newName2 := CopyStr(numOldID, IDThirdFromLast, 11);
//                         newName1 := CopyStr(numOldID, 3, IDThirdFromLast - 3);

//                         if StrLen(newName1) <= 7 then begin
//                             numID := newName + '-' + newName1 + '-' + newName2;

//                             ReplaceContents(numID);
//                         end
//                         else
//                             if StrLen(newName1) <= 8 then begin
//                                 numID := newName + '-' + newName1 + '-' + newName2;

//                                 ReplaceContents(numID);
//                             end

//                             else
//                                 Error('Your ID Number must contain a letter!');

//                         else
//                         Error('ID Number must start with TWO Numbers!')
//                     end

//                     else
//                         if (StrLen(rec."ID Number") <= 10) and (StrLen(rec."ID Number") > 0) then
//                             Error('Your ID Number is or too short!')

//                         // else
//                         //     if (StrLen(rec."ID Number") <= 14) then begin
//                         //         numID := newName + '-' + newName1 + '-' + newName2;

//                         //         ReplaceContents(numID);
//                         //     end
//                         else
//                             if (StrLen(rec."ID Number") > 15) then
//                                 Error('Your ID is too long!');



//                 end;
//             }

//             field(DOB; Rec.DOB)
//             {
//                 ApplicationArea = all;
//             }

//             field("Class & Grade"; Rec."Class & Grade")
//             {
//                 ApplicationArea = all;
//             }

//             field(Gender; Rec.Gender)
//             {
//                 ApplicationArea = all;
//             }

//             field(Cousion; Rec.Cousion)
//             {
//                 ApplicationArea = all;
//             }
//             field(Status; Rec.Status)
//             {
//                 ApplicationArea = all;
//             }

//         }
//     }

//     local procedure ReplaceContents(var numOldID: Text)
//     // var
//     //    myRec: Record Customer;
//     begin
//         Rec."ID Number" := numOldID;
//     end;
// }