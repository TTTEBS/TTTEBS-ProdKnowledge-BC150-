codeunit 50101 "TTTES ItemEvents"
{
    EventSubscriberInstance = StaticAutomatic;
    SingleInstance = true;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInitHeaderDefaults', '', true, true)]

    local procedure HandleMyItemFieldSalesLine(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    var
        locrecItem: Record Item;
    begin
        Clear(SalesLine.ItemCode20);
        if SalesLine.Type <> SalesLine.Type::Item then
            exit;
        if not locrecItem.Get(SalesLine."No.") then
            exit;
        SalesLine.Validate("ItemCode20", locrecItem."ItemCode20");
    end;



    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromSalesLine', '', true, true)]
    local procedure HandleMyItemFieldPostSales(var ItemJnlLine: Record "Item Journal Line"; SalesLine: Record "Sales Line")
    begin
        ItemJnlLine.ItemCode20 := SalesLine.ItemCode20;
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertItemLedgEntry', '', true, true)]
    local procedure HandleMyItemFieldPostItemJnl(var ItemLedgerEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; TransferItem: Boolean)
    begin
        ItemLedgerEntry.ItemCode20 := ItemJournalLine.ItemCode20;
    end;


}