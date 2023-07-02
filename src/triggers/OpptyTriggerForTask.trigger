/**
 * Created by conra on 2023-05-31.
 */

trigger OpptyTriggerForTask on Opportunity (before insert, before update) {
    /*
       OpptyTrigger가 2개가 생성되어있네요.
       Trigger와 같이 대상이 되는 개체가 특정되는 경우는 2개로 분리하지 않고 하나로 합쳐주는게 좋아요.
       논리적 이후에 배울 클래스와 메소드를 활용하여 이를 모듈화할 수 있습니다.
       모듈화의 장점으로는 유지보수와 가독성, 결합도 등을 꼽을 수 있습니다.

       반면, 동일한 개체에 대한 트리거가 분리될 경우 순서보장이나 이후 대상 개체에 대한 흐름 파악이 다소 어려워질 수 있어요.

       지금은 기본 내장 Trigger를 사용하지만 OpenSource로 풀린 트리거 핸들러 프레임워크(이하 트리거 핸들러)를 받아 사용할 예정이예요!
       소개하려는 트리거 핸들러는 셋업에서 Apex Trigger 핸들러의 사용 유무와 발동 시기, 개체 등에 대한 제어를 가능하게 해주며
       byPass라는 기능이 구현되어 있습니다.
       url: https://github.com/kevinohara80/sfdc-trigger-framework
    * */

    for(Opportunity opp : Trigger.new){
        if(String.isEmpty(opp.Type)){
            System.debug('Opportunity type is NULL.');
            continue;
        }else if('New Customer'.equals(opp.Type)){
            System.debug('Opportunity type is NEW.');
            //신규 고객 유형인 경우, 거래처 정보 확인 필요하다는 Task 추가.
            //Task 정보 (1) Subject : Research
            //Task 정보 (2) Due Date : today + 3 days
            //Task 정보 (3) 기타 (Related to, Owner) : 기본 값
            Task tsk = new Task(Subject = 'Research', ActivityDate = Date.today() + 3, Description = '거래처 정보 확인 필요', WhatId = opp.Id, OwnerId = opp.OwnerId);
            insert tsk;
        }else{
            //기본 설정으로는 New Customer 외에 3가지 유형의 Existing Customer 존재, 기존 고객에 대해 동일한 Next step 부여하므로 동일 블럭 작성.
            System.debug('Opportunity type is EXISTING.');
            //기존 고객 유형인 경우, 히스토리 파악 필요하다는 Task 추가.
            //Task 정보 (1) Subject : Research
            //Task 정보 (2) Due Date : today + 3 days
            //Task 정보 (3) 기타 (Related to, Owner) : 기본 값
            Task tsk = new Task(Subject = 'Research', ActivityDate = Date.today() + 3, Description = '히스토리 파악 필요',  WhatId = opp.Id, OwnerId = opp.OwnerId);
            insert tsk;
        }
    }

    /*
    - for문 개선안

    //insert하기 위한 task를 모으는 리스트 생성
    List<Task> taskList = new List<Task>();

    for(Opportunity opp : Trigger.new){
        if(String.isEmpty(opp.Type)){
            System.debug('Opportunity type is NULL.');
            continue;
        }else if('New Customer'.equals(opp.Type)){
            System.debug('Opportunity type is NEW.');
            //신규 고객 유형인 경우, 거래처 정보 확인 필요하다는 Task 추가.
            //Task 정보 (1) Subject : Research
            //Task 정보 (2) Due Date : today + 3 days
            //Task 정보 (3) 기타 (Related to, Owner) : 기본 값
            Task tsk = new Task(
                Subject = 'Research',
                ActivityDate = Date.today() + 3,
                Description = '거래처 정보 확인 필요',
                WhatId = opp.Id,
                OwnerId = opp.OwnerId
            );
            taskList.add(tsk);
            //insert tsk;
        }else{
            //기본 설정으로는 New Customer 외에 3가지 유형의 Existing Customer 존재, 기존 고객에 대해 동일한 Next step 부여하므로 동일 블럭 작성.
            System.debug('Opportunity type is EXISTING.');
            //기존 고객 유형인 경우, 히스토리 파악 필요하다는 Task 추가.
            //Task 정보 (1) Subject : Research
            //Task 정보 (2) Due Date : today + 3 days
            //Task 정보 (3) 기타 (Related to, Owner) : 기본 값
            Task tsk = new Task(
                Subject = 'Research',
                ActivityDate = Date.today() + 3,
                Description = '히스토리 파악 필요',
                WhatId = opp.Id,
                OwnerId = opp.OwnerId
            );
            taskList.add(tsk);
            //insert tsk;
        }
    }
    * */
}