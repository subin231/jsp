<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글보기</title>
    <link rel="stylesheet" href="/jboard/css/style.css">    
    
    <script>
    	
    window.onload = function () {
    	
		const commentForm = document.commentForm;
		const commentList = document.getElementsByClassName('commentList');
		
		
		// 동적 이벤트 처리
		document.addEventListener('click', function (e) {
			
			// 수정완료
			if(e.target.classList == 'commentUpdate'){
				e.preventDefault();
				
				const article = e.target.closest('article');
				const textarea = article.querySelector('textarea');
				
				const no = e.target.dataset.no; //하단의 a태그의 data-no로 작성된 속성값 가져오는 문구
				const comment = textarea.value;
				
				const formData = new FormData();
				
				formData.append('no', no);
				formData.append('comment', comment);
				
				
				fetch('/jboard/comment/modify.do', {
					method : 'POST',
					body : formData
				})
				.then(resp => resp.json)
				.then(data => {
					console.log(data);
				})
				.catch(err => {
					console.log(data);
				})
			}
			
			// 수정 & 취소
			if(e.target.classList == 'commentModify'){
				e.preventDefault();
			
				const article = e.target.closest('article');
				const textarea = article.querySelector('textarea');
				content = textarea.value;
				console.log(content);
				
				const mode = e.target.innerText;
				
				if(mode == '수정'){
					textarea.readOnly = false;
					textarea.style.background = 'white';
					textarea.style.border = '1px solid #555';
					textarea.focus();
					e.target.innerText = '취소';
					
				}else{
					textarea.value = content;
					textarea.readOnly = true;
					textarea.style.background = 'transparent';
					textarea.style.border = 'none';
					e.target.innerText = '수정';
				}
				
			}
			
			// 삭제
			if(e.target.classList == 'commentRemove'){
				e.preventDefault();
				
					if(!confirm('정말 삭제하시겠습니까?')){
						return;
					}
					
					const article = e.target.closest('article');
					const no = e.target.dataset.no; //하단의 a태그의 data-no로 작성된 속성값 가져오는 문구
					
					
					
					fetch('/jboard/comment/delete.do?no='+no)
					.then(resp => resp.json())
					.then(data => {
						console.log(data);
						
						if(data.result > 0){
							alert('댓글이 삭제 되었습니다');
							
							// 동적 삭제 처리
							article.remove();
							
						}else{
							alert('댓글이 삭제 실패 되었습니다');
						}
					})
					.catch(err => {
						console.log(err);
					});
				}
			
		});
		
		// 댓글 등록
		commentForm.onsubmit = function(e) {
			e.preventDefault();
			
			const parent = commentForm.parent.value;			
			const writer = commentForm.writer.value;			
			const comment = commentForm.comment.value;			
			
			// 폼 데이터 생성 (사유 : 자바스크립트는 Controller에서 getParameter를 사용불가함)
			const formData = new FormData();
			formData.append("parent", parent);
			formData.append("writer", writer);
			formData.append("comment", comment);
						
			console.log(formData);
			
			fetch('/jboard/comment/write.do', {
				method: 'POST',
				body: formData
			})
			.then(resp => resp.json())
			.then(data => {
				console.log(data);
				if(data != null){
					alert('댓글이 등록되었습니다.');
					
					// 등록한 댓글 동적 태그 생성
					const commentArticle = `<article class="comment">
						                        <span>
						                            <span>\${data.rdate}</span>
						                            <span>\${data.writer}</span>
						                        </span>
						                        <textarea name="comment" readonly>\${data.content}</textarea>
						                        <div>
						                            <a href="#" class="commentRemove">삭제</a>
						                            <a href="#" class="commentModify">수정</a>
						                        </div>
						                    </article>`;
					
					commentList.insertAdjacentHTML('beforeend', commentArticle);
					
					
				}else{
					alert('댓글 등록이 실패했습니다.');
				}
			})
			.catch(err => {
				console.log(err);
			});
			
		}
		
	}
    
    
    </script>
    
    
    
</head>
<body>
    <div id="container">
        <%@ include file="./_header.jsp" %>
        <main>
            <section class="view">
                <h3>글보기</h3>
                <table>
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="title" value="${articleDto.title}" readonly/></td>
                    </tr>
                    <c:if test="${articleDto.file > 0}">
                    <tr>
                        <td>첨부파일</td>
                        <td>
                        <c:forEach var="file" items="${articleDto.files}">
	                        <p style="margin:4px 0">
	                            <a href="/jboard/article/fileDownload.do?fno=${file.fno}">${file.oName}</a>
	                            <span>${file.download}회 다운로드</span>
	                        </p>
                        </c:forEach>
                        </td>
                    </tr>
                    </c:if>
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea name="content" readonly>${articleDto.content}</textarea>
                        </td>
                    </tr>
                </table>
                <div>
                <c:if test="${articleDto.writer == sessUser.uid}">
                    <a href="#" class="btnDelete">삭제</a>
                    <a href="#" class="btnModify">수정</a>
                </c:if>
                    <a href="/jboard/article/list.do" class="btnList">목록</a>
                </div>  
                
                <!-- 댓글리스트 -->
                <section class="commentList">
                    <h3>댓글목록</h3>
                    <c:forEach var ="comment" items="${comments}">
                    <article class="comment">
                        <span>
                            <span>${comment.rdate}</span>
                            <span>${comment.nick}</span>
                        </span>
                        <textarea name="comment" readonly>${comment.content}</textarea>
                        <div>									<!-- 사용자 정의 속성 : data-OO 와 같이 data 뒤에 아무 속성을 기입하여 데이터를 만들어 낼 수 있다. -->
                        <c:if test="${comment.writer == sessUser.uid}">
                            <a href="#" class="commentRemove" data-no="${comment.no}">삭제</a>
                            <a href="#" class="commentModify" data-no="${comment.no}">수정</a>
                            <a href="#" class="commentUpdate" data-no="${comment.no}">완료</a>
                        </c:if>
                        </div>
                    </article>
                    </c:forEach>
                    <c:if test="${empty comments}">
	                    <p class="empty"> 등록된 댓글이 없습니다.</p>
                    </c:if>
                </section>
    
                <!-- 댓글입력폼 -->
                <section class="commentForm">
                    <h3>댓글쓰기</h3>
                    <form name="commentForm">
                    	<input type="hidden" name ="parent" value="${articleDto.no}">
                    	<input type="hidden" name ="writer" value="${sessUser.uid}">
                        <textarea name="comment"></textarea>
                        <div>
                            <a href="#" class="btnCancel">취소</a>
                            <input type="submit" class="btnWrite" value="작성완료"/>
                        </div>
                    </form>
                </section>
    
            </section>
        </main>
        <%@ include file="./_footer.jsp" %>
    </div>
</body>
</html>