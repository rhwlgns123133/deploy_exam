package com.example.dao;

import java.util.ArrayList;

import com.example.dto.Member;
import com.example.dto.Product;
public class MemberRepository {
	private final ArrayList<Member> members = new ArrayList<>();
	private static final MemberRepository instance = new MemberRepository();
	
	public static MemberRepository getInstance() {
		return instance;
	}
	
	public Member getMemberById(String memberId) {
		Member member = null;
		for(Member m: members) {
			if(m.getMemberId().equals(memberId)) {
				//매개 변수와 객체의 Id 가 같으면
				member = m;
				break;
			}
		}
		return member;
	}
	
	public void addMember(Member member) {
		members.add(member);
	}
}
