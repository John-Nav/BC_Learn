query 50100 MyQuery
{
    QueryType = Normal;

    elements
    {
        dataitem(Item_Ledger_Entry; "Item Ledger Entry")
        {
            column(Item_No_; "Item No.")
            {

            }
            column(Variant_Code; "Variant Code")
            { }
            column(Quantity; Quantity)
            {
                Method = Sum;
            }
            filter(Location_Code; "Location Code")
            {
                ColumnFilter = Location_Code = const('WHITE');
            }
        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}