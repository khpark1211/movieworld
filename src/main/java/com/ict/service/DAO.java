package com.ict.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.Transactional;

public class DAO {
	private SqlSessionTemplate sqlSessionTemplate;
	private DataSourceTransactionManager transactionManager;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public void setTransactionManager(DataSourceTransactionManager transactionManager) {
		this.transactionManager = transactionManager;
	}

	// login
	public MemberVO getLogin(MemberVO mvo) throws Exception {
		return sqlSessionTemplate.selectOne("login", mvo);
	}

	// ID중복확인
	public List<MemberVO> getIdCheak(String mem_id) {
		return sqlSessionTemplate.selectList("idck", mem_id);
	}

	// 회원가입
	public int getSignupOK(MemberVO mvo) throws Exception {
		int res = sqlSessionTemplate.insert("insertMember", mvo);
		return res;
	}

	// ID찾기
	public MemberVO getFindId(MemberVO mvo) throws Exception {
		return sqlSessionTemplate.selectOne("findid", mvo);
	}

	// 전체 게시물의 수
	public int getTotalCount() throws Exception {
		return sqlSessionTemplate.selectOne("totalCount");
	}

	// review list
	public List<BVO> getList(int begin, int end) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("list", map);
	}

	// 리뷰 글 삽입
	public int getInsert(BVO bvo) throws Exception {
		return sqlSessionTemplate.insert("insert_b", bvo);
	}

	// 리뷰 hit업데이트
	public void getHitUpdate(String idx) throws Exception {
		sqlSessionTemplate.update("hit", idx);
	}

	// 리뷰 상세보기
	public BVO getOneList(String idx) throws Exception {
		return sqlSessionTemplate.selectOne("onelist", idx);
	}
	
	//리뷰 삭제
	public void getDelete(String idx) throws Exception{
		sqlSessionTemplate.delete("delete", idx);
	}
	
	//리뷰 수정
	public int getUpdate(BVO bvo) throws Exception{
		return sqlSessionTemplate.update("update", bvo);
	}
	
	//영화 List
	public List<MovieVO> getmovieList() throws Exception{
		return sqlSessionTemplate.selectList("movielist");
	}
	public List<MovieVO> getmovieListsoon() throws Exception{
		return sqlSessionTemplate.selectList("movielistsoon");
	}
	
	public int getMovieInsert(MovieVO movieVO) throws Exception{
		return sqlSessionTemplate.insert("insertmovie",movieVO);
	}
	
	public MovieVO getOnenowList(String idx) throws Exception {
		return sqlSessionTemplate.selectOne("onenowlist", idx);
	}
	public MovieVO getOnenowList2(String idx) throws Exception {
		return sqlSessionTemplate.selectOne("onenowlist2", idx);
	}
}
