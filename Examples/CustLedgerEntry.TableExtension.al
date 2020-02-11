tableextension 50101 TTTCustLedgerEntryExt extends "Cust. Ledger Entry"
{
    Description = '...';

    fields
    {
        field(50100; TTTPriority; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Priority';
        }
    }
}