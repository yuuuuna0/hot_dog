package com.itwill.hotdog.domain;

public class PageInputDto {
	private int rowCountPerPage;
	private int pageCountPerPage;
	private String selectPage;
	private String searchType;
	private String serarchContent;
	public PageInputDto() {
		
	}
	public PageInputDto(int rowCountPerPage, int pageCountPerPage, String selectPage, String searchType,
			String serarchContent) {
		this.rowCountPerPage = rowCountPerPage;
		this.pageCountPerPage = pageCountPerPage;
		this.selectPage = selectPage;
		this.searchType = searchType;
		this.serarchContent = serarchContent;
	}
	public int getRowCountPerPage() {
		return rowCountPerPage;
	}
	public void setRowCountPerPage(int rowCountPerPage) {
		this.rowCountPerPage = rowCountPerPage;
	}
	public int getPageCountPerPage() {
		return pageCountPerPage;
	}
	public void setPageCountPerPage(int pageCountPerPage) {
		this.pageCountPerPage = pageCountPerPage;
	}
	public String getSelectPage() {
		return selectPage;
	}
	public void setSelectPage(String selectPage) {
		this.selectPage = selectPage;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSerarchContent() {
		return serarchContent;
	}
	public void setSerarchContent(String serarchContent) {
		this.serarchContent = serarchContent;
	}
	
	
	@Override
	public String toString() {
		return "PageInputDto [rowCountPerPage=" + rowCountPerPage + ", pageCountPerPage=" + pageCountPerPage
				+ ", selectPage=" + selectPage + ", searchType=" + searchType + ", serarchContent=" + serarchContent
				+ "]";
	}
}
