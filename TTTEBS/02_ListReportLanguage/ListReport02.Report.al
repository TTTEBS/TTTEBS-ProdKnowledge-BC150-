report 50100 ListReport02
{
    UsageCategory = Lists;  // TTTEBS - Default = Administration, kunne også være = Documents
    ApplicationArea = All;

    DefaultLayout = RDLC;
    RDLCLayout = '.\TTTEBS\02_ListReportLanguage\ListReport02.rdl';

    Caption = 'Sales Statistic - Language';
    //PreviewMode = PrintLayout;
    PreviewMode = Normal;


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
            // Captions..
            column(HeadLineLBL; HeadLineLBL)
            {
            }
            column(PageLBL; PageLBL)
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
            column(NoOfCLE; format(v_NoOfCLE))
            {
            }

            // Captions..
            column(NoLBL; NoLBL)
            {
            }
            column(NameLBL; NameLBL)
            {
            }
            column(CountryLBL; CountryLBL)
            {
            }
            column(SalesLCYLBL; SalesLCYLBL)
            {
            }
            column(InTotalLBL; InTotalLBL)
            {
            }
            column(NoOfCLELBL; NoOfCLELBL)
            {
            }

            trigger OnAfterGetRecord()
            var
                lr_CLE: Record "Cust. Ledger Entry";

            begin
                clear(v_NoOfCLE);
                lr_CLE.SetRange("Customer No.", "No.");
                lr_CLE.SetFilter("Posting Date", GetFilter("Date Filter"));
                v_NoOfCLE := COUNT;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        ContextSensitiveHelpPage = 'UsedForWhat';
        layout
        {
            area(Content)
            {
                group(Settings)
                {
                    field(Language; v_LanguageCode)
                    {
                        ApplicationArea = All;
                        TableRelation = Language;
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        r_CompanyInfo: Record "Company Information";
        r_Language: Record Language;
        c_Language: Codeunit Language;
        v_LanguageCode: Code[10];
        v_FilterSet: Text[250];
        v_FilterSetText: Text[250];
        v_NoOfCLE: Integer;

        // Captions..
        // TTTEBS - Do not use "TextConst" - deprecated, use labels insted 
        //   Example: PageCAP: TextConst ENU = 'Page', DAN = 'Side';
        PageLBL: Label 'Page';
        HeadLineLBL: Label 'Sales Statistic - Language';
        FilterSetLBL: Label 'Filters: ';
        InTotalLBL: Label 'Total';
        NoLBL: Label 'No.';
        NameLBL: Label 'Name';
        AddressLBL: Label 'Address';
        PostCodeLBL: Label 'Post Code';
        CityLBL: Label 'City';
        CountryLBL: Label 'Country';
        SalesLCYLBL: Label 'Sales (LCY)';
        NoOfCLELBL: Label 'No of CLE';

    trigger OnInitReport()
    begin
        r_CompanyInfo.Get();
        r_CompanyInfo.CalcFields(Picture);
    end;

    trigger OnPreReport()
    begin
        IF v_LanguageCode <> '' then
            //CurrReport.Language := r_Language.GetLanguageId(v_LanguageCode);  // TTTEBS - Udgået metode!
            //CurrReport.Language := c_Language.GetLanguageIdOrDefault(v_LanguageCode);  // TTEBS - Another method - Is working!
            CurrReport.Language := c_Language.GetLanguageId(v_LanguageCode);

        v_FilterSet := Cust.GetFilters();
        IF v_FilterSet <> '' then
            v_FilterSetText := FilterSetLBL + v_FilterSet;
    end;
}