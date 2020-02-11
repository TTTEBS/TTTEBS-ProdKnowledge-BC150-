table 50100 "TTTES TurnoverCustomer"
{
    DataClassification = CustomerContent;
    Caption = 'Turnover Customer';

    fields
    {
        field(1; "No"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; "Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
        }
        field(5; "Address"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Address';
        }
        field(7; "City"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'City';
        }
        field(35; "CountryCode"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Country Code';
        }
        field(91; "PostCode"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Post Code';
        }
        field(50000; "Country"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Country';
        }
        field(51000; "AmountLCY"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount (LCY)';
        }
    }

    keys
    {
        key(PK; "No")
        {
            Clustered = true;
        }
    }
}