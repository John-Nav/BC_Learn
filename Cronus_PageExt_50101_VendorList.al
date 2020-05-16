pageextension 50101 VendorList extends "Vendor List"
{

    layout
    {

        addafter("Payments (LCY)")
        {

            field("No. of Orders"; "No. of Orders")
            {
                ApplicationArea = All;
                // FieldPropertyName = FieldPropertyValue;
                Caption = 'No .of Orders';
            }

        }
        addafter("No. of Orders")
        {

            field(MyText; MyText)
            {
                ApplicationArea = All;
                // FieldPropertyName = FieldPropertyValue;
                Editable = false;
            }
        }
    }
    actions
    {
        // Add changes to page actions here
        addafter("Vendor - Summary Aging")
        {
            action(VendorReport)
            {
                ApplicationArea = All;
                Caption = 'Vendor Report';
                Image = Report;
                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(RecVendor);
                    Report.Run(50100, true, false, RecVendor);
                end;
            }
        }

    }

    var
        myInt: Integer;
        MyText: Text;
        RecVendor: Record Vendor;

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        GetFunction();
    end;

    procedure GetFunction()
    var
        myInt: Integer;

    begin
        MyText := 'This is test.'
    end;
}

