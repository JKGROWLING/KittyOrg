/**
 * Created by conra on 2023-05-07.
 */

public with sharing class Prac0507 {
    String a = '이';
    public Boolean runEquals(String sourceString, String compareTargetString){
        //같은지
        Boolean equalResult = sourceString.equals(compareTargetString);
        System.debug('결과: '+equalResult);
        return equalResult;
    }

    public Boolean myEquals(String sourceString, String compareTargetString) {
        Boolean myEqualsResult;
        if (sourceString == compareTargetString) {
            myEqualsResult = true;
            System.debug('결과: ' + myEqualsResult);
        }else {
            myEqualsResult = false;
            System.debug('결과: ' + myEqualsResult);
        }
        return myEqualsResult;
    }

    public Boolean containResult(){
        //포함하는지
        String example1 = '지현이는 천재다.';
        String example2 = '바보';
        String example3 = '현이';
        Boolean containResult = example1.contains(example2);
        Boolean containResult2 = example1.contains(example3);
        System.debug('Contains 천재 결과: '+containResult);
        System.debug('Contains 현이 결과: '+containResult2);
        return containResult;
    }

    public Integer runLength(String str){
        Integer lengthResult = str.length();
        System.debug('결과: ' + lengthResult);
        return lengthResult;
    }

    public void evenChecker(Integer a){
        Integer result = Math.mod(a , 2);
        Integer length = String.valueOf(a).length();
        String printStr = '';
        if(result == 0){
            printStr = '짝수입니다.';
        }else{
            printStr = '홀수입니다.';
        }
        System.debug(length);

    }

    /*
    - 주어진 문자열에 숫자가 들어가있는지 판별하는 메소드를 만들어주세요.
            - 반환값:
            - 숫자가 있을 경우 - true
            - 없을 경우 - false
            - input 예시:
            - 1. String a = ‘안녕3’;
    - 2. String b = ‘여긴 숫자 없습니다.’;
    - output 예시:
            - 1. true
            - 2. false
     */
    //String assString = '나는지현2예용33';
    public Boolean ass(String assString){
        Boolean assResult = false;
        String sum = '';
        String[] assNums = new String[] {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
        for(String assNum : assNums){
            if(assString.contains(assNum)){
                assResult = true;
                //sum += 'a';
                //sum = sum + 'a';
                sum += assNum;
            }
        }
        System.debug('숫자가 있는지: ' + assResult);
        if(sum.length() != 0){
            System.debug('들어있는 숫자는: ' + sum);
        }

        return assResult;

        /*
        if(assString.contains('0')){
            assResult = true;
        }else if(assString.contains('1')){
            assResult = true;
        }else if(assString.contains('2')){
            assResult = true;
        }else if(assString.contains('3')){
            assResult = true;
        }else if(assString.contains('4')){
            assResult = true;
        }else if(assString.contains('5')){
            assResult = true;
        }else if(assString.contains('6')){
            assResult = true;
        }else if(assString.contains('7')){
            assResult = true;
        }else if(assString.contains('8')){
            assResult = true;
        }else if(assString.contains('9')){
            assResult = true;
        }else{
            assResult = false;
        }
        System.debug(assResult);
        return assResult;
         */
    }



    public void varScopeTest() {
        String b = 'assignment';
        /*
        b.equals();
        b.contains();
        b.charAt();
        b.replace();
        b.indexOf();
        b.length();
        b.substring();
        b.trim();
        b.toLowerCase()
        b.toUpperCase()
        */

        System.debug(a);
        System.debug(b);
    }
}