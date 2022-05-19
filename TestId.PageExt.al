pageextension 50103 "Cust Ext Page" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
        addafter(name)
        {
            field(TestID; Rec.TestID)
            {
                ApplicationArea = All;
                Tooltip = 'TestID';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}