package morningcheck

import grails.plugin.springsecurity.annotation.Secured


class MainController {

    def wubookService
    def socketService
    def checkService
    def engineService

    @Secured("ROLE_USER")
    def viewcheck(int max){

        params.max = Math.min(max ?: 10, 100)
            respond Check.list(params), model:[checkCount: Check.count()]

    }

    def execute(Check c){
        engineService.runSchedule()
        redirect(url:'/main/viewCheckResult/'+c.id)
     }


    @Secured("ROLE_USER")
    def viewCheckResult(Check c){
        log.info(c);
        def results=CheckResult.findAllByC(c)
         [resList: results ]
    }



    def run (){
        engineService.runSchedule()
        render "DONE";
    }




    def index() {


        respond "Hello"
    }

    def loadcsv(){
        respond "";
    }

    def importcsv() {

        String csv = params.csv

        wubookService.parseCSV(csv);

        respond "";
    }

    def socket(){
        respond "socket"
    }

    def angular()
    {
        respond "angular"
    }

    def sendMessage(Message message){

        message.save()
        socketService.broadCast(message)

        respond message
    }

}
