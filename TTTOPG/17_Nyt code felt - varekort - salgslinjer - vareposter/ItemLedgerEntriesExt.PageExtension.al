pageextension 50106 "TTTES ItemLedgerEntriesExt" extends "Item Ledger Entries"
{
    layout
    {
        addafter("Item No.")
        {
            field("ItemCode20"; "ItemCode20")
            {
                ApplicationArea = All;
            }
        }
    }
}