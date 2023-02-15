package com.guhaejwo.biz.adopt.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guhaejwo.biz.adopt.AdoptBlameDTO;
import com.guhaejwo.biz.adopt.AdoptDTO;
import com.guhaejwo.biz.adopt.AdoptMyPageDTO;
import com.guhaejwo.biz.adopt.AdoptReqDTO;
import com.guhaejwo.biz.adopt.AdoptService;
import com.guhaejwo.biz.paging.Criteria;
import com.guhaejwo.biz.adopt.AdoptHeartDTO;

@Service("adoptService")
public class AdoptServiceImpl implements AdoptService {
	
	private AdoptDAO adoptDAO;
	
	@Autowired
	public AdoptServiceImpl(AdoptDAO adoptDAO) {
		this.adoptDAO = adoptDAO;
	}
	
	@Override
	public void insertBoard(AdoptDTO adopt) {
		adoptDAO.insertBoard(adopt);
	}

	@Override
	public void insertAdopt(AdoptDTO adopt) {
		adoptDAO.insertAdopt(adopt);
	}
	
	@Override
	public void updateBoard(AdoptDTO adopt) {
		adoptDAO.updateBoard(adopt);
	}
	
	@Override
	public void updateAdopt(AdoptDTO adopt) {
		adoptDAO.updateAdopt(adopt);
	}

	@Override
	public void deleteBoard(AdoptDTO adopt) {
		adoptDAO.deleteBoard(adopt);		
	}

	@Override
	public AdoptDTO getAdoptDetail(AdoptDTO adopt) {
		return adoptDAO.getAdoptDetail(adopt);
	}

	@Override
	public List<AdoptDTO> getAdoptList(AdoptDTO adopt) {
		return adoptDAO.getAdoptList(adopt);
	}
	
	@Override
	public List<AdoptDTO> getAdoptListPaging(Criteria cri) {
		return adoptDAO.getAdoptListPaging(cri);
	}

	@Override
	public int getAdoptTotalCount() {
		return adoptDAO.getAdoptTotalCount();
	}
	
	@Override
	public void insertAdoptReq(AdoptReqDTO adopt) {
		adoptDAO.insertAdoptReq(adopt);
	}
	
	@Override
	public AdoptReqDTO hopeCheck(AdoptReqDTO adopt) {
		return adoptDAO.hopeCheck(adopt);
	}
	
	@Override
	public void adoptStateUpdate(AdoptDTO adopt) {
		adoptDAO.adoptStateUpdate(adopt);			
	}

	@Override
    public int getHeart(AdoptHeartDTO heart) {
       return  adoptDAO.getHeart(heart);
    }

    @Override
    public void insertHeart(AdoptHeartDTO heart) {
       adoptDAO.insertHeart(heart);
    }

    @Override
    public void deleteHeart(AdoptHeartDTO heart) {
       adoptDAO.deleteHeart(heart);
    }

    @Override
    public int getBlame(AdoptBlameDTO blame) {
       return adoptDAO.getBlame(blame);
    }

    @Override
    public void insertBlame(AdoptBlameDTO blame) {
       adoptDAO.insertBlame(blame);
    }

    @Override
    public void deleteBlame(AdoptBlameDTO blame) {
       adoptDAO.deleteBlame(blame);
    }

	

	
	   
}
