package com.KOKUAirLine.project.model.api;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "response")
public class FlightResponse {
    private FlightHeader header;
    @JacksonXmlProperty(localName = "body")
    private FlightBody body;

    @XmlElement
    public FlightHeader getHeader() {
        return header;
    }

    public void setHeader(FlightHeader header) {
        this.header = header;
    }

    @XmlElement
    public FlightBody getBody() {
        return body;
    }

    public void setBody(FlightBody body) {
        this.body = body;
    }
}
