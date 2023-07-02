/**
 * Created by conra on 2023-06-11.
 */

trigger LeadTr on Lead (before insert, before update) {

    //이메일 전송 메소드 불러오기 (질문: import를 안해도 되는 게 새삼스럽게 왜인지 모르겠어요ㅠㅠ)
    public void sendMail(String address, String subject, String body) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        Messaging.SendEmailResult[] results = Messaging.sendEmail(
                new Messaging.SingleEmailMessage[] { mail });
    }

    //리드의 도시 정보가 LA인 경우 메일 발송
    for(Lead lead : Trigger.new){
        if(String.isEmpty(lead.City)){
            System.debug('도시 정보가 비어있어 해당 작업을 수행하지 않습니다.');
            continue;
        }else if('LA'.equals(lead.City)){
            System.debug('도시 정보가 LA인 리드가 생성되었습니다.');
            sendMail('conradxx@naver.com','도시 정보가 LA인 리드가 생성되었습니다', '어렵다.' );
        }else{
            System.debug('도시 정보가 LA가 아닌 리드가 생성되었습니다.');
        }
    }
}