pageextension 50104 "TTTES ItemCardExt" extends "Item Card"
{
    layout
    {
        addafter("No.")
        {
            field("MyFieldGeneral"; "ItemCode20")
            {
                ApplicationArea = All;
            }
        }
        addafter(Item)
        {
            group("My Item Card Group")
            {
                Caption = 'TTTEBS - My Extension Card Group';
                field("ItemCode20"; "ItemCode20")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}