package com.KOKUAirLine.project.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.domain.Pageable;
import java.util.List;

import com.KOKUAirLine.project.model.NoticeDTO;

public interface NoticeRepository extends JpaRepository<NoticeDTO, Long> {

    // 최신 공지 1개 조회 (페이징으로 1개만 가져오기)
    @Query("SELECT n FROM NoticeDTO n ORDER BY n.regDate DESC")
    List<NoticeDTO> findLatestNotice(Pageable pageable);

}
