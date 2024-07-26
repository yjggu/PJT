package com.lbnest.loan.notice.impl;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lbnest.loan.common.JDBCUtil;
import com.lbnest.loan.notice.NoticeVO;

public class NoticeDAO {
	// DB 연동을 위한 변수를 null로 설정
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	// CRUD - SQL문
	private final String NOTICE_INSERT = "insert into notice (n_writer, n_title, n_content, n_upload) values(?,?,?,?)";
	private final String NOTICE_UPDATE = "update notice set n_title=?, n_content=?, n_upload=? where n_seq=?";
	private final String NOTICE_DELETE = "delete from notice where n_seq=?";
	private final String NOTICE_GET = "select * from notice where n_seq=?";

	// 검색창
	private final String NOTICE_TITLE = "select * from notice where n_title like ? order by n_seq desc limit ? offset ?";
	private final String NOTICE_CONTENT = "select * from notice where n_content like ? order by n_seq desc limit ? offset ?";

	// 조회수
	private final String NOTICE_UPDATE_COUNT = "update notice set n_count = n_count + 1 where n_seq = ?";

	// 데이터 삭제
	private final String NOTICE_DATA_DELETE = "update notice set n_upload=? where n_seq=?";


	// 글 생성
	public void insertNotice(NoticeVO vo) {
		System.out.println("===> JDBC로 insertNotice() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(NOTICE_INSERT);
			stmt.setString(1, vo.getN_writer());
			stmt.setString(2, vo.getN_title());
			stmt.setString(3, vo.getN_content());
			stmt.setString(4, vo.getFilename());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 수정
	public void updateNotice(NoticeVO vo) {
		System.out.println("===> JDBC로 updateNotice() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(NOTICE_UPDATE);
			stmt.setString(1, vo.getN_title());
			stmt.setString(2, vo.getN_content());
			stmt.setString(3, vo.getFilename());
			stmt.setInt(4, vo.getN_seq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 글 삭제
	public void deleteNotice(NoticeVO vo) {
		System.out.println("===> JDBC로 deleteNotice() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(NOTICE_DELETE);
			stmt.setInt(1, vo.getN_seq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// 공지사항 세부 내용 불러오기
	public NoticeVO getNotice(NoticeVO vo) {
        System.out.println("===> JDBC로 getNotice() 기능 처리");
        NoticeVO notice = null;
        PreparedStatement increaseStmt = null;
        try {
            conn = JDBCUtil.getConnection();
            conn.setAutoCommit(false); // 트랜잭션 시작

            // 조회수 증가
            increaseStmt = conn.prepareStatement(NOTICE_UPDATE_COUNT);
            increaseStmt.setInt(1, vo.getN_seq());
            increaseStmt.executeUpdate();

            stmt = conn.prepareStatement(NOTICE_GET);
            stmt.setInt(1, vo.getN_seq());
            rs = stmt.executeQuery();
            if (rs.next()) {
                notice = new NoticeVO();
                notice.setN_seq(rs.getInt("N_SEQ"));
                notice.setN_writer(rs.getString("N_WRITER"));
                notice.setN_title(rs.getString("N_TITLE"));
                notice.setN_content(rs.getString("N_CONTENT"));
                notice.setN_regDate(rs.getDate("N_REGDATE"));
                notice.setN_count(rs.getInt("N_COUNT"));
                notice.setFilename(rs.getString("N_UPLOAD"));
            }

            conn.commit(); // 트랜잭션 커밋
        } catch (Exception e) {
            try {
                if (conn != null) {
                    conn.rollback(); // 트랜잭션 롤백
                }
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, stmt, null); // conn 닫기 보류
            JDBCUtil.close(increaseStmt, conn); // conn 닫기
        }
        return notice;
    }

	// 글 목록 조회
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		System.out.println("===> JDBC로 getNoticeList() 기능 처리");
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		try {
			conn = JDBCUtil.getConnection();
			if (vo.getSearchCondition().equals("N_TITLE")) {
				stmt = conn.prepareStatement(NOTICE_TITLE);
			} else if (vo.getSearchCondition().equals("N_CONTENT")) {
				stmt = conn.prepareStatement(NOTICE_CONTENT);
			}
			stmt.setString(1, "%" + vo.getSearchKeyword() + "%");
			stmt.setInt(2, vo.getSize());
			stmt.setInt(3, vo.getStart());
			rs = stmt.executeQuery();
			while (rs.next()) {
				NoticeVO notice = new NoticeVO();
				notice.setN_seq(rs.getInt("N_SEQ"));
				notice.setN_title(rs.getString("N_TITLE"));
				notice.setN_writer(rs.getString("N_WRITER"));
				notice.setN_regDate(rs.getDate("N_REGDATE"));
				notice.setN_count(rs.getInt("N_COUNT"));
				noticeList.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return noticeList;
	}
	
	//페이징처리
	public int countNotices(NoticeVO vo) {
		int totalCount = 0;
		try {
			conn = JDBCUtil.getConnection();
			String query = "";
			if (vo.getSearchCondition().equals("N_TITLE")) {
				query = "select count(*) as total from notice where n_title like ?";
			} else if (vo.getSearchCondition().equals("N_CONTENT")) {
				query = "select count(*) as total from notice where n_content like ?";
			}
			stmt = conn.prepareStatement(query);
			stmt.setString(1, "%" + vo.getSearchKeyword() + "%");
			rs = stmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt("total");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return totalCount;
	}

	// 파일 삭제 및 수정
	public void deleteFile(NoticeVO vo) {
		System.out.println("===> JDBC로 deleteFile() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			// 파일 삭제 처리
			String filename = vo.getFilename();
			if (filename != null && !filename.isEmpty()) {
				Path filePath = Paths.get(
						"C:/1kosmosc/sts/work-space/ProjectLBnest_v3/src/main/webapp/notice/imagefile/", filename);
				Files.deleteIfExists(filePath);
			}

			stmt = conn.prepareStatement(NOTICE_DATA_DELETE);
			stmt.setString(1, null);
			stmt.setInt(2, vo.getN_seq());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

}
