report 50140 ListReportBasicTemplate01
{
    UsageCategory = Lists;
    ApplicationArea = All;

    DefaultLayout = RDLC;
    RDLCLayout = '.\TTTEBS\00_TEMPLATES\ListReportBasicTemplate.rdl';

    Caption = 'LIST REPORT BASIC TEMPLATE - WO LANGUAGE';
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
        // dataitem(Cust; Customer)
        // {
        //     RequestFilterFields = "No.", "Date Filter";
        //     column(No_cust; "No.")
        //     {
        //     }
        //     trigger OnAfterGetRecord()
        //     begin
        //     end;
        // }
    }

    labels
    {
        PageLBL = 'Page';
        HeadLineLBL = 'LIST REPORT BASIC TEMPLATE';
        InTotalLBL = 'Total';
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
        // v_FilterSet := Cust.GetFilters();
        IF v_FilterSet <> '' then
            v_FilterSetText := 'Filters: ' + v_FilterSet;
    end;
}