page 50100 "TTTES TurnoverCustNo"
{
    PageType = List;
    SourceTable = "TTTES TurnoverCustomer";
    Caption = 'Omsætn. pr. kunde/land/postnr.';
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
                field("No."; "No")
                {
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                }
                field(Address; Address)
                {
                    ApplicationArea = All;
                }
                field("Post Code"; "PostCode")
                {
                    ApplicationArea = All;
                }
                field(City; City)
                {
                    ApplicationArea = All;
                }
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
        Query1: Query "TTTES TurnoverCustNo";

    begin
        IF DateFilter <> '' then
            Query1.SETFILTER(Query1.DateFilter, DateFilter);

        IF not Query1.Open() then
            exit;
        while Query1.Read() do begin
            "No" := Query1.No;
            Name := Query1.Name;
            Address := Query1.Address;
            City := Query1.City;
            "PostCode" := Query1.PostCode;
            "CountryCode" := Query1.CountryCode;
            "Country" := Query1.country;
            "AmountLCY" := Query1.SalesLCY;
            if Insert() then;
        end;
        IF not FindFirst() then;
    end;

    procedure SetParm(pDateFilter: Text[100])
    begin
        DateFilter := pDateFilter;
    end;
}
