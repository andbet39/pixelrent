package morningcheck
import grails.converters.*
import org.joda.time.DateTime
import grails.plugin.springsecurity.annotation.Secured


@Secured("ROLE_USER")
class ChartDataController  {

    def getCheckResult(Check _c,String interval) {

        log.info(interval)
        Date date ;

             def res;
        def query
        if(interval =="HOUR"){
            DateTime dt = new DateTime();
            DateTime fin = dt.minusHours(1);
            log.info(fin.toDateTime())
             query = CheckResult.where {
                execute_time >  fin.toDate() && c == _c
            }
        }

        if(interval =="DAY"){
            DateTime dt = new DateTime();
            DateTime fin = dt.minusHours(24);
            log.info(fin.toDateTime())
            query = CheckResult.where {
                execute_time >  fin.toDate() && c == _c
            }

        }

        if(interval =="ALL"){

            query = CheckResult.where {
                 c == _c
            }

        }

        res = query.list(sort:'execute_time',order:'desc')

        render res as JSON
    }
}
