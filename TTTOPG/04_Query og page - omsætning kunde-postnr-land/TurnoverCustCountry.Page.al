page 50101 "TTTES TurnoverCustCountry"
{
    PageType = List;
    SourceTable = "TTTES TurnoverCustomer";
    Caption = 'Omsætning pr. land';
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Country/Region Code"; "CountryCode")
                {
                    ApplicationArea = All;
                }
                field("Country Name"; "Country")
                {
                    ApplicationArea = All;
                }
                field("Amount (LCY)"; "AmountLCY")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        SetPageData();
    end;

    var
        DateFilter: Text[100];

    local procedure SetPageData()
    var
        Query1: Query "TTTES TurnoverCustCountry";
        Counter: Integer;

    begin
        Counter := 100000;

        IF DateFilter <> '' then
            Query1.SETFILTER(Query1.DateFilter, DateFilter);

        IF not Query1.Open() then
            exit;

        while Query1.Read() do begin
            Counter += 1;
            No := Format(Counter);
            CountryCode := Query1.CountryCode;
            Country := Query1.Country;
            AmountLCY := Query1.SalesLCY;
            if Insert() then;
        end;
        IF NOT FindFirst() THEN;
    end;

    procedure SetParm(pDateFilter: Text[100])
    begin
        DateFilter := pDateFilter;
    end;
}
