codeunit 50100 "TTTES CreditLimitEvents"
{
    SingleInstance = true;  // PR - Skal sættes!
    EventSubscriberInstance = StaticAutomatic;  // Default

    // ===================
    // Event - Subscriber
    // ===================
    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeModifyEvent', '', true, true)]
    local procedure Customer_OnBeforeModifyEvent(var Rec: Record Customer; var xRec: Record Customer; RunTrigger: Boolean)
    var
        lv_Limit: Decimal;
        lv_IsHandled: Boolean;
        Text001: Label 'Creditmax must be less than %1';

    begin
        // Prevent check on temporary tables >>
        if Rec.IsTemporary() then exit;
        if xRec.IsTemporary() then exit;
        // Prevent check on temporary tables <<

        lv_Limit := 100000;

        SetCreditmaxLimit(lv_Limit, Rec, lv_IsHandled);
        if lv_IsHandled then
            exit;
        if lv_Limit = 0 then
            exit;

        if Rec."Credit Limit (LCY)" > lv_Limit then
            error(Text001, lv_Limit);
    end;

    // ===================
    // EventIntegration - To Eliminate or set other value..
    // ===================
    [IntegrationEvent(true, false)]  // Before true,true
    local procedure SetCreditmaxLimit(var pLimit: Decimal; pCust: Record Customer; pIsHandled: Boolean)
    begin
    end;

    // ===================
    // EventSubscriber - Test EventIntegration..
    // ===================
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"TTTES CreditLimitEvents", 'SetCreditmaxLimit', '', true, true)]
    local procedure TestOverRuleCreditmax(var pLimit: Decimal; pCust: Record Customer; sender: Codeunit "TTTES CreditLimitEvents")
    begin
        // Eliminate CreditLimit event by setting pLimit = 0..
        case pCust."Country/Region Code" of
            'DK':
                pLimit := 200000;
            else
                pLimit := 100000;
        end;
    end;
}