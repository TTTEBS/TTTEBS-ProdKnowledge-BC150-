tableextension 50100 TTTCustomerExt extends Customer
{
    Description = '...';

    fields
    {
        field(50100; TTTPriority; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Priority';
        }
    }

    keys
    {
        key(TTTPriority; TTTPriority)
        {
        }
    }
}