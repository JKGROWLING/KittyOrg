/**
 * Created by conra on 2023-05-06.
 */

public without sharing class Assignment {
//해당 메소드들은 특정 클래스 안에 두어야합니다.
//매개변수로 필요한 항목들은 다음과 같아요.
// String 타입의 보낼 주소(address)
// String 타입의 메일 제목
// String 타입의 메일 내용

    //3개의 기회를 생성하는 메소드
    public String insertNewOppty(){
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

    public void sendMail(String address, String subject, String body) {
        // Create an email message object
        //Messaging클래스 내에 매소드나 클래스를 살펴보는 것도 좋아요.
        //다음은 Messaging 클래스 내에 SingleEmailMessage 클래스예요.
        //SingleEmailMessage를 현 클래스 내에 불러온다.
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        //address를 보내기 위한 String 배열(스트링 어레이) 선언
        //특이하게도 toAddress는 복수의 메일을 보낼 수도 있기에
        //단일 String이 아닌 String Array를 넣게끔 되어있어요.
        String[] toAddresses = new String[] {address};
        //만들어둔 mail에 보낼 주소를 담아주어요.
        mail.setToAddresses(toAddresses);
        //만들어둔 mail의 제목을 설정
        mail.setSubject(subject);
        //만들어둔 메일의 내용을 설저에
        mail.setPlainTextBody(body);
        // Pass this email message to the built-in sendEmail method
        // of the Messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                new Messaging.SingleEmailMessage[] { mail });
        // Call a helper method to inspect the returned results
        inspectResults(results);
    }

// Helper method - 메일 발송 이후 메일이 잘 발송되었는지 확인하는 메소드예요
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        // sendEmail returns an array of result objects.
        // Iterate through the list to inspect results.
        // In this class, the methods send only one email,
        // so we should have only one result.
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successfully');
            }
            else {
                sendResult = false;
                System.debug('The following errors occurred: ' + res.getErrors());
            }
        }
        return sendResult;
    }

    String c = '씨';
    public void varScopeTest() {
        String d = '디';
        System.debug(c);
        System.debug(d);
    }
}

//git test용 주석이에용