package morningcheck

import grails.transaction.Transactional
import org.apache.commons.lang.time.DateUtils

@Transactional
class EngineService {

    def checkService

    def runSchedule() {

        log.info("Running schedueler")
        def curr_date = new Date()

       //  def scheduled = Schedule.findAll();

        def query = Schedule.where {
            (status == "DA LAVORARE" && start_date < new Date() )
        }

        def scheduled = query.list()



         if(scheduled) {
            //log.info("Found : " + scheduled.count() + "Jobs");

            for (sched in scheduled) {

                if (sched.conf.is_started == true && !sched.conf.is_paused) {
                    log.info("Running task : " + sched.check.query);
                    sched.status = "RUNNING"
                    sched.save(flush:true)

                    checkService.execute(sched.check);

                    sched.status = "DONE"
                    sched.end_date  = new Date()
                    sched.conf.n_execution++

                    sched.conf.save(flush:true)
                    sched.save(flush:true)


                    if(sched.conf.is_repeating){

                        def next_date = DateUtils.addMinutes(new Date(),sched.conf.rpt_int_min)

                        def c = new Schedule(check:sched.check,conf:sched.conf,start_date: next_date,end_date: new Date(),status: "DA LAVORARE")
                         log.info("Before saving new object")
                        c.save flush:true


                        log.info("A new Job is scheduled");
                    }

                    log.info("Run Ends!!!!");

                }
            }

        }
    }


}
