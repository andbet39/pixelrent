package morningcheck

import grails.transaction.Transactional
import myutil.myCSVUtils


import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.apache.tools.ant.types.optional.ScriptSelector;

import java.io.StringReader;
import java.io.Reader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@Transactional
class WubookService {

    static transactional = true

    def parseCSV(String csv) {

        StringReader stringreader = null;

        CSVParser csvFileParser = null;


        try {


            stringreader = new StringReader(csv)

            csvFileParser = new CSVParser(stringreader, CSVFormat.EXCEL);

            List csvRecords = csvFileParser.getRecords();

            for (int i = 1; i < csvRecords.size(); i++) {
                CSVRecord record = csvRecords.get(i);

                def res = new Reservation(wubookcode :record.get(0),
                                          origincode :record.get(1),
                                          reservationDate:record.get(2),
                                          arrivalDate:record.get(3),
                                          departureDate:record.get(4),
                                            guestName:record.get(5),
                                            guestEmail:record.get(6),
                                            guestPhone:record.get(7),
                                            arrivalHour:record.get(8),
                                            price: record.get(9),
                                            roomsAmount:record.get(10),
                                            status:record.get(11),
                                            notes:record.get(12),
                                            origin:record.get(13),
                                            discount:record.get(14),
                                            bid:record.get(15))
                log.info(res)
                res.save()

            }

        }
        catch (Exception e) {
            System.out.println("Error in CsvFileReader !!!");
            e.printStackTrace();
        }

        log.info("serviceMethod")

    }
}
