package com.link.service.feed;

import java.util.List;
import java.util.Map;

import com.link.common.Search;
import com.link.service.domain.Comment;
import com.link.service.domain.Feed;
import com.link.service.domain.Report;

public interface FeedDAO {
	
	
	
	//////////////////////////////////////// Feed

	
	
	// 피드 추가
	public void addFeed(Feed feed) throws Exception;
	
	// 피드 상세
	public Feed getFeed(int feedNo) throws Exception;
	
	// 피드 수정
	public void updateFeed(Feed feed) throws Exception;
	
	// 피드 삭제
	public void deleteFeed(int feedNo) throws Exception;
	
	
	
	//////////////////////////////////////// Feed Comment
	
	
	
	// 피드 댓글 추가
	public void addFeedComment(Comment comment) throws Exception;
	
	// 피드 댓글 수정
	public void updateFeedComment(Comment comment) throws Exception;
	
	// 피드 댓글 삭제
	public void deleteFeedComment(int commentNo) throws Exception;
	
	
	
	//////////////////////////////////////// List
	
	
	// 피드 리스트
	public List<Feed> getFeedList(Map<String, Object> map) throws Exception;
	
	// 피드 댓글 리스트
	public List<Comment> getFeedCommentList(Map<String, Object> map) throws Exception;
	
	
	
	//////////////////////////////////////// Count
	
		
	// 피드 전체 개수
	public int getTotalFeedCount(Search search) throws Exception;
	
	// 피드 댓글 전체 개수
	public int getTotalFeedCommentCount(Search search) throws Exception;
	
	
	
	//////////////////////////////////////// Report
	
	
	// 피드 신고
	public void addFeedReport(Report report) throws Exception;
	
	
	// 피드 댓글 신고
	public void addFeedCommentReport(Report report) throws Exception;
	
	
	
	//////////////////////////////////////// Like
	
	/*
	 * map 안에 feedNo, userId
	 * 
	 * 
	 * 
	 * 
	 */
	
	// 피드 좋아요
	public void addFeedLike(Map<String, Object> map) throws Exception;
	
	// 피드 싫어요
	public void deleteFeedLike(Map<String, Object> map) throws Exception;
	
	// 피드 댓글 좋아요
	public void addFeedCommentLike(Map<String, Object> map) throws Exception;
	
	// 피드 댓글 싫어요
	public void deleteFeedCommentLike(Map<String, Object> map) throws Exception;
	
	// 피드 좋아요 개수
	public int getTotalFeedLike(Map<String, Object> map) throws Exception;
	
	//피드 댓글 좋아요 개수
	public int getTotalFeedCommentLike(Map<String, Object> map) throws Exception;
	
	
	
	//////////////////////////////////////// Push
	
	/*
	 * map 안에 feedNo, userId
	 * 
	 * 
	 * 
	 * 
	 */
	
	public void addFeedPush() throws Exception;
	
	public void addFeedCommentPush() throws Exception;
	
	
	
}
