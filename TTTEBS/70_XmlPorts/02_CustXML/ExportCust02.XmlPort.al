xmlport 50101 "ExportCust02"
{
    // TTTEBS >>
    Format = Xml;
    Direction = Export;
    // TTTEBS <<

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Customer; Customer)
            {
                fieldelement(No; Customer."No.")
                {
                }
                fieldelement(Name; Customer.Name)
                {
                }
                fieldelement(Address; Customer.Address)
                {
                }
                fieldelement(Address2; Customer."Address 2")
                {
                }
                fieldelement(PostCode; Customer."Post Code")
                {
                }
                fieldelement(City; Customer.City)
                {
                }
                fieldelement(CountryRegionCode; Customer."Country/Region Code")
                {
                }
                fieldelement(CustomerPostingGroup; Customer."Customer Posting Group")
                {
                }
                fieldelement(VATBusPostingGroup; Customer."VAT Bus. Posting Group")
                {
                }
                fieldelement(VATRegistrationNo; Customer."VAT Registration No.")
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
