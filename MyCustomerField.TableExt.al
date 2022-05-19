// tableextension 50115 "My Customer Field" extends Customer
// {
//     fields
//     {
//         field(50100; "ID Number"; Text[17])
//         {
//             Caption = 'ID Number';
//             NotBlank = true;
//             CharAllowed = '';
//             DataClassification = CustomerContent;
//         }
//         field(50108; "DOB"; Date)
//         {
//             Caption = 'Date of Birth';
//             DataClassification = CustomerContent;
//         }
//         field(50109; "Sex"; Boolean)
//         {
//             Caption = 'Sex';
//             DataClassification = CustomerContent;
//         }
//         field(50110; "Gender"; Option)
//         {
//             CaptionClass = 'Sex';
//             Caption = 'Sex';
//             DataClassification = CustomerContent;
//             OptionMembers = Male,Female,RatherNotSay;
//         }
//         field(50111; "Class & Grade"; Text[15])
//         {
//             Caption = 'Class & Grade';
//             DataClassification = CustomerContent;
//         }
//         field(50112; "Cousion"; Boolean)
//         {
//             Caption = 'Sibling';
//             DataClassification = CustomerContent;
//             TableRelation = "Sales Invoice Line";
//         }
//         field(50113; "Status"; Option)
//         {
//             CaptionClass = 'Status';
//             Caption = 'Status';
//             DataClassification = CustomerContent;
//             OptionMembers = Active,Transfered,Expelled,Suspended;
//         }
//     }
// }