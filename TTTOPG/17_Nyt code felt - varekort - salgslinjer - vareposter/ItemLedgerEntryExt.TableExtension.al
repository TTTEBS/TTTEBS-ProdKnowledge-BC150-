tableextension 50104 "TTTES ItemLedgerEntryExt" extends "Item Ledger Entry"
{
    fields
    {
        field(50100; "ItemCode20"; Code[20])
        {
            Caption = 'ItemCode20';
            DataClassification = CustomerContent;
        }
    }
}