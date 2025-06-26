package com.KOKUAirLine.project.service.api;

import java.util.Objects;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;

import lombok.Data;

@Data
@JacksonXmlRootElement(localName = "item")
@JsonIgnoreProperties(ignoreUnknown = true)
public class ApiInfo {

    private String airport;
    private String airportCode;
    @JsonIgnoreProperties(ignoreUnknown = true)
    private String airportJp;
    
    @Override
    public boolean equals(Object o) {
    	
        if (this == o) return true;
        if (!(o instanceof ApiInfo)) return false;
        ApiInfo other = (ApiInfo) o;
        return Objects.equals(airport, other.airport);
    }

    @Override
    public int hashCode() {
    	
        return Objects.hash(airport);
        
    }
    
}