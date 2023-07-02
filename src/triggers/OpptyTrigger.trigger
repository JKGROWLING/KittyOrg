/**
 * Created by conra on 2023-05-29.
 */

trigger OpptyTrigger on Opportunity (before insert, before update) {
    for(Opportunity opp : Trigger.new){
        if(String.isEmpty(opp.Type)){
            System.debug('Opportunity type is NULL.');
            continue;
        }else if('New Customer'.equals(opp.Type)){
            System.debug('Opportunity type is NEW.');
            //신규 고객 유형인 경우, Next step에서 거래처 정보 확인 필요하다는 문구 추가.
            opp.NextStep = '신규 생성 거래처 정보 확인';
        }else{
            //기본 설정으로는 New Customer 외에 3가지 유형의 Existing Customer 존재, 기존 고객에 대해 동일한 Next step 부여하므로 동일 블럭 작성.
            System.debug('Opportunity type is EXISTING.');
            //기존 고객 유형인 경우, Next step에서 기존 로그 확인 필요하다는 문구 추가.
            opp.NextStep = '기존 주문 내역 및 히스토리 확인';
        }
    }
}