package com.cbt.common;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.cbt.candidate.CandidateDAO;
import com.cbt.candidate.CandidateVO;

@Service("customerUserService")
public class CustomerUserService  implements UserDetailsService{
	
	@Autowired
	CandidateDAO dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		CandidateVO vo = new CandidateVO();
		vo.setTakerId(username);
		vo = dao.commonLogin(vo);
		
		if(vo == null) {
			throw new UsernameNotFoundException("no user");
		}
		
		List<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(vo.getRoleName()));

		CustomerUser user = new CustomerUser(username, vo.getTakerPassword(), auth);
		user.setRoleName(vo.getRoleName());
		return user;
	}
}
