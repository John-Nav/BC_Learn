pageextension 50105 UserExt extends Users
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        SetFilter("User Name", '%1', 'INTNCBATNACRL02*');
    end;

    var
        myInt: Integer;
}