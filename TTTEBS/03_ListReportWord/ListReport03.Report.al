report 50104 ListReport03
{
    UsageCategory = Lists;
    ApplicationArea = All;

    DefaultLayout = Word;
    WordLayout = '.\TTTEBS\03_ListReportWord\ListReport03.docx';

    Caption = 'Sales Statistic';

    dataset
    {
        dataitem(FirstLine; Integer)

        {
            DataItemTableView = SORTING(Number);
            MaxIteration = 1;

            column(Company; CompanyName)
            {
            }
            column(Picture_companyinfo; r_CompanyInfo.Picture)
            {
            }
            column(DateToday; Format(Today))
            {
            }
            column(FilterSet; v_FilterSetText)
            {
            }
            // TTTEBS - Word add..
            column(User; UserId)
            {
            }
        }
        dataitem(Cust; Customer)
        {
            RequestFilterFields = "No.", "Date Filter";
            column(No_cust; "No.")
            {
            }
            column(Name_cust; Name)
            {
            }
            column(Country_cust; "Country/Region Code")
            {
            }
            column(SalesLCY_cust; "Sales (LCY)")
            {
            }
            column(Total; v_Total)
            {
            }

            trigger OnPreDataItem()
            var
                lv_Cust: Record Customer;
            begin
                // TTTEBS - Word - Calc to first line..
                lv_cust.CopyFilters(Cust);
                IF lv_Cust.findset() then
                    repeat
                        lv_Cust.CalcFields("Sales (LCY)");
                        v_Total += lv_Cust."Sales (LCY)";
                    until lv_Cust.next = 0;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
    }

    labels
    {
        PageLBL = 'Page', Comment = 'Foo', MaxLength = 999, Locked = true;
        HeadLineLBL = 'Sales Statistic';
        InTotalLBL = 'Total';
        NoLBL = 'No.';
        NameLBL = 'Name';
        CountryLBL = 'Country';
        SalesLCYLBL = 'Sales (LCY)';
    }

    var
        r_CompanyInfo: Record "Company Information";
        v_FilterSet: Text[250];
        v_FilterSetText: Text[250];
        v_Total: Decimal;

    trigger OnInitReport()
    begin
        r_CompanyInfo.Get();
        r_CompanyInfo.CalcFields(Picture);
    end;

    trigger OnPreReport()
    begin
        v_FilterSet := Cust.GetFilters();
        IF v_FilterSet <> '' then
            v_FilterSetText := 'Filters: ' + v_FilterSet;
    end;
}