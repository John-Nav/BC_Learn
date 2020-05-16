tableextension 50100 PurLineEx extends "Purchase Line"
{
    fields
    {
        // Add changes to table fields here
        field(50001; PO_Extra_Qty; decimal)
        {

            trigger OnValidate();
            begin
                Total_Qty := 0;
                Total_Qty := PO_Extra_Qty + (PO_Extra_Qty * PO_Tol_Per / 100);
                Validate(Quantity, Total_Qty);
            end;

        }
        field(50002; PO_Tol_Per; decimal)
        {
            InitValue = 0.0;

        }
    }

    var
        myInt: Integer;
        Total_Qty: Decimal;
}