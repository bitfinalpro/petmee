package kr.co.petmee.repository.dao;

import kr.co.petmee.repository.vo.Member;

public interface LoginDAO {
	Member selectLogin(Member member);
}
