package com.KOKUAirLine.project.model.api;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

import java.util.List;

public class FlightBody {

    @JacksonXmlProperty(localName = "item")
    @JacksonXmlElementWrapper(localName = "items")
    private List<FlightItem> items;

    private int numOfRows;
    private int pageNo;
    private int totalCount;

    // Getters and setters
    public List<FlightItem> getItems() {
        return items;
    }

    public void setItems(List<FlightItem> items) {
        this.items = items;
    }

    public int getNumOfRows() {
        return numOfRows;
    }

    public void setNumOfRows(int numOfRows) {
        this.numOfRows = numOfRows;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
}
