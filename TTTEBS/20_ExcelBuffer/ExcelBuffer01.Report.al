report 50102 ExcelBuffer01
{
    UsageCategory = Lists;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Cust; Customer)
        {
            RequestFilterFields = "No.", "Date Filter";

            trigger OnPreDataItem()
            begin
                Filters := GetFilters;
                MakeExcelInfo();
                MakeExcelDataHeader();
            end;

            trigger OnAfterGetRecord()
            begin
                CalcFields("Sales (LCY)");
                MakeExcelDataBody();
            end;

            trigger OnPostDataItem()
            begin
                // TTTEBS - Footer and info sheet can not we used at the same time - System error..
                // IF Confirm('Current system error\\By adding ExcelDataFooter, Excel Info sheet is BLANK!\Add footer?', TRUE) THEN
                MakeExcelDataFooter();
                CreateExcelbook();
            end;
        }
    }
    requestpage
    {
        SaveValues = true;
    }

    var
        tmpExcelBuffer: Record "Excel Buffer" temporary;
        RowNo: Integer;
        Filters: text[200];

        DataLBL: Label 'Data';
        NameLBL: Label 'Customer Statistic';
        CompanyNameLBL: Label 'Company Name';
        ReportNoLBL: Label 'Report No.';
        ReportNameLBL: Label 'Report Name';
        UserIDLBL: Label 'User ID';
        DateLBL: Label 'Date';
        Filters1LBL: Label 'Filter 1';
        Filters2LBL: Label 'Filter 2';
        InTotalLBL: Label 'In Total';

    local procedure MakeExcelInfo()
    begin
        with tmpExcelBuffer do begin
            SetUseInfoSheet;
            AddInfoColumn(FORMAT(CompanyNameLBL), false, true, false, false, '', "Cell Type"::Text);
            AddInfoColumn(COMPANYNAME, false, false, false, false, '', "Cell Type"::Text);
            NewRow();
            AddInfoColumn(FORMAT(ReportNameLBL), false, true, false, false, '', "Cell Type"::Text);
            AddInfoColumn(FORMAT(NameLBL), false, false, false, false, '', "Cell Type"::Text);
            NewRow();
            AddInfoColumn(FORMAT(UserIDLBL), false, true, false, false, '', "Cell Type"::Text);
            AddInfoColumn(USERID, false, false, false, false, '', "Cell Type"::Text);
            NewRow();
            AddInfoColumn(FORMAT(DateLBL), false, true, false, false, '', "Cell Type"::Text);
            AddInfoColumn(TODAY, false, false, false, false, '', "Cell Type"::Date);
            NewRow();
            AddInfoColumn(FORMAT(Filters1LBL), false, true, false, false, '', "Cell Type"::Text);
            AddInfoColumn(Filters, false, false, false, false, '', "Cell Type"::Text);
            ClearNewRow();
        end;
    end;

    local procedure MakeExcelDataHeader()
    begin
        with tmpExcelBuffer do begin
            NewRow();
            AddColumn(Cust.FIELDCAPTION("No."), false, '', true, false, true, '', "Cell Type"::Text);
            AddColumn(Cust.FIELDCAPTION(Name), false, '', true, false, true, '', "Cell Type"::Text);
            AddColumn(Cust.FIELDCAPTION("Country/Region Code"), false, '', true, false, true, '', "Cell Type"::Text);
            AddColumn(Cust.FIELDCAPTION("Sales (LCY)"), false, '', true, false, true, '', "Cell Type"::Text);
        end;
    end;

    local procedure MakeExcelDataBody()
    begin
        with tmpExcelBuffer do begin
            RowNo += 1;
            NewRow();
            AddColumn(Cust."No.", false, '', false, false, false, '', "Cell Type"::Text);
            AddColumn(Cust.Name, false, '', false, false, false, '', "Cell Type"::Text);
            AddColumn(Cust."Country/Region Code", false, '', false, false, false, '', "Cell Type"::Text);
            AddColumn(cust."Sales (LCY)", false, '', false, false, false, '#,##0.00', "Cell Type"::Number);
        end;
    end;

    local procedure MakeExcelDataFooter()
    begin
        // FORMAT -> Examples:
        // '#,##0.00' -> 1234,456 => 1.234,46
        // '0;-0;;@' -> 125,125697 => 125
        with tmpExcelBuffer do begin
            RowNo += 1;
            NewRow();
            AddColumn(FORMAT(InTotalLBL), false, '', false, false, false, '', "Cell Type"::Text);
            AddColumn('', false, '', false, false, false, '', "Cell Type"::Text);
            AddColumn('', false, '', false, false, false, '', "Cell Type"::Text);
            AddColumn('SUBTOTAL(9,D2:D' + FORMAT(RowNo) + ')', true, '', true, false, false, '#,##0.00', "Cell Type"::Number);
            // TTTEBS - dummmy - Must not end with a IsFormula 
            AddColumn('', false, '', false, false, false, '', "Cell Type"::Text);
            // AddColumn('AVERAGE(D2:D'+ FORMAT(RowNo) +')',true,'',true,false,false,'0;-0;;@',"Cell Type"::Number);
            // AddColumn('SUM(D2:D' + FORMAT(RowNo) + ')', true, '', true, false, false, '#,##0.00', "Cell Type"::Number);
        end;
    end;

    local procedure CreateExcelbook()
    begin
        with tmpExcelBuffer do begin
            CreateNewBook('CustStat');
            WriteSheet('CustStat', CompanyName(), UserId());
            CloseBook();
            OpenExcel();
        end;
    end;
}
