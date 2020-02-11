report 50106 MyFirstReport
{
    UsageCategory = Lists;
    ApplicationArea = all;
    DefaultLayout = RDLC;
    RDLCLayout = './MyFirstReport.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Date Filter";
            column(CompanyName; Companyname)
            { }
            column(No; "No.")
            {
                IncludeCaption = true;
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
        HeadLineLBL = 'Sales Statistic';
        InTotalLBL = 'Total';
        NoLBL = 'No.';
        NameLBL = 'Name';
        CountryLBL = 'Country';
        SalesLCYLBL = 'Sales (LCY)';
    }
}
