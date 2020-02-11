pageextension 50101 "TTTES SalesOrderExt" extends "Sales Order"
{
    layout
    {
        addlast(General)
        {
            field("Customer Posting Group"; "Customer Posting Group")
            {
                Caption = 'TTT Customer Posting Group';
                ApplicationArea = all;
                Style = Strong;
                ToolTip = 'Customer added field';
                ShowMandatory = true;
                Importance = Promoted;  // Vis i fane..
            }
        }
    }
}