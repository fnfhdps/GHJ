package com.guhaejwo.biz.sponsor.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guhaejwo.biz.sponsor.SponsorDTO;
import com.guhaejwo.biz.sponsor.SponsorItemDTO;
import com.guhaejwo.biz.sponsor.SponsorMyPageDTO;
import com.guhaejwo.biz.sponsor.SponsorService;

@Service("sponsorService")
public class SponsorServiceImpl implements SponsorService{

	private SponsorDAO sponsorRepository;
	
	@Autowired
	public SponsorServiceImpl(SponsorDAO sponsorRepository) {
		this.sponsorRepository = sponsorRepository;
	}

	@Override
	public void insertSponsor(SponsorDTO sponsor) {
		sponsorRepository.insertSponsor(sponsor);
	}

	@Override
	public void StateupdateSponsor(SponsorDTO sponsor) {
		sponsorRepository.StateupdateSponsor(sponsor);
	}

	@Override
	public List<SponsorDTO> getSponsorMyPage(SponsorDTO sponsor) {
		return sponsorRepository.getSponsorMyPage(sponsor);
	}

	@Override
	public int sponsorTotalCnt() {
		return sponsorRepository.sponsorTotalCnt();
	}

	@Override
	public List<SponsorDTO> getSponsorList() {
		return sponsorRepository.getSponsorList();
	}

	@Override
	public SponsorDTO getSponsor(SponsorDTO sponsor) {
		return sponsorRepository.getSponsor(sponsor);
	}

	@Override
	public void insertSponsorItem(SponsorItemDTO sponsor) {
		sponsorRepository.insertSponsorItem(sponsor);
	}

	@Override
	public void updateSponsorItem(SponsorItemDTO sponsor) {
		sponsorRepository.updateSponsorItem(sponsor);
	}

	@Override
	public void deleteSponsorItem(SponsorItemDTO sponsor) {
		sponsorRepository.deleteSponsorItem(sponsor);
	}

	@Override
	public int sponsorItemTotalCnt() {
		return sponsorRepository.sponsorItemTotalCnt() ;
	}

	@Override
	public List<SponsorItemDTO> getSponsorItemList() {
		return sponsorRepository.getSponsorItemList();
	}
	
	@Override
	public SponsorItemDTO getSponsorItem(SponsorItemDTO sponsor) {
		return sponsorRepository.getSponsorItem(sponsor);
	}

}
