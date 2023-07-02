/**
 * Created by conra on 2023-05-05.
 */
public without sharing class TestClass {
    String opptyName = '케이크';   //삭제하거나 삽입할 Oppty의 Name

    public void helloWorld(){
        System.debug('Hello From Universe ');
    }

    private void helloWorld2(){
        System.debug('secret2');
    }
    /* 메소드를 선언할 때는 기본적으로 다음의 요소가 필요하다.
    *  1. 접근지정자(생략 시 Default: public)
    *  2. 리턴타입
    *  3. 메소드명(소문자로 시작)
    *  4. 매개변수(매개변수를 필요로 하지 않을 경우엔 "()"로 기재)
    *  5. 실행부
    *
    *  기본 형태는 다음과 같다.
    *  public(접근지정자) void(리턴타입) 어떤메소드(메소드 명) (매개변수 자리){
    *       실행부...
    *  }
    * */

    //키티 3개를 생성하는 메소드
    public String insertOpptyKitty(){
        //방법 1. 하드코딩
        Opportunity kittyoppty = new Opportunity(Name = opptyName ,StageName = 'Prospecting', CloseDate = Date.today());
        Opportunity kittyoppty2 = new Opportunity(Name = opptyName ,StageName = 'Prospecting', CloseDate = Date.today());
        Opportunity kittyoppty3 = new Opportunity(Name = opptyName ,StageName = 'Prospecting', CloseDate = Date.today());
        insert kittyoppty;
        insert kittyoppty2;
        insert kittyoppty3;

        System.debug('k1 ' + kittyoppty);
        System.debug(kittyoppty2);
        System.debug(kittyoppty3);

        //방법 2. List 및 반복문 활용


        return '삽입 끝';
    }

    //키티 Oppty를 1개만 남기고 삭제하는 메소드
    public String deleteOpptyKitty (){
        System.debug('###  Start of deleteOpptyKitty below');
        System.debug('삭제 전 Oppty 개수: ' + [SELECT COUNT(Id)
        FROM Opportunity
        WHERE Name =: opptyName]);

        Opportunity deleteTargetOppty = [SELECT Id, Name
        FROM Opportunity
        WHERE Name =: opptyName
        LIMIT 1];

        System.debug('삭제할 옵티: '+deleteTargetOppty);
        delete deleteTargetOppty;

        System.debug('삭제 후 Oppty 개수: ' + [SELECT COUNT(Id)
        FROM Opportunity
        WHERE Name =: opptyName]);

        System.debug('###  End of deleteOpptyKitty below');
        return '삭제 끝';
    }

    //5개의 어카운트를 생성하는 메소드
    public String insertNewAcc(){
        //String[](스트링 어레이 / 스트링 배열)을 사용하여 좋아하는 이름으로 5개의 Account를 생성해보기
        //참고: 현재, Account의 Required 필드는 Name 뿐
        System.debug('###  Start of insertNewAcc below');

        System.debug('삽입 전 Acc 개수: ' + [SELECT COUNT(Id)
        FROM Account]);

        List<Account> newAccList = new List<Account>();
        String[] accNames = new String[]{'키티', '케이크','라떼', '철수', '김세라', '명현님', '오뎅바가기싫다', '오뎅바', '가장 좋아하는 사람'};
        List<String> nameList = new List<String>();

        for(String name : nameList){

        }


        for(String accName : accNames){ //이 부분 중요 (i로 안 쓰고 list 안의 값만큼)
            if(accName.contains('가')) {
                continue;
            }else{
                Account newAccount = new Account(Name = accName);
                newAccList.add(newAccount);
            }
            /*
            if(accName.contains('오뎅')){
                if(accName.equals('오뎅바가기싫다')){
                    continue;
                }else {
                    Account newAccount = new Account(Name = accName);
                    newAccList.add(newAccount);
                }
            }else{
                Account newAccount = new Account(Name = accName);
                newAccList.add(newAccount);
            }*/
        }
        insert newAccList;

        System.debug('삽입 후 Acc 개수: ' + [SELECT COUNT(Id)
        FROM Account]);

        System.debug('###  End of insertNewAcc below');
        return '어카운트 삽입 끝';
    }

    List<Account> allAcc = [SELECT Id, Name FROM Account];
    List<String> nameList = new List<String>();
    List<String> rmvList = new List<String>();

    //23.05.05 숙제1 - 난이도 상
    // Account의 Name과 Contact의 Name을 동일하게 동시에 생성하는 메소드를 작성해주세요.
    // 개수는 자유입니다.
    // Account와 Contact는 Standard Master-Detail 관계입니다. Org 확인 후 Id도 할당하여 주세요.

    //23.05.05 숙제2 - 난이도 Impossible
    /* 위 insertNewAcc() 메소드를 여러번 실행하여 중복된 Account가 생겼다.
    *  중복된 Account를 1개만 남기고 삭제하는 클렌징 메소드를 작성하여라.
    * */

    // Anonymous 내용 - 기본
    /*
        String a = '안녕3';
        System.debug(a);

        Integer b = 2;
        Integer c = 3;
        Integer d = b+c;
        System.debug(d);

        Double e = 3.33;
        System.debug(e);

        Integer f = (Integer)(b + e);
        System.debug(f); //기댓값: 5???

        Double g = b+e;
        System.debug(g); //기댓값: 5.33이 아닐까

        //Oppty의 네이밍 룰을 'Acc명002'
        //한 유저가 하루 최대 5개의 Oppty만 생성 가능
        System.debug('숫자: '+Integer.valueOf(a.replace('안녕','')));
        System.debug(a);

        Opportunity oppty = new Opportunity(Name = '새옵티임',StageName = 'Prospecting', CloseDate = Date.today());
        System.debug(oppty);

        insert oppty;
        System.debug(oppty);

        Opportunity oppty = new Opportunity(Name = '새옵티임',StageName = 'Prospecting', CloseDate = Date.today());
        System.debug(oppty);

        insert oppty;

        Id deleteOpptyId = '0065i00000EKuGTAA1';
        Opportunity deleteTargetRecord = [SELECT Id, Name
                                          FROM Opportunity
                                          WHERE Id =: deleteOpptyId];
        System.debug('삭제할 옵티: '+deleteTargetRecord);
        delete deleteTargetRecord;
        System.debug(deleteTargetRecord);

        String updateOpptyName = '새옵티임';
        Opportunity updateTargetRecord = [SELECT Id, Name FROM Opportunity WHERE Name =: updateOpptyName];
        System.debug(updateTargetRecord);
        updateTargetRecord.Name = '키티'; //일단 이름을 바꾼다
        update updateTargetRecord; //바꾼 이름을 DB에 반영하는 작업
    */

}