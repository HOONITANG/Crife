package com.crowd.funding.project.model;

import java.util.List;

import com.crowd.funding.reward.domain.RewardDTO;

public interface ProjectDAO {

	List<ProjectDTO> listProject();

	void add(ProjectDTO dto);

	ProjectDTO pro_detail(int pro_id);

	void save1(ProjectDTO dto);

	String nameSelect(int pro_id);

	int idSelect(String pro_name);

	List<ProjectDTO> my_pro(int mem_idx);

	void my_delete(int pro_id);

	void story_update(ProjectDTO dto);
	//reward 입력받기
	void insertReward(List<RewardDTO> list);
}
