package com.KOKUAirLine.project.repo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.KOKUAirLine.project.model.NoticeDTO;

@Repository
public class NoticeRepositoryImpl implements NoticeRepository {
	
	@Autowired
    private JdbcTemplate jdbcTemplate;
	
	@Override
    public NoticeDTO findLatest() {
		String sql = "SELECT * FROM (SELECT * FROM SYSTEM.NOTICE ORDER BY REG_DATE DESC) WHERE ROWNUM = 1";
        return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {
            NoticeDTO dto = new NoticeDTO();
            dto.setId(rs.getLong("ID"));
            dto.setTitle(rs.getString("TITLE"));
            dto.setContent(rs.getString("CONTENT"));
            dto.setRegDate(rs.getDate("REG_DATE"));
            return dto;
        });
    }

}
