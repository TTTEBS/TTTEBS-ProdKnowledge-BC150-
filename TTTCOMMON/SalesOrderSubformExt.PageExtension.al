pageextension 50105 "TTTES SalesOrderSubformExt" extends "Sales order Subform"
{
    layout
    {
        // TTTOPG - 17
        addafter("No.")
        {
            field("ItemCode20"; "ItemCode20")
            {
                ApplicationArea = All;
            }
        }

        // TTTOPG - 01
        addafter(Description)
        {
            field("Description 2"; "Description 2")
            {
                Caption = 'TTT Description';
                ApplicationArea = all;
            }
        }

    }
}