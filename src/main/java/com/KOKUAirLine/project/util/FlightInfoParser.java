package com.KOKUAirLine.project.util;

import com.KOKUAirLine.project.model.FlightInfo;
import org.w3c.dom.*;
import javax.xml.parsers.*;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import org.xml.sax.InputSource;

public class FlightInfoParser {

    public static List<FlightInfo> parse(String xml) {
        List<FlightInfo> flightList = new ArrayList<>();
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            InputSource inputSource = new InputSource(new StringReader(xml));
            Document doc = builder.parse(inputSource);

            NodeList items = doc.getElementsByTagName("item");

            for (int i = 0; i < items.getLength(); i++) {
                Element el = (Element) items.item(i);
                FlightInfo flight = new FlightInfo();

                flight.setAirlineKorean(getTagValue("airlineKorean", el));
                flight.setAirport(getTagValue("airport", el));
                flight.setFlightId(getTagValue("flightId", el));
                flight.setScheduleDateTime(getTagValue("scheduleDateTime", el));
                flight.setEstimatedDateTime(getTagValue("estimatedDateTime", el));

                flightList.add(flight);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flightList;
    }

    private static String getTagValue(String tag, Element element) {
        NodeList nodeList = element.getElementsByTagName(tag);
        if (nodeList.getLength() > 0) {
            NodeList childNodes = nodeList.item(0).getChildNodes();
            if (childNodes.getLength() > 0) {
                return childNodes.item(0).getNodeValue();
            }
        }
        return "";
    }
}
