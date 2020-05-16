// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 SaleOrderExt extends "Sales Order"
{
    layout
    {

        modify("Sell-to Customer No.")
        {
            ApplicationArea = All;
            trigger OnAfterValidate()
            var
                Customer: Record Customer;
                CreditBalanceNotification: Notification;
                OpenCustomer: Text;
                Text003: TextConst ENU = 'The current balance exceeds the credit limit.';
                Text004: TextConst ENU = 'Change credit limit';
            begin
                if Customer.GET("Sell-to Customer No.") then begin

                    Customer.CalcFields("Balance (LCY)");
                    if Customer."Balance (LCY)" > Customer."Credit Limit (LCY)" then begin
                        //Create the notification
                        CreditBalanceNotification.MESSAGE(Text003);
                        CreditBalanceNotification.SCOPE := NOTIFICATIONSCOPE::LocalScope;
                        //Add a data property for the customer number
                        CreditBalanceNotification.SETDATA(Rec.FieldName("Document Type"), format(Rec."Document Type"));
                        //Add a data property for the customer number
                        CreditBalanceNotification.SETDATA(Rec.FieldName("No."), Rec."No.");
                        //Add an action that calls the ActionHandler codeunit, which you define in the next step.
                        CreditBalanceNotification.ADDACTION(Text004, 170, 'GetSalesRecurringLinesFromNotification');
                        //Send the notification to the client.
                        CreditBalanceNotification.SEND;
                    end;
                end;
            end;

        }


    }
    trigger OnOpenPage();
    var
        CUMycodeunit: Codeunit MyCodeunit;
        Gtext: Decimal;
    begin
        //Message('Always Success.');
        // SetRange("User Name", 'INTNCBATNACRL02\ADMIN');   
        Gtext := CUMycodeunit.QueryResult('1000');  // Item No passing
        Message('%1', Gtext);
    end;



}

