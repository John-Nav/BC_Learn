pageextension 50102 Purchase_Line extends "Purchase Order Subform"
{
    layout
    {
        // Add changes to page layout here


        addlast(Control1)
        {

            field(PO_Extra_Qty; PO_Extra_Qty)
            {
                ApplicationArea = All;
                Caption = 'Order Quantity';
            }
            field(PO_Tol_Per; PO_Tol_Per)
            {
                ApplicationArea = All;
                Caption = 'Tolerance %';
            }

        }
        modify(Quantity)
        {
            trigger OnBeforeValidate()
            begin
                GOrder_Qty := 0;
                GOrder_Qty := Quantity - (Quantity * PO_Tol_Per / 100);
                Rec.PO_Extra_Qty := GOrder_Qty;
                Rec.Modify();

            end;
        }


    }



    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        GOrder_Qty: Decimal;
}