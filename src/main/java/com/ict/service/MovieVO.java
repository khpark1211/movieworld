package com.ict.service;

import org.springframework.web.multipart.MultipartFile;

public class MovieVO{
	private String idx, title, running_time, open_Date, grade, file_name, story, rate;
	
	private MultipartFile m_file;

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRunning_time() {
		return running_time;
	}

	public void setRunning_time(String running_time) {
		this.running_time = running_time;
	}

	public String getOpen_Date() {
		return open_Date;
	}

	public void setOpen_Date(String open_Date) {
		this.open_Date = open_Date;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public MultipartFile getM_file() {
		return m_file;
	}

	public void setM_file(MultipartFile m_file) {
		this.m_file = m_file;
	}

	
	
	
}
