package morningcheck

import mycheck.test

class CheckService {

    def serviceMethod() {

    }

    def connect(){

        test.connect();
    }

    def execute(Check c){
        String res = test.executeCheck(c.db.connectString,c.db.username,c.db.password,c.query);

        def checres =  new CheckResult(result: res,execute_time: new Date(),c: c);
        checres.save(flush:true);

        return checres
    }
}
