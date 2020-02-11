query 50101 "TTTES TurnoverCustCountry"
{
    QueryType = Normal;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(CountryCode; "Country/Region Code")
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