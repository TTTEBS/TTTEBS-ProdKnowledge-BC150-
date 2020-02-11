query 50100 "TTTES TurnoverCustNo"
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
            }
            Column(Name; Name)
            {
            }
            column(Address; Address)
            {
            }
            column(PostCode; "Post Code")
            {
            }
            column(City; City)
            {
            }
            column(CountryCode; "Country/Region Code")
            {
            }
            column(SalesLCY; "Sales (LCY)")
            {
            }
            filter(DateFilter; "Date Filter")
            {
            }
            dataitem(CountryRegion; "Country/Region")
            {
                DataItemLink = Code = Customer."Country/Region Code";
                column(Country; Name)
                {
                }
            }
        }
    }
}