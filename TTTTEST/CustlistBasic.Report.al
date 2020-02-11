report 50105 CustListBasic
{
    UsageCategory = Lists;
    ApplicationArea = all;
    DefaultLayout = RDLC;
    RDLCLayout = '.\TTTTEST\CustlistBasic.rdl';
    Caption = 'Customer sales statistic';

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Date Filter";
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(SalesLCY; "Sales (LCY)")
            {
            }
        }
    }
    labels
    {
        HeadLineLBL = 'Sales statistic';
        InTotalLBL = 'Total';
        NoLBL = 'No.';
        NameLBL = 'Name';
        CountryLBL = 'Country';
        SalesLCYLBL = 'Sales (LCY)';
    }
}
