tableextension 50105 "TTTES SalesLineExt" extends "Sales Line"
{
    fields
    {
        field(50100; "ItemCode20"; Code[20])
        {
            Caption = 'My Field';
            DataClassification = CustomerContent;
        }
    }
}