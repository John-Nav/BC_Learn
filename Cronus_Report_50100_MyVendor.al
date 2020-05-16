report 50100 MyReport
{
    UsageCategory = Administration;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'MyReport.rdl';
    dataset
    {
        dataitem(Vendor; Vendor)
        {
            RequestFilterFields = "No.";

            column(No_; "No.")
            {

            }
            column(Name; Name)
            {

            }
            column(Balance__LCY_; "Balance (LCY)")
            {

            }
            column(Address; Address)
            {

            }
            column(No__of_Invoices; "No. of Invoices")
            {

            }
            column(Phone_No_; "Phone No.")
            {

            }


        }
    }




    var
        myInt: Integer;
}