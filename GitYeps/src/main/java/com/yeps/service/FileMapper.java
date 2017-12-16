package com.yeps.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeps.model.FileDTO;

@Service
public class FileMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertFile(FileDTO dto) {
		return sqlSession.insert("insertFile", dto);
	}
	
	public FileDTO getFile(String filename, int filenum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("filename", filename);
		map.put("filenum", filenum);
		return sqlSession.selectOne("getFile", map);
	}
	
	public int deleteFile(int filenum) {
		return sqlSession.delete("deleteFile", filenum);
	}
	
	public int updateFileContent(int filenum, String filecontent) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("filenum", filenum);
		map.put("filecontent", filecontent);
		return sqlSession.update("updateFileContent", map);
	}
	
	public List<FileDTO> getTargetEventFiles(int evnum) {
		return sqlSession.selectList("getTargetEventFiles", evnum);
	}
}
