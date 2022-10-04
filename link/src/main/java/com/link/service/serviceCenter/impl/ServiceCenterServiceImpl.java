package com.link.service.serviceCenter.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.link.common.Search;
import com.link.service.domain.Notice;
import com.link.service.domain.QandA;
import com.link.service.domain.Report;
import com.link.service.serviceCenter.ServiceCenterDAO;
import com.link.service.serviceCenter.ServiceCenterService;

@Service("ServiceCenterServiceImpl")
public class ServiceCenterServiceImpl implements ServiceCenterService {

	@Autowired
	@Qualifier("ServiceCenterDAOImpl")
	private ServiceCenterDAO serviceCenterDAO;

	public void setNoticeDAO(ServiceCenterDAO serviceCenterDAO) {
		this.serviceCenterDAO = serviceCenterDAO;
	}

	public ServiceCenterServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println("ServiceCenterServiceImpl default Constructor");
	}

	@Override
	public void addNotice(Notice notice) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("\n[ServiceCenterServiceImpl insertNotice start]\n");
		System.out.println(notice);

		serviceCenterDAO.addNotice(notice);
		System.out.println("\n[ServiceCenterServiceImpl insertNotice end]\n");

	}

	@Override
	public Notice getNotice(int noticeNo) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("\n[ServiceCenterServiceImpl findNotice start]\n");

		Notice notice = serviceCenterDAO.getNotice(noticeNo);
		System.out.println("\n[ServiceCenterServiceImpl findNotice end]\n");

		return notice;
	}

	@Override
	public void updateNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("\n[ServiceCenterServiceImpl updateNoticet start]\n");

		List<Notice> list = (List<Notice>) map.get("notice");

		for (int i = 0; i < list.size(); i++) {
			serviceCenterDAO.updateNotice(list.get(i));
		}

		System.out.println("\n[ServiceCenterServiceImpl updateNotice end]\n");

	}

	@Override
	public void getCount(int noticeNo) throws Exception {

		serviceCenterDAO.getCount(noticeNo);
	}

	@Override
	public void deleteNotice(int noticeNo) throws Exception {
		// TODO Auto-generated method stub

	}

//==================================================================여기까지가 Notice	

	@Override
	public Map<String, Object> getReportList(Search search) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("\n[ServiceCenterServiceImpl getReportList start]\n");

		List<Report> list = serviceCenterDAO.getReportList(search);
		
		int a = 0;
		
		int totalCount = serviceCenterDAO.getTotalCount(search, a); 

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", list);
		map.put("totalCount", totalCount);

		System.out.println("\n[ServiceCenterServiceImpl getReportList end]\n");

		return map;

	}

	@Override
	public Map<String, Object> getQandAList(Search search) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("\n[ServiceCenterServiceImpl getQandAList start]\n");

		List<QandA> list = serviceCenterDAO.getQandAList(search);
		
		int a = 1 ;
		
		int totalCount = serviceCenterDAO.getTotalCount(search, a); 

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", list);
		map.put("totalCount", totalCount);

		System.out.println("\n[ServiceCenterServiceImpl getQandAList end]\n");

		return map;

	}

	@Override
	public Map<String, Object> getNoticeList(Search search) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("\n[ServiceCenterServiceImpl getNoticetList start]\n");

		List<Notice> list = serviceCenterDAO.getNoticeList(search);
		int a = 2;
		
		int totalCount = serviceCenterDAO.getTotalCount(search, a); 

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", list);
		map.put("totalCount", totalCount); 

		System.out.println("\n[ServiceCenterServiceImpl getNoticeList end]\n");

		return map;
	}

	// ==================================================================여기까지가 List

	@Override
	public void addQandA(QandA qandA) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("\n[ServiceCenterServiceImpl addQandA start]\n");

		serviceCenterDAO.addQandA(qandA);

		System.out.println("\n[ServiceCenterServiceImpl addQandA end]\n");

	}

	@Override
	public QandA getQandA(int qandANo) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("\n[ServiceCenterServiceImpl getQandA start]\n");

		QandA qandA = serviceCenterDAO.getQandA(qandANo);

		System.out.println("\n[ServiceCenterServiceImpl getQandA end]\n");

		return qandA;
	}

	@Override
	public void updateQandA(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("\n[ServiceCenterServiceImpl updateQandA start]\n");

		List<QandA> list = (List<QandA>) map.get("qandA");

		for (int i = 0; i < list.size(); i++) {
			serviceCenterDAO.updateQandA(list.get(i));
		}

		System.out.println("\n[ServiceCenterServiceImpl updateQandA end]\n");

	}

	@Override
	public void deleteQandA(int qandA) throws Exception {
		// TODO Auto-generated method stub
		serviceCenterDAO.deleteQandA(qandA);
	}
	// ==================================================================여기까지가 QandA
	@Override
	public void addReport(Report report) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("\n[ServiceCenterServiceImpl addReport start]\n");
		
		serviceCenterDAO.addReport(report);
		
		System.out.println("\n[ServiceCenterServiceImpl addReport end]\n");

	}

	@Override
	public Report getReport(int reportNo) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("\n[ServiceCenterServiceImpl getReport start]\n");
		
		Report report = serviceCenterDAO.getReport(reportNo);
		
		System.out.println("\n[ServiceCenterServiceImpl getReport end]\n");
		
		return report;
	}

	@Override
	public void updateReport(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("\n[ServiceCenterServiceImpl updateReport start]\n");

		List<Report> list = (List<Report>) map.get("repot");

		for (int i = 0; i < list.size(); i++) {
			serviceCenterDAO.updateReport(list.get(i));
		}

		System.out.println("\n[ServiceCenterServiceImpl updateReport end]\n");

	}
	// ==================================================================여기까지가 Report
}