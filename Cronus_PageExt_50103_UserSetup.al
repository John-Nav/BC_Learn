pageextension 50103 UserSetupExt extends "User Setup"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field(Post_Permission; Post_Permission)
            {
                Caption = 'Posting Permission';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}