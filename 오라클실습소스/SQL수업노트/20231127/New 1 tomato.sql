
SELECT * FROM member;

edit member;

edit qna;

edit qna_comment;

COMMIT;

SELECT * FROM qna;

SELECT qna_title, qna_content, mem_name
FROM qna, member
WHERE qna.mem_no = member.mem_no;

SELECT qna_title, qna_content, mem_name
FROM qna NATURAL JOIN member;

-- content �޸� �͸� ���
SELECT qna_title, qna_content, mem_name, qc_content
FROM qna, member, qna_comment
WHERE qna.mem_no = member.mem_no 
AND qna.qna_no = qna_comment.qna_no;

-- content �� �޸� �͵� ���
SELECT qna_title, qna_content, mem_name, qc_content
FROM qna, member, qna_comment
WHERE qna.mem_no = member.mem_no 
AND qna.qna_no = qna_comment.qna_no(+);



