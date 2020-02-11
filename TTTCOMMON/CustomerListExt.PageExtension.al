pageextension 50100 "TTTES CustomerListExt" extends "Customer List"
{
    actions
    {
        addlast("&Customer")
        {
            // TTTOPG - 04
            action("TurnoverCustomer")
            {
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'Show Turnover';
                ApplicationArea = All;
                PromotedCategory = Process;

                trigger OnAction();

                begin
                    Page.Run(page::"TTTES TurnoverCustSetFilter");
                end;
            }
            // TTTEBS - REPORTS
            action("ListReport01")
            {
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'ListReport01 - Sales Statistic - Basic';
                ApplicationArea = All;
                PromotedCategory = Report;

                trigger OnAction();

                begin
                    Report.Run(report::ListReport01);
                end;
            }
            action("ListReport02")
            {
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'ListReport02 - Sales Statistic - Language';
                ApplicationArea = All;
                PromotedCategory = Report;

                trigger OnAction();

                begin
                    Report.Run(report::ListReport02);
                end;
            }
            action("ListReport03")
            {
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'ListReport03 - Sales Statistic - Word';
                ApplicationArea = All;
                PromotedCategory = Report;

                trigger OnAction();

                begin
                    Report.Run(report::ListReport03);
                end;
            }
            action("Excelbuffer01")
            {
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'Excelbuffer01 - Sales Statistic';
                ApplicationArea = All;
                PromotedCategory = Report;

                trigger OnAction();

                begin
                    Report.Run(report::ExcelBuffer01);
                end;
            }
            action("ModifiedStandard01")
            {
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'ModifiedStandard01 - Sales Inv.';
                ApplicationArea = All;
                PromotedCategory = Report;

                trigger OnAction();

                begin
                    Report.Run(report::"TTTES Sales - Invoice");
                end;
            }
            // TTTEBS - XMLPORTS
            action("XmlPortExport01")
            {
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'ExportCust01 - CSV';
                ApplicationArea = All;
                PromotedCategory = Process;

                trigger OnAction();

                begin
                    Xmlport.Run(Xmlport::"ExportCust01");
                end;
            }
            action("XmlPortImport01")
            {
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'ImportCust01 - CSV';
                ApplicationArea = All;
                PromotedCategory = Process;

                trigger OnAction();

                begin
                    Xmlport.Run(Xmlport::"ImportCust01");
                end;
            }
            action("XmlPortExport02")
            {
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'ExportCust02 - XML';
                ApplicationArea = All;
                PromotedCategory = Process;

                trigger OnAction();

                begin
                    Xmlport.Run(Xmlport::"ExportCust02");
                end;
            }
            action("XmlPortImport02")
            {
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'ImportCust02 - XML';
                ApplicationArea = All;
                PromotedCategory = Process;

                trigger OnAction();

                begin
                    Xmlport.Run(Xmlport::"ImportCust02");
                end;
            }
            // TTTEBS - OTHER IMPORT
            action("CSVBuffer01")
            {
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'CSVBuffer01 - Import CSV wo/XmlPorts';
                ApplicationArea = All;
                PromotedCategory = Process;

                trigger OnAction();

                begin
                    Page.Run(Page::"CSVBuffer01");
                end;
            }
            // TTTEBS - CLEAN-UP - LAST!
            action("Cleanup01")
            {
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'Cleanup01 - Check VarFuncTesting.Codeunit before run';
                ApplicationArea = All;
                PromotedCategory = Process;

                trigger OnAction();

                begin
                    codeunit.Run(codeunit::VariousFunc);
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        //Message('App published: Hello world');
    end;
}