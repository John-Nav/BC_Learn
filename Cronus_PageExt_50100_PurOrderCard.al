pageextension 50104 PurOrderExt extends 50
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                RecUserSetup.Reset();
                RecUserSetup.SetRange("User ID", UserId);
                RecUserSetup.SetRange(Post_Permission, true);
                if RecUserSetup.IsEmpty then begin
                    Error(Text1001);
                end;
            end;
        }
    }

    var

        myInt: Integer;
        RecUserSetup: Record 91;
        Text1001: TextConst ENU = 'You do not have permission';
    //Text1001: TextConst TINTA = 'You do not have permission';
}