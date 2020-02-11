report 50101 ListReport01
{
    UsageCategory = Lists;  // TTTEBS - Default = Administration, kunne også være = Documents
    ApplicationArea = All;

    DefaultLayout = RDLC;
    RDLCLayout = '.\TTTEBS\01_ListReport\ListReport01.rdl';

    Caption = 'Sales Statistic';
    PreviewMode = PrintLayout;

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

            trigger OnAfterGetRecord()
            begin
            end;
        }
    }

    // TTTEBS - If no translation is needed, use this one insted of - var -> labels.
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