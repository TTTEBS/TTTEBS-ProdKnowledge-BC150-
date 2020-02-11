query 50102 "TTTES TurnoverCustPostCode"
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(CountryCode; "Country/Region Code")
            {
            }
            column(PostCode; "Post Code")
            {
            }
            column(City; City)
            {
            }
            column(SalesLCY; "Sales (LCY)")
            {
                Method = Sum;
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