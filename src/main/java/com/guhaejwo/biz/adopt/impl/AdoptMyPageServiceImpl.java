package com.guhaejwo.biz.adopt.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guhaejwo.biz.adopt.AdoptDTO;
import com.guhaejwo.biz.adopt.AdoptHeartDTO;
import com.guhaejwo.biz.adopt.AdoptMyPageDTO;
import com.guhaejwo.biz.adopt.AdoptMyPageService;

@Service("adoptMyPageService")
public class AdoptMyPageServiceImpl implements AdoptMyPageService {
	
	private AdoptMyPageDAO adoptMyPageDAO;
	
	@Autowired
	public AdoptMyPageServiceImpl(AdoptMyPageDAO adoptMyPageDAO) {
		this.adoptMyPageDAO = adoptMyPageDAO;
	}

	@Override
	public List<AdoptDTO> getAdoptMypageList(AdoptDTO adopt) {
		return adoptMyPageDAO.getAdoptMypageList(adopt);
	}

	@Override
	public List<AdoptMyPageDTO> getAdoptHopeList(AdoptMyPageDTO adopt) {
		return adoptMyPageDAO.getAdoptHopeList(adopt);
	}

	@Override
	public List<AdoptMyPageDTO> getAdoptReqList(AdoptMyPageDTO adopt){
		return adoptMyPageDAO.getAdoptReqList(adopt);
	}

	@Override
	public List<AdoptHeartDTO> getHeartListMypage(AdoptHeartDTO adopt) {
		return adoptMyPageDAO.getHeartListMypage(adopt);
	}

}
