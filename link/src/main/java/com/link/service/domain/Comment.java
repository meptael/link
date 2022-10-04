package com.link.service.domain;

public class Comment {
	
	private int feedNo;						// 피드번호
	private int feedCommentNo;				// 피드댓글번호
	private int clubNo;						// 모임번호
	private int clubPostNo;					// 모임게시물번호
	private int clubPostCommentNo;			// 모임게시물댓글번호
	private User user;						// 작성자의 모든 정보
	private String parentUserId;			// 부모글 작성자
	private String commentContent;			// 댓글내용
	private String commentRegDate;			// 댓글등록날짜
	private String commentUpdateDate;		// 댓글수정날짜
	private int commentLikeCount;			// 댓글 좋아요 수
	private int commentCount;				// 댓글 수
	private String reportCondition;			// 신고여부 0-false 1-true
	private String deleteCondition;			// 삭제여부 0-false 1-true
	private int parent;						// 상위 댓글 번호
	private int depth;						// 댓글 깊이
	private int sequence;					// 댓글 순서
	
	public Comment() {
	}

	public Comment(int feedNo, int feedCommentNo, int clubNo, int clubPostNo, int clubPostCommentNo, User user,
			String parentUserId, String commentContent, String commentRegDate, String commentUpdateDate,
			int commentLikeCount, int commentCount, String reportCondition, String deleteCondition, int parent,
			int depth, int sequence) {
		super();
		this.feedNo = feedNo;
		this.feedCommentNo = feedCommentNo;
		this.clubNo = clubNo;
		this.clubPostNo = clubPostNo;
		this.clubPostCommentNo = clubPostCommentNo;
		this.user = user;
		this.parentUserId = parentUserId;
		this.commentContent = commentContent;
		this.commentRegDate = commentRegDate;
		this.commentUpdateDate = commentUpdateDate;
		this.commentLikeCount = commentLikeCount;
		this.commentCount = commentCount;
		this.reportCondition = reportCondition;
		this.deleteCondition = deleteCondition;
		this.parent = parent;
		this.depth = depth;
		this.sequence = sequence;
	}

	public int getFeedNo() {
		return feedNo;
	}

	public void setFeedNo(int feedNo) {
		this.feedNo = feedNo;
	}

	public int getFeedCommentNo() {
		return feedCommentNo;
	}

	public void setFeedCommentNo(int feedCommentNo) {
		this.feedCommentNo = feedCommentNo;
	}

	public int getClubNo() {
		return clubNo;
	}

	public void setClubNo(int clubNo) {
		this.clubNo = clubNo;
	}

	public int getClubPostNo() {
		return clubPostNo;
	}

	public void setClubPostNo(int clubPostNo) {
		this.clubPostNo = clubPostNo;
	}

	public int getClubPostCommentNo() {
		return clubPostCommentNo;
	}

	public void setClubPostCommentNo(int clubPostCommentNo) {
		this.clubPostCommentNo = clubPostCommentNo;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getParentUserId() {
		return parentUserId;
	}

	public void setParentUserId(String parentUserId) {
		this.parentUserId = parentUserId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentRegDate() {
		return commentRegDate;
	}

	public void setCommentRegDate(String commentRegDate) {
		this.commentRegDate = commentRegDate;
	}

	public String getCommentUpdateDate() {
		return commentUpdateDate;
	}

	public void setCommentUpdateDate(String commentUpdateDate) {
		this.commentUpdateDate = commentUpdateDate;
	}

	public int getCommentLikeCount() {
		return commentLikeCount;
	}

	public void setCommentLikeCount(int commentLikeCount) {
		this.commentLikeCount = commentLikeCount;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public String getReportCondition() {
		return reportCondition;
	}

	public void setReportCondition(String reportCondition) {
		this.reportCondition = reportCondition;
	}

	public String getDeleteCondition() {
		return deleteCondition;
	}

	public void setDeleteCondition(String deleteCondition) {
		this.deleteCondition = deleteCondition;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getSequence() {
		return sequence;
	}

	public void setSequence(int sequence) {
		this.sequence = sequence;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Comment [feedNo=");
		builder.append(feedNo);
		builder.append(", feedCommentNo=");
		builder.append(feedCommentNo);
		builder.append(", clubNo=");
		builder.append(clubNo);
		builder.append(", clubPostNo=");
		builder.append(clubPostNo);
		builder.append(", clubPostCommentNo=");
		builder.append(clubPostCommentNo);
		builder.append(", user=");
		builder.append(user);
		builder.append(", parentUserId=");
		builder.append(parentUserId);
		builder.append(", commentContent=");
		builder.append(commentContent);
		builder.append(", commentRegDate=");
		builder.append(commentRegDate);
		builder.append(", commentUpdateDate=");
		builder.append(commentUpdateDate);
		builder.append(", commentLikeCount=");
		builder.append(commentLikeCount);
		builder.append(", commentCount=");
		builder.append(commentCount);
		builder.append(", reportCondition=");
		builder.append(reportCondition);
		builder.append(", deleteCondition=");
		builder.append(deleteCondition);
		builder.append(", parent=");
		builder.append(parent);
		builder.append(", depth=");
		builder.append(depth);
		builder.append(", sequence=");
		builder.append(sequence);
		builder.append("]");
		return builder.toString();
	}

}
