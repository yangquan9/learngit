package com.eduask.domain;

import java.util.List;

public class Page {
	private int p;
	private int size;
	private int startLine;
	private int rowCount;
	private int prev;
	private int next;
	private int startPage;
	private int endPage;
	private int maxPage;
	private List list;
	public Page(int p,int size,int rowCount){
		this.p = p;
		this.rowCount = rowCount;
		this.size = size;
		
		this.maxPage = (int) Math.ceil((this.rowCount * 1.0) / this.size);
		if(this.p > this.maxPage) this.p = this.maxPage;
		if(this.p < 1) this.p = 1;
		
		this.prev = this.p - 1;
		this.next = this.p + 1;
		
		this.startLine = (this.p - 1) * this.size;
		
		if(this.maxPage < 10) {
			this.startPage = 1;
			this.endPage = this.maxPage;
		} else {
			this.startPage = this.p - 5;
			this.endPage = this.p + 4;
			
			if(this.startPage < 1) {
				this.startPage = 1;
				this.endPage = 10;
			}
			if(this.endPage > this.maxPage) {
				this.startPage = this.maxPage - 9;
				this.endPage = this.maxPage;
			}
		}
	}
	public Page() {
	}
	public int getP() {
		return p;
	}
	public void setP(int p) {
		this.p = p;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getStartLine() {
		return startLine;
	}
	public void setStartLine(int startLine) {
		this.startLine = startLine;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public int getPrev() {
		return prev;
	}
	public void setPrev(int prev) {
		this.prev = prev;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	
}
