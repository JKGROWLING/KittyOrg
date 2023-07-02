/**
 * Created by Administrator on 2023-05-27.
 */

trigger AccountTr on Account (before insert) {
    // Account에 대한 Trigger로 Record에 대한 접근은 "Trigger.new"로 해요.
    // 기본적으로 Trigger.new는 List<SObject> 형태예요.
    // SObject는 Standard/Custom Object 모두를 포함하는 상위 개체예요.
    // 각 개체들은 모두 SObject라는 참조형 데이터 타입을 상속받아요.
    // 상속 등에 대한 설명은 이후에 요청주신다면 구두로 설명드릴게요.

    for(Account acc : Trigger.new){
        if(String.isEmpty(acc.Rating)){
            System.debug('Rating이 비어있어 해당 작업을 수행하지 않습니다.');
            continue;
        }else if('Hot'.equals(acc.Rating)){
            System.debug('Account의 Rating이 Hot으로 선택되었습니다.');
            acc.Description = 'Rating은 Hot으로 선택.';
        }else if('Warm'.equals(acc.Rating)){
            System.debug('Account의 Rating이 Warm으로 선택되었습니다.');
            //기존에 작성된 Description 다음 줄에 'Rating은 Hot으로 선택.'라는 문구 추가.
            acc.Description = 'Rating은 Warm으로 선택.';
        }else{
            //기본 설정으로는 Account의 Rating은 Hot, Warm, Cold만 존재하기에 else 블럭에 설정.
            System.debug('Account의 Rating이 Cold으로 선택되었습니다.');
            //Cold는 필요 없으니 Description마저 날려버리겠다!
            acc.Description = '';
        }
    }
}