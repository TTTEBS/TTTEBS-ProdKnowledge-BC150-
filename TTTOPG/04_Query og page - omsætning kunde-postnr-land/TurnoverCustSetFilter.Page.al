page 50103 "TTTES TurnoverCustSetFilter"
{
    PageType = Card;
    Caption = 'Turnover Customer (Set Filter)';
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(StartDate; StartDate)
            {
                ApplicationArea = All;
            }
            field(EndDate; EndDate)
            {
                ApplicationArea = All;
            }
            field(Selection; Selection)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(ShowTurnover)
            {
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    case Selection of
                        selection::Detailed:
                            begin
                                if (StartDate <> 0D) and (EndDate <> 0D) then
                                    TurnoverCustNo.SetParm(format(StartDate) + '..' + Format(EndDate));
                                TurnoverCustNo.run;
                            end;
                        selection::PostCode:
                            begin
                                if (StartDate <> 0D) and (EndDate <> 0D) then
                                    TurnoverCustPostCode.SetParm(format(StartDate) + '..' + Format(EndDate));
                                TurnoverCustPostCode.run;
                            end;
                        selection::Country:
                            begin
                                if (StartDate <> 0D) and (EndDate <> 0D) then
                                    TurnoverCustCountry.SetParm(format(StartDate) + '..' + Format(EndDate));
                                TurnoverCustCountry.run;
                            end;
                    end;
                end;
            }
        }
    }

    var
        StartDate: Date;
        EndDate: Date;
        // Selection: Option Detailed,PostCode,Country;  // Not supported - Use ENUM insted - see below!
        Selection: Enum "TTTES TurnoverChoiceEnum";
        TurnoverCustNo: Page "TTTES TurnoverCustNo";
        TurnoverCustCountry: Page "TTTES TurnoverCustCountry";
        TurnoverCustPostCode: Page "TTTES TurnoverCustPostCode";
}
