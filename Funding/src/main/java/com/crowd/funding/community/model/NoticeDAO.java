package com.crowd.funding.community.model;

import java.util.List;

import com.crowd.funding.community.model.NoticeDTO;

public interface NoticeDAO {
	public void deleteFile(String fullName);	// ÷������ ����
	public List<String> getAttach(int notice_idx);	// ÷������ ���
	public void addAttach(String fullName);	// ÷������ ����
	public void updateAttach(String fullName, int notice_idx);	// ÷������ ����
	public void insert(NoticeDTO dto) throws Exception;	// �۾���
	public NoticeDTO read(int notice_idx) throws Exception;		// ���б�
	public void update(NoticeDTO dto) throws Exception;	// �ۼ���
	public void delete(int notice_idx) throws Exception;	// �ۻ���
	// ���(������ ������, �˻� ��� ����)
	public List<NoticeDTO> listAll(int start, int end, String search_option, String keyword) throws Exception;
	// ��ȸ�� ���� ó��
	public void increaseViewcnt(int notice_idx) throws Exception;
	// ���ڵ� ���� ���
	public int countArticle(String search_option, String keyword) throws Exception;
}
