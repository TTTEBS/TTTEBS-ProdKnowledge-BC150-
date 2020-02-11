page 50105 CSVBuffer01
{

    PageType = List;
    SourceTable = "CSV Buffer";
    Caption = 'CSVBuffer01';
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Field No."; "Field No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = All;
                }
                // field(SystemId; SystemId)
                // {
                //     ApplicationArea = All;
                // }
                field(Value; Value)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ImportCSV)
            {
                Caption = 'Import CSV';
                ToolTip = 'Function to delete current content and import a new file.';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ApplicationArea = All;

                trigger OnAction();
                var
                    lv_InStream: InStream;
                    lv_ClientFilename: Text;
                    lr_Cust: Record Customer;

                    SelectFileToUploadLBL: Label 'Select a file to upload';
                    XmlFilesLBL: Label 'Csv Files (*.csv)|*.csv';
                    ImportErrorLBL: Label 'File import terminated or canceled';

                begin
                    if not UploadIntoStream(SelectFileToUploadLBL, '', XmlFilesLBL, lv_ClientFilename, lv_InStream) then
                        Error(ImportErrorLBL);

                    Clear(Rec);
                    DeleteAll(false);
                    LoadDataFromStream(lv_InStream, ';');

                    Clear(Rec);
                    CurrPage.Update(false);

                    IF Confirm('Vil du oprette debitorer!', false) then begin
                        FindSet();  // TTTEBS - NOT needed here..
                        repeat
                            // TTTEBS -> Remove " from values >>
                            if StrLen(value) > 1 then
                                if (value[1] = '"') and (value[StrLen(value)] = '"') then
                                    Value := copystr(value, 2, strlen(Value) - 2);
                            // TTTEBS -> Remove " from values <<

                            if "Field No." = 1 then
                                lr_Cust.Init();

                            case "Field No." of
                                1:
                                    lr_Cust.validate("No.", Value);
                                2:
                                    lr_Cust.validate("Name", Value);
                                3:
                                    lr_Cust.validate(Address, Value);
                                4:
                                    lr_Cust.validate("Address 2", Value);
                                5:
                                    lr_Cust.validate("Post Code", Value);
                                6:
                                    lr_Cust.validate(City, Value);
                                7:
                                    lr_Cust.validate("Country/Region Code", Value);
                                8:
                                    lr_Cust.validate("Customer Posting Group", Value);
                                9:
                                    lr_Cust.validate("VAT Bus. Posting Group", Value);
                                10:
                                    lr_Cust.validate("VAT Registration No.", Value);
                            end;

                            // TTTEBS - Set to false -> Contact relation not deleted, when deleting customers - Error in standard
                            if not lr_Cust.insert(false) then
                                lr_Cust.Modify(true);

                        until Next() = 0;
                    end;
                end;
            }
        }
    }
}
