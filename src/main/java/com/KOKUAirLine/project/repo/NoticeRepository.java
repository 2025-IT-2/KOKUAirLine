package com.KOKUAirLine.project.repo;

import com.KOKUAirLine.project.model.NoticeDTO;

public interface NoticeRepository {
	NoticeDTO findLatest();

}
