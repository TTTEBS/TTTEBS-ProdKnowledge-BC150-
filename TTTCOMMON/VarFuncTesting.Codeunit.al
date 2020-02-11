codeunit 50102 VariousFunc
{
    trigger OnRun()
    begin
        F_DeleteCust('TTT*|XTT*');
    end;

    var
        myInt: Integer;

    procedure F_DeleteCust(pv_NoFilter: Text)
    var
        lr_Cust: Record Customer;

    begin
        with lr_Cust do begin
            SetFilter("No.", pv_NoFilter);
            DeleteAll(true);
        end;
    end;
}