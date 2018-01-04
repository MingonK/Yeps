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

	public int insertFile(FileDTO dto, String mode) {
		if (mode.equals("main")) {
			return sqlSession.insert("insertMainFile", dto);
		} else {
			return sqlSession.insert("insertFile", dto);
		}
	}

	public FileDTO getFile(String filename, int filenum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("filename", filename);
		map.put("filenum", filenum);
		return sqlSession.selectOne("getFile", map);
	}

	public int deleteFileToFilename(String filename) {
		return sqlSession.delete("deleteFileToFilename", filename);
	}

	public List<FileDTO> getfileListForMe(int evnum, int mnum) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("evnum", evnum);
		map.put("mnum", mnum);
		return sqlSession.selectList("getfileListForMe", map);
	}

	public int updateFileContent(int filenum, String filecontent) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("filenum", filenum);
		map.put("filecontent", filecontent);
		return sqlSession.update("updateFileContent", map);
	}

	public List<FileDTO> getAllEventFiles(int evnum) {
		return sqlSession.selectList("getAllEventFiles", evnum);
	}

	public FileDTO getFYIEventFile(int evnum) {
		return sqlSession.selectOne("getFYIEventFile", evnum);
	}

	public int deleteAllFile(int evnum) {
		return sqlSession.delete("deleteAllFile", evnum);
	}

	public boolean isExistEventMainPhoto(int evnum) {
		try {
			int num = sqlSession.selectOne("isExistEventMainPhoto", evnum);
			if (num > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	public int deleteFile(String filename, int evnum, String ismainphoto) {
		if (ismainphoto.equals("y")) {
			int res = sqlSession.delete("deleteFileToFilename", filename);
			List<FileDTO> list = sqlSession.selectList("getTargetEventFiles", evnum);
			if (list.size() > 0) {
				FileDTO dto = list.get(0);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("filenum", dto.getFilenum());
				map.put("evnum", dto.getEvnum());
				sqlSession.update("setEventMainPhoto", map);
			}
			return res;
		} else {
			return sqlSession.delete("deleteFileToFilename", filename);
		}
	}

	public int changeEventMainPhoto(int evnum, int filenum) {
		int res = sqlSession.update("changeEventMainPhoto", evnum);
		if (res > 0) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("evnum", evnum);
			map.put("filenum", filenum);
			return sqlSession.update("setEventMainPhoto", map);
		} else {
			return 0;
		}
	}

	public List<FileDTO> getPagedEventFiles(int evnum, int start, int end) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("evnum", evnum);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("getPagedEventFiles", map);
	}

	// 레스토랑 파일 필요부분
	public List<FileDTO> getAllRestaurantFiles(int rnum) {
		return sqlSession.selectList("getAllRestaurantFiles", rnum);
	}

	public List<FileDTO> getRest_fileListForMe(int rnum, int mnum) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("rnum", rnum);
		map.put("mnum", mnum);
		return sqlSession.selectList("getRest_fileListForMe", map);
	}

	public boolean isExistRestaurantMainPhoto(int rnum) {
		try {
			int num = sqlSession.selectOne("isExistRestaurantMainPhoto", rnum);
			if (num > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
	
	public int deleteRestaurantFile(String filename, int rnum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("filename", filename);
		map.put("rnum", rnum);
		return sqlSession.delete("deleteRestaurantFile", map);
	}
}
