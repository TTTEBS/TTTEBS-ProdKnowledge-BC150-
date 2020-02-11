pageextension 50103 "TTTES VendorCardExt" extends "Vendor Card"
{
    actions
    {
        // addbefore(Templates)
        addfirst("F&unctions")
        {
            action("NotesAdd")
            {
                Caption = 'Notes - Add';
                ApplicationArea = All;
                Image = Import;

                trigger OnAction()
                var
                    lr_Note: Record "Record Link";
                    // BC15_CHANGE >>
                    // lc_TypeHelper: Codeunit "Type Helper";
                    lc_RecLinkMgt: Codeunit "Record Link Management";
                    // BC15_CHANGE <<
                    lv_InStream: InStream;
                    lv_ClientFilename: Text;
                    lv_Content: Text;

                    lbl_FileToUpload: Label 'File to upload';
                    lbl_TextFiles: Label 'Text Files (*.txt)|*.txt';
                    lbl_Error01: label 'File not imported!';

                begin
                    if not UploadIntoStream(lbl_FileToUpload, '', lbl_TextFiles, lv_ClientFilename, lv_InStream) then
                        Error(lbl_Error01);
                    lv_InStream.Read(lv_Content);

                    lr_Note.Init();
                    // lr_Note."Link ID"
                    lr_Note.Validate("Record ID", Rec.RecordId());
                    // lr_Note.URL1
                    // lr_Note.URL2
                    // lr_Note.URL3
                    // lr_Note.URL4
                    // lr_Note.Description := '';
                    lr_Note.Validate(Type, lr_Note.Type::Note);
                    // lr_Note.Note
                    lr_Note.Validate(Created, CurrentDateTime());
                    lr_Note.Validate("User ID", UserId());
                    lr_Note.Validate(Company, CompanyName());
                    // lr_Note.Notify
                    // lr_Note."To User ID"

                    // BC15_CHANGE >>
                    //lc_TypeHelper.WriteRecordLinkNote(lr_Note, lv_Content);
                    lc_RecLinkMgt.WriteNote(lr_Note, lv_Content);
                    // BC15_CHANGE <<
                    lr_Note.Insert(true);
                end;
            }
        }
    }
}